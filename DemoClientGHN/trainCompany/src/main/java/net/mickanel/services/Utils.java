package net.mickanel.services;

import java.util.List;

import net.mickanel.model.CustomerSummariesDetail;
import net.mickanel.model.Voyage;

public class Utils {

	/**
	 * Calculate the price of each voyage
	 * 
	 * @return price
	 */
	public static String calculatePriceOfVoyageInCents(String zoneFrom, String zoneTo){
		if (zoneFrom.equals("1") && zoneTo.equals("2")) return "240";
		if (zoneFrom.equals("1") && zoneTo.equals("3")) return "280";
		if (zoneFrom.equals("2") && zoneTo.equals("1")) return "240";
		if (zoneFrom.equals("2") && zoneTo.equals("3")) return "280";
		if (zoneFrom.equals("1") && zoneTo.equals("4")) return "300";
		if (zoneFrom.equals("2") && zoneTo.equals("4")) return "300";
		if (zoneFrom.equals("3") && zoneTo.equals("4")) return "200";
		if (zoneFrom.equals("3") && zoneTo.equals("1")) return "280";
		if (zoneFrom.equals("3") && zoneTo.equals("2")) return "280";
		if (zoneFrom.equals("4") && zoneTo.equals("1")) return "300";
		if (zoneFrom.equals("4") && zoneTo.equals("2")) return "300";
		if (zoneFrom.equals("4") && zoneTo.equals("3")) return "200";
		if (zoneFrom.equals(zoneTo)) return "100"; //Same Zone ???
		return "NotDetermined";
	}
	
	
	/**
	 * Calculate the global price for one Customer
	 * 
	 * @return price
	 */
	public static void calculateGlobalPriceOfVoyagePerCustomer(CustomerSummariesDetail custSumD){
		List<Voyage> vList = custSumD.getVoyages();
		int globalCost = 0;
		int currentCost;
		for (Voyage v :  vList){
			currentCost = Integer.valueOf(v.getCostInCents());
			globalCost += currentCost;
		}
		custSumD.setTotalCostInCents(Integer.toString(globalCost));
	}
	
	
	/**
	 * Mis a jour du coup total dans  CustomerSummariesDetail
	 * 
	 * @param custSummDetail
	 * @param costInCents
	 */
	public static void updateTotalCostInCent(CustomerSummariesDetail custSummDetail, String costInCents) {
		int totalCostInCent = 0;
		if (!custSummDetail.getTotalCostInCents().equals("0")){
			totalCostInCent = Integer.valueOf(custSummDetail.getTotalCostInCents());	
		} 
		totalCostInCent += Integer.valueOf(costInCents);
		custSummDetail.setTotalCostInCents(String.valueOf(totalCostInCent));
	}
	
	public enum wichZone {
		A("1"), B("1"), C("2"), D("2"), E("2"), F("3"), G("4"), H("4"), I("4");
		private String value;

		wichZone(String value) {
			this.value = value;
		}

		public String value() {
			return value;
		}

	}

	/**
	 * Calcul de la zone de tarification d'arrivée en fonction de la gare et de
	 * la zone de départ.
	 * 
	 * @param stationFrom
	 * @param stationTo
	 * @return
	 */
	public static String getZoneForStation(String station) {
		wichZone zone = wichZone.valueOf(station);
		return zone.value;
	}
	
	/**
	 * Calcul de la zone de retour PS: la zone la plus interressante pour le
	 * client est toujours celle qui est sélectionné
	 * 
	 * @param vg
	 * @return
	 */
	public static void getZoneEndForStation(Voyage vg) {
		// Cas du trajet retour
		switch (vg.getStationEnd()) {
		case "A":
			vg.setZoneTo("1");
			break;
		case "B":
			vg.setZoneTo("1");
			break;
		case "C":
			if (vg.getStationStart().contains("A") || vg.getStationStart().contains("B")
					|| vg.getStationStart().contains("D") || vg.getStationStart().contains("E")) {
				vg.setZoneTo("2");
				break;
			} else {
				vg.setZoneTo("3");
				break;
			}
		case "D":
			vg.setZoneTo("2");
			break;
		case "E":
			if (vg.getStationStart().contains("A") || vg.getStationStart().contains("B")
					|| vg.getStationStart().contains("C") || vg.getStationStart().contains("D")) {
				vg.setZoneTo("2");
				break;
			} else {
				vg.setZoneTo("3");
				break;
			}
		case "F":
			if (vg.getStationStart().contains("A") || vg.getStationStart().contains("B")
					|| vg.getStationStart().contains("C") || vg.getStationStart().contains("D")
					|| vg.getStationStart().contains("E")) {
				vg.setZoneTo("3");
				break;
			} else {
				vg.setZoneTo("4");
				break;
			}
		case "G":
			vg.setZoneTo("4");
			break;
		case "H":
			vg.setZoneTo("4");
			break;
		case "I":
			vg.setZoneTo("4");
			break;
			default:
				break;
		}
	}
	
}
