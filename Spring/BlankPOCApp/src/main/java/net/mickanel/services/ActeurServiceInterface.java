package net.mickanel.services;

import java.util.Collection;

import net.mickanel.business.ActeurImpl;

public interface ActeurServiceInterface {
	
	public Collection<ActeurImpl> getActeursList();
	public void deleteActeur(String idActeur);
	public void saveActeur(ActeurImpl _act);
}
