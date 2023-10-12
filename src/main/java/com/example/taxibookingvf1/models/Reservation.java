package com.example.taxibookingvf1.models;

import java.time.LocalDate;

public class Reservation {
	
	private Long res_id;
	private Client client ;
	private Taxi taxi;
	private LocalDate date_reservation;
	private Integer heureDebut_reservation ;
	private Integer minDebut_reservation ;
	private Integer heureFin_reservation ;
	private Integer minFin_reservation ;
	private Integer isValidate;
	/**
	 * isValidate = 0 ==> defavorable
	 * isValidate = 1 ==>  favorable
	 * isValidate = 2 ==>  en cours
	 * 
	 */
	
	public Reservation() {
		super();
	}


	public Reservation(Long res_id, Client client, Taxi taxi, LocalDate date_reservation,
			Integer heureDebut_reservation, Integer minDebut_reservation, Integer heureFin_reservation,
			Integer minFin_reservation, Integer isValidate) {
		super();
		this.res_id = res_id;
		this.client = client;
		this.taxi = taxi;
		this.date_reservation = date_reservation;
		this.heureDebut_reservation = heureDebut_reservation;
		this.minDebut_reservation = minDebut_reservation;
		this.heureFin_reservation = heureFin_reservation;
		this.minFin_reservation = minFin_reservation;
		this.isValidate = isValidate;
	}


	public Long getRes_id() {
		return res_id;
	}


	public void setRes_id(Long res_id) {
		this.res_id = res_id;
	}


	public Client getClient() {
		return client;
	}


	public void setClient(Client client) {
		this.client = client;
	}


	public Taxi getTaxi() {
		return taxi;
	}


	public void setTaxi(Taxi taxi) {
		this.taxi = taxi;
	}


	public LocalDate getDate_reservation() {
		return date_reservation;
	}


	public void setDate_reservation(LocalDate date_reservation) {
		this.date_reservation = date_reservation;
	}


	public Integer getHeureDebut_reservation() {
		return heureDebut_reservation;
	}


	public void setHeureDebut_reservation(Integer heureDebut_reservation) {
		this.heureDebut_reservation = heureDebut_reservation;
	}


	public Integer getMinDebut_reservation() {
		return minDebut_reservation;
	}


	public void setMinDebut_reservation(Integer minDebut_reservation) {
		this.minDebut_reservation = minDebut_reservation;
	}


	public Integer getHeureFin_reservation() {
		return heureFin_reservation;
	}


	public void setHeureFin_reservation(Integer heureFin_reservation) {
		this.heureFin_reservation = heureFin_reservation;
	}


	public Integer getMinFin_reservation() {
		return minFin_reservation;
	}


	public void setMinFin_reservation(Integer minFin_reservation) {
		this.minFin_reservation = minFin_reservation;
	}


	public Integer getIsValidate() {
		return isValidate;
	}


	public void setIsValidate(Integer isValidate) {
		this.isValidate = isValidate;
	}


	@Override
	public String toString() {
		return "Reservation [res_id=" + res_id + ", client=" + client + ", taxi=" + taxi + ", date_reservation="
				+ date_reservation + ", heureDebut_reservation=" + heureDebut_reservation + ", minDebut_reservation="
				+ minDebut_reservation + ", heureFin_reservation=" + heureFin_reservation + ", minFin_reservation="
				+ minFin_reservation + ", isValidate=" + isValidate + "]";
	}
	
	


	
}
