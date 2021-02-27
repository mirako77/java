package net.mickanel.business;

import java.util.Date;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.format.annotation.DateTimeFormat;

public class Film {
	private ActeurInterface acteurPrincipale;
	private HashSet<ActeurImpl> acteursSecondaires;

	private String titre;
	private String nbExemplaires;
	
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date dateDeSortie;


	
	@Required
	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getNbExemplaires() {
		return nbExemplaires;
	}

	public void setNbExemplaires(String nbExemplaires) {
		this.nbExemplaires = nbExemplaires;
	}

	public ActeurInterface getActeurPrincipale() {
		return acteurPrincipale;
	}

	public void setActeurPrincipale(ActeurInterface acteurPrincpale) {
		this.acteurPrincipale = acteurPrincpale;
	}
	
	public HashSet<ActeurImpl> getActeursSecondaires() {
		return acteursSecondaires;
	}

	public void setActeursSecondaires(HashSet<ActeurImpl> acteursSecondaires) {
		this.acteursSecondaires = acteursSecondaires;
	}
	
	public Date getDateDeSortie() {
		return dateDeSortie;
	}

	public void setDateDeSortie(Date dateDeSortie) {
		this.dateDeSortie = dateDeSortie;
	}

	public String getTitre() {
		return titre;
	}
	
}
