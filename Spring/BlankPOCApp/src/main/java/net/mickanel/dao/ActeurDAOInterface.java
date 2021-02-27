package net.mickanel.dao;

import java.util.Collection;

import net.mickanel.business.ActeurImpl;

public interface ActeurDAOInterface {
	public Collection<ActeurImpl> findAllActors();
	public void deleteActeur(String idActeur);
	public void saveActeur(ActeurImpl _act);
}
