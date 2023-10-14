package com.example.taxibookingvf1.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.sql.PreparedStatement;

import com.example.taxibookingvf1.dao.TaxiDAO;
import com.example.taxibookingvf1.dao.factory.Factory;
import com.example.taxibookingvf1.models.Taxi;


public class TaxiDAOImpl implements TaxiDAO{
	
	static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    
	@Override
	public Boolean add(Taxi taxi) throws SQLException {
		Boolean isAdded=false;
		String query = "INSERT INTO taxi (marque, version, matricule,couleur) VALUES (?,?,?,?)";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setString(1, taxi.getMarque());
        ps.setString(2, taxi.getVersion());
        ps.setString(3, taxi.getMatricule());
        ps.setString(4, taxi.getCouleur());
        if(ps.executeUpdate()>0) {
        	isAdded=true;}
        return isAdded;
        
        
	}
	@Override
	public Taxi getOneById(Long taxi_ID) throws SQLException {
		
		String query="SELECT * FROM taxi WHERE taxi_id=? LIMIT 1";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		ps.setLong(1, taxi_ID);
		rs=ps.executeQuery();
		if(rs.next()) {
			Taxi taxi = new Taxi();
			taxi.setCouleur(rs.getString("couleur"));
			taxi.setMarque(rs.getString("marque"));
			taxi.setMatricule(rs.getString("matricule"));
			taxi.setVersion(rs.getString("version"));
			taxi.setTexi_ID(rs.getLong("taxi_id"));
			return taxi;
		}
		return null;
		
	}
	@Override
	public Set<Taxi> getAll() throws SQLException {
		Set<Taxi> taxis = new HashSet<Taxi>();
		String query="SELECT * FROM taxi";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		while(rs.next()) {
			
			taxis.add(new Taxi(rs.getLong("taxi_id"), rs.getString("marque"), rs.getString("version"), rs.getString("matricule"), rs.getString("couleur")));
		}
		return taxis;
		
	}
	@Override
	public Boolean update(Taxi taxi) throws SQLException {
		Boolean isValidate=false;
		String query = "UPDATE taxi SET marque = ?, version=?, matricule=?,couleur=? WHERE taxi_id=?";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setString(1, taxi.getMarque());
        ps.setString(2, taxi.getVersion());
        ps.setString(3, taxi.getMatricule());
        ps.setString(4, taxi.getCouleur());
        ps.setLong(5, taxi.getTexi_ID());
        if(ps.executeUpdate()>0) {
        	isValidate=true;}
        return isValidate;
	}
	@Override
	public Boolean deleteByID(Long taxi_id) throws SQLException {
		String query = "DELETE FROM taxi WHERE taxi_id=?";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setLong(1, taxi_id);
        return  ps.executeUpdate()>0;
	}
	@Override
	public Set<Taxi> getAvailibleTaxi(LocalDate dateResevation, int heureDebut, int minDebut)
			throws SQLException {
		Set<Taxi> taxis = new HashSet<Taxi>();
		String query="select * from taxi WHERE taxi.taxi_id NOT IN (SELECT vue_reservation_details.taxi_id FROM vue_reservation_details WHERE vue_reservation_details.date_reservation='"+java.sql.Date.valueOf(dateResevation)+"' and "+((heureDebut*60)+minDebut)+" BETWEEN ((vue_reservation_details.heureDebut_reservation*60)+vue_reservation_details.minDebut_reservation) and ((vue_reservation_details.heureFin_reservation*60)+vue_reservation_details.minFin_reservation) )";
		con =Factory.getInstance().getConnection();
		Statement stmt =con.createStatement();
		rs= stmt.executeQuery(query);
		//ps.setDate(1, java.sql.Date.valueOf(dateResevation));
		//ps.setInt(2, ((heureDebut*60)+minDebut));
		//rs=ps.executeQuery();
		while(rs.next()) {
			
			taxis.add(new Taxi(rs.getLong("taxi_id"), rs.getString("marque"), rs.getString("version"), rs.getString("matricule"), rs.getString("couleur")));
		}
		return taxis;
	}
	
	

}
