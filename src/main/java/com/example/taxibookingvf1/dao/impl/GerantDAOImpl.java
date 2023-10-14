package com.example.taxibookingvf1.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.example.taxibookingvf1.dao.GerantDAO;
import com.example.taxibookingvf1.dao.factory.Factory;
import com.example.taxibookingvf1.models.Gerant;

public class GerantDAOImpl implements GerantDAO{
	
	
	static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

	@Override
	public Gerant authentifier(String login, String motdepasse) throws SQLException {
		String query="select * from gerant WHERE UPPER(login)=UPPER('"+login+"') and motPasse='"+motdepasse+"' LIMIT 1";
		con =Factory.getInstance().getConnection();
		Statement stmt =con.createStatement();
		rs= stmt.executeQuery(query);
		if(rs.next()) {
			Gerant gerant = new Gerant();
			gerant.setGerant_id(rs.getLong("gerant_id"));
			gerant.setLogin(rs.getString("login"));
			gerant.setMotPasse(rs.getString("motPasse"));
			gerant.setNom(rs.getString("nom"));
			gerant.setPrenom(rs.getString("prenom"));
			con.close();
			return gerant;
		}
		
		return null;
	}

	@Override
	public Gerant resetPassword(String login) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
