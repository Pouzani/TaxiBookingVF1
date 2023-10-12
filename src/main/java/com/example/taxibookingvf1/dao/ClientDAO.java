package com.example.taxibookingvf1.dao;

import java.sql.SQLException;
import java.util.Set;

import com.example.taxibookingvf1.models.Client;

public interface ClientDAO {
	
	// ajouter Client
	Boolean add(Client client) throws SQLException;
	
	// Modifier Client
	Boolean update(Client client) throws SQLException;
	
	// supprimer
	Boolean deleteByID(Long client_ID) throws SQLException;
	// authentifier
	Client authentifier(String login,String motdepasse) throws SQLException;
	// get all
	Client getOneById(Long client_id) throws SQLException;
	
	Set<Client> getAll() throws SQLException;

}
