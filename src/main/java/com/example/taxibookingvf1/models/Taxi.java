package com.example.taxibookingvf1.models;

public class Taxi {
	
	private Long texi_ID;
	private String marque;
	private String version;
	private String matricule;
	private String couleur;
	
	public Taxi() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Taxi(Long texi_ID, String marque, String version, String matricule, String couleur) {
		super();
		this.texi_ID = texi_ID;
		this.marque = marque;
		this.version = version;
		this.matricule = matricule;
		this.couleur = couleur;
	}

	public Long getTexi_ID() {
		return texi_ID;
	}

	public void setTexi_ID(Long texi_ID) {
		this.texi_ID = texi_ID;
	}

	public String getMarque() {
		return marque;
	}

	public void setMarque(String marque) {
		this.marque = marque;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getMatricule() {
		return matricule;
	}

	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}

	public String getCouleur() {
		return couleur;
	}

	public void setCouleur(String couleur) {
		this.couleur = couleur;
	}

	@Override
	public String toString() {
		return "Taxi [texi_ID=" + texi_ID + ", marque=" + marque + ", version=" + version + ", matricule=" + matricule
				+ ", couleur=" + couleur + "]";
	}
	

}
