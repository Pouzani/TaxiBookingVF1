package com.example.taxibookingvf1.models;

import java.time.LocalDate;

public class Client {
	
	private Long client_id;
	private String nom;
	private String prenom;
	private LocalDate dateNais;
	private String adresse;
	private String login;
	private String motPasse;
	
	
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Client(Long client_id, String nom, String prenom, LocalDate dateNais, String adresse, String login,
			String motPasse) {
		super();
		this.client_id = client_id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNais = dateNais;
		this.adresse = adresse;
		this.login = login;
		this.motPasse = motPasse;
	}


	public Long getClient_id() {
		return client_id;
	}


	public void setClient_id(Long client_id) {
		this.client_id = client_id;
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


	public LocalDate getDateNais() {
		return dateNais;
	}


	public void setDateNais(LocalDate dateNais) {
		this.dateNais = dateNais;
	}


	public String getAdresse() {
		return adresse;
	}


	public void setAdresse(String adresse) {
		this.adresse = adresse;
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
		return "Client [client_id=" + client_id + ", nom=" + nom + ", prenom=" + prenom + ", dateNais=" + dateNais
				+ ", adresse=" + adresse + ", login=" + login + ", motPasse=" + motPasse + "]";
	}
	
	

}
