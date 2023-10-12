package com.example.taxibookingvf1.dao;

import java.sql.SQLException;

import com.example.taxibookingvf1.models.Gerant;

public interface GerantDAO {
	
	Gerant authentifier(String login,String motdepasse) throws SQLException;
	
	Gerant resetPassword(String login) throws SQLException;
	

}
