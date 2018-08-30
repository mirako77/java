package net.mickanel.services;

import java.util.Collection;

import org.apache.log4j.Logger;

import net.mickanel.business.ActeurImpl;
import net.mickanel.dao.ActeurDAOInterface;

public class ActeurService implements ActeurServiceInterface {
	private static Logger log = Logger.getLogger(ActeurService.class);
	
	public ActeurService(){
		log.info("Appel du constructeur de "+this.getClass());
	}
	
	private ActeurDAOInterface acteurDAO;
	
	public ActeurDAOInterface getActeurDAO() {
		return acteurDAO;
	}

	public void setActeurDAO(ActeurDAOInterface acteurDAO) {
		this.acteurDAO = acteurDAO;
	}

	public Collection<ActeurImpl> getActeursList() {
		return acteurDAO.findAllActors();
	}

	public void deleteActeur(String idActeur) {
		acteurDAO.deleteActeur(idActeur);
	}

	@Override
	public void saveActeur(ActeurImpl _act) {
		acteurDAO.saveActeur(_act);
	}

}
