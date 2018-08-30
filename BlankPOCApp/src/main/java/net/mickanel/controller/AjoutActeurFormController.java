package net.mickanel.controller;

import java.util.ArrayList;
import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.mickanel.business.ActeurImpl;
import net.mickanel.services.ActeurServiceInterface;

@Controller
@RequestMapping("/acteur")
public class AjoutActeurFormController{

	private static Logger log = Logger.getLogger(AjoutActeurFormController.class);

	public AjoutActeurFormController(){
		log.info("AjoutActeurFormController: ------control");
	}


	private ActeurServiceInterface service;

	// l'url a appeler au début donc: /acteur/showform.do
	@RequestMapping("/showform")
	protected String showform(@ModelAttribute("ajoutcmd") ActeurImpl _act) throws Exception {
		// nom de la page de retour ajout-form.jsp
		return "acteur/ajout-form";
	}

	@RequestMapping("/ajoute")
	protected String rien(@Valid @ModelAttribute("ajoutcmd") ActeurImpl _act,BindingResult res) throws Exception {
		log.info(res.hasErrors());
		service.saveActeur(_act);
		if (res.hasErrors()) {
			return "acteur/ajout-form";
		}else{
			// nom de la page de retour ajout-ok.jsp
			return "acteur/ajout-ok";
		}
	}

	@RequestMapping("/liste")
	public void listeActeurs(@ModelAttribute("acteurs") ArrayList<ActeurImpl> acteurs){
		acteurs.addAll((ArrayList<ActeurImpl>) service.getActeursList());
	}

	public ActeurServiceInterface getService() {
		return service;
	}

	@Resource(name="acteurService")
	public void setService(ActeurServiceInterface service) {
		log.info(" ============> le service "+service+" a été chargé depuis le contexte Spring.");
		this.service = service;
	}
}
