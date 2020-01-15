package net.mickanel.controleur;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.mickanel.model.CustomerSummaries;
import net.mickanel.model.CustomerSummariesDetail;
import net.mickanel.model.Step;
import net.mickanel.model.Voyage;
import net.mickanel.services.Utils;

/**
 * main class company train management
 *
 */
public class AppTrain {
	private static Logger logger = Logger.getLogger(AppTrain.class);

	public static void main(String[] args) throws IOException {
		// Lecture des donées du fichier
		Map<String, List<Step>> custStepList = fromJson(args[0]);

		// Analyse des différents trajet du(des) voyageur(s)
		CustomerSummaries custSum = new CustomerSummaries(); 
		CustomerSummariesDetail custSumDet = null;
		// Si plusieurs taps
		for (Entry<String, List<Step>> entryStepList : custStepList.entrySet()) {
			List<Step> lstOfAllStep = entryStepList.getValue();
			// Parcours des Steps
			for (Step currentStep : lstOfAllStep) {
				logger.info("current Step Value : " + currentStep.toString());
				int currentStepID = currentStep.getCustomerId();
				
				// Cas du premiers passage ou on doit initialiser custSum
				if (null == custSum.getCustomerSummariesDetailList() ) {
					custSumDet = new CustomerSummariesDetail();
					custSumDet.setCustomerId(currentStepID);
					custSumDet.setTotalCostInCents("0");
					//initialisation du détail d'un client
					initCustSumDetVoyage(custSum, custSumDet, currentStep);
				} else {
					int i = 1;
					//On parcours la liste des custSumDet pour savoir si on modifie ou pas
					for (Entry<Integer, CustomerSummariesDetail> 	entryCustSummDetail
																	: custSum.getCustomerSummariesDetailList()	.entrySet()) {
						if (currentStepID == entryCustSummDetail.getKey()) {
							//mis a jour du voyage correspondant
							updateCustSumDetVoyage(entryCustSummDetail.getValue(), currentStep);
							break;
						} 
						// le CustSumDet de cet Id n'existe pas encore
						if ( custSum.getCustomerSummariesDetailList().size() == i	) {
							initCustSumDetVoyage(custSum, null, currentStep);
						}
						i++;
					}
				}				
			}
		}

		// Persistence des données client
		createCustomerSummaries(custSum);
	}
	/**
	 *  mis a jour du derniers step du Client
	 * 
	 * @param custSummDetail
	 * @param currentStep
	 */
	private static void updateCustSumDetVoyage( CustomerSummariesDetail custSummDetail, Step currentStep) {
				List<Voyage> vListTmp = custSummDetail.getVoyages();
				int index = vListTmp.size() - 1;
				Voyage voyage = vListTmp.get(index);
				// on regarde si c'est un retour
				if (null == voyage.getCostInCents() || voyage.getCostInCents().equals("")) {
					// 1er cas du retour
					// on récup les anciennes valeurs de l'Aller et on compléte avec le Retour
					Voyage newVoyage = new Voyage(voyage.getStationStart(), currentStep.getStation(),
							voyage.getStartedJourneyAt(), "", voyage.getZoneFrom(), "");
					// Calcul de la Zone du retour
					Utils.getZoneEndForStation(newVoyage);
					// Calcul le prix du voyage
					String costInCents = Utils.calculatePriceOfVoyageInCents(newVoyage.getZoneFrom(),
							newVoyage.getZoneTo());
					newVoyage.setCostInCents(costInCents); // maj du cout
					Utils.updateTotalCostInCent(custSummDetail,costInCents);
					vListTmp.set(index, newVoyage); // maj de l'entrée
					// On calcul le cout si celui ci n'est pas renseigné  car le trajet A/R est clot
				} else { // On crée un autre voyage sinon
					String zone = Utils.getZoneForStation(currentStep.getStation());
					Voyage newVoyage = new Voyage(currentStep.getStation(), "", currentStep.getUnixTimestamp(),
																						"", zone, "");
					vListTmp.add(index + 1, newVoyage);
				}
			}
	
	/**
	 *  Initialisation du détail des voyages du client
	 * 
	 * @param custSum
	 * @param custSumDet
	 * @param currentStep
	 */
	private static void initCustSumDetVoyage(
			CustomerSummaries custSum, CustomerSummariesDetail custSumDet, Step currentStep) {
		String zone = Utils.getZoneForStation(currentStep.getStation());
		// je remplis les champs 1, 3, 5 pour la premiére création
		Voyage vTmp = new Voyage(currentStep.getStation(), "", currentStep.getUnixTimestamp(), "", zone,"");
		List<Voyage> vList = new ArrayList<>();
		vList.add(vTmp);
		if ( custSumDet != null ){
			custSumDet.setVoyages(vList);
			HashMap<Integer, CustomerSummariesDetail> custSumDetTmp = new HashMap<>();
			custSumDetTmp.put(Integer.valueOf(currentStep.getCustomerId()), custSumDet);
			custSum.setCustomerSummariesDetailList(custSumDetTmp);
		} else {
			custSumDet = new CustomerSummariesDetail();
			custSumDet.setVoyages(vList);
			custSumDet.setCustomerId(currentStep.getCustomerId());
			custSumDet.setTotalCostInCents("0");
			custSum.getCustomerSummariesDetailList().put(Integer.valueOf(currentStep.getCustomerId()), custSumDet);
		}
	}

	private static String readfileLineByLine(String location) throws IOException {
		StringBuilder jsonRespTmp = new StringBuilder();
		Path path = Paths.get(location);
		try {
			BufferedReader reader = Files.newBufferedReader(path, StandardCharsets.UTF_8);
			String line = reader.readLine();
			while (line != null) {
				logger.info(line);
				jsonRespTmp.append(line);
				// read next line
				line = reader.readLine();
			}
			reader.close();
		} catch (IOException e) {
			logger.error(e);
		} 
		return jsonRespTmp.toString();
	}

	public static Map<String, List<Step>> fromJson(String location) throws IOException {
		// lecture du fichier JSON
		String fileContent = readfileLineByLine(location);
		HashMap<String, List<Step>> stepList = null;
		logger.info("JSon content : " + fileContent);

		TypeReference<HashMap<String, List<Step>>> stepsList = new TypeReference<HashMap<String, List<Step>>>() {};
		try {
			stepList = new ObjectMapper().readValue(fileContent, stepsList);
		} catch (IOException e) {
			logger.error("Veuillez vérifier le format du JSON !!! JsonParseException : " + e);
		}

		logger.debug("Java Object created from JSON String ");
		logger.debug("JSON String : " + fileContent);
		logger.debug("Java Object : " + stepList);

		return stepList;
	}

	/**
	 * Génére un fichier Json avec les informations du client en param
	 * 
	 * @param custSum
	 */
	public static void createCustomerSummaries(CustomerSummaries custSum) {
		ObjectMapper mapper = new ObjectMapper();
		
		// Java objects to JSON file
		try {
			mapper.writeValue(new File("candidateOutput.txt"), custSum);
		} catch (JsonGenerationException e) {
			logger.error(e);
		} catch (JsonMappingException e) {
			logger.error(e);
		} catch (IOException e) {
			logger.error(e);
		}
	}

}
