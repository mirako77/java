package net.mickanel.business;

public class Film3D extends Film {
	private ActeurInterface acteurPrincipale;
	private String titre;
	private String nbExemplaires;

	public String getTitre() {
		return titre;
	}

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
}
