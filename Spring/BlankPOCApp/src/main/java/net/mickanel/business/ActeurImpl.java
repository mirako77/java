package net.mickanel.business;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class ActeurImpl implements ActeurInterface {
	/*
	 * Constructeur
	 */
	public ActeurImpl() {
		super();
		System.out.println("ActeurImpl :: constructeur par défaut");
	}
	
	public ActeurImpl(String nom) {
		super();
		System.out.println("ActeurImpl :: constructeur nom");
		this.nom = nom;
//		this.prenom = prenom;
	}
	
	public ActeurImpl(String nom, String prenom) {
		super();
		System.out.println("ActeurImpl :: constructeur nom+prenom");
		this.nom = nom;
		this.prenom = prenom;
	}
	
	/*
	 * Attribut
	 */
	private int identifiant;
	
	@NotEmpty(message = "Le nom est obligatoire")
	@Length(max=10, message = "Votre nom ne doit pas dépasser 10")
	private String nom;
	
	@Length(max=20, message = "Votre prénom ne doit pas dépasser 20")
	private String prenom;
	
	public String nomme() {
		return nom + " " + prenom;
	}
	
	/*
	 * Getter / Setter
	 */
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public int getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(int identifiant) {
		this.identifiant = identifiant;
	}	
}
