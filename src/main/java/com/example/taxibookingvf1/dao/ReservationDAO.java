package com.example.taxibookingvf1.dao;

import java.sql.SQLException;
import java.util.Set;
import java.util.TreeMap;

import com.example.taxibookingvf1.models.Reservation;

public interface ReservationDAO {
	
	
	Boolean add(Reservation reservation) throws SQLException;
	
	Boolean update(Reservation reservation) throws SQLException;
	
	Boolean setValidationReservation(Long idReservation,int decision) throws SQLException;
	
	int getCountReservation(int validation) throws SQLException;
	
	int getCountReservation() throws SQLException;
	
	Set<Reservation> getAllByClient(Long idClient) throws SQLException;
	
	Boolean deleteByID(Long res_id) throws SQLException;
	
	Reservation getOneById(Long res_id) throws SQLException;
	
	Set<Reservation> getAll() throws SQLException;
	
	TreeMap<String, Integer> getStatistiqueReservation() throws SQLException ;

}
