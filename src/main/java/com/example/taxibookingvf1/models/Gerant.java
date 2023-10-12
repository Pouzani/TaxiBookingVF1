package com.example.taxibookingvf1.models;



public class Gerant {
	private Long gerant_id;
	private String nom;
	private String prenom;
	private String login;
	private String motPasse;
	
	public Gerant() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Gerant(Long gerant_id, String nom, String prenom, String login, String motPasse) {
		super();
		this.gerant_id = gerant_id;
		this.nom = nom;
		this.prenom = prenom;
		this.login = login;
		this.motPasse = motPasse;
	}
	
	public Long getGerant_id() {
		return gerant_id;
	}
	public void setGerant_id(Long gerant_id) {
		this.gerant_id = gerant_id;
	}
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
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getMotPasse() {
		return motPasse;
	}
	public void setMotPasse(String motPasse) {
		this.motPasse = motPasse;
	}

	@Override
	public String toString() {
		return "Gerant [gerant_id=" + gerant_id + ", nom=" + nom + ", prenom=" + prenom + ", login=" + login
				+ ", motPasse=" + motPasse + "]";
	}
	
	
	

}
