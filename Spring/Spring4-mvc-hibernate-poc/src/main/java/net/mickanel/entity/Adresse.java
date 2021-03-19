package net.mickanel.entity;

import java.math.BigInteger;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name="Adresse")
public class Adresse {
	
	public Adresse() {
	}
	
	// Constructor with id
	public Adresse(long id) {
		this.adresseId = id;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)

	private long adresseId;
	
	private int numero;
	
	private String rue;
	
	private BigInteger codePostal;
	
	private String pays;
	
	private String ville;
	
	@Basic
	private java.time.LocalDate createdDate;

	public long getAdresseId() {
		return adresseId;
	}

	public void setAdresseId(long adresseId) {
		this.adresseId = adresseId;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getRue() {
		return rue;
	}

	public void setRue(String rue) {
		this.rue = rue;
	}

	public BigInteger getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(BigInteger codePostal) {
		this.codePostal = codePostal;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public java.time.LocalDate getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(java.time.LocalDate createdDate) {
		this.createdDate = createdDate;
	}	
}
