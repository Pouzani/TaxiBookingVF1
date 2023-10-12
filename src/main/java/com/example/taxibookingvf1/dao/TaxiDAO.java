package com.example.taxibookingvf1.dao;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Set;

import com.example.taxibookingvf1.models.Taxi;

public interface TaxiDAO {
	
	
	Boolean add(Taxi taxi) throws SQLException;
	
	Boolean update(Taxi taxi) throws SQLException;
	
	Boolean deleteByID(Long taxi_ID) throws SQLException;
	
	
	Taxi getOneById(Long taxi_ID) throws SQLException;
	
	Set<Taxi> getAll() throws SQLException;
	
	Set<Taxi> getAvailibleTaxi(LocalDate dateResevation,int heureDebut,int minDebut) throws SQLException;
}
