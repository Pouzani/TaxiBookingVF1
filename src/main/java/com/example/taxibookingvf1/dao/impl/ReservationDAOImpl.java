package com.example.taxibookingvf1.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeMap;

import com.example.taxibookingvf1.dao.ClientDAO;
import com.example.taxibookingvf1.dao.ReservationDAO;
import com.example.taxibookingvf1.dao.TaxiDAO;
import com.example.taxibookingvf1.dao.factory.Factory;
import com.example.taxibookingvf1.models.Reservation;

public class ReservationDAOImpl implements ReservationDAO{

	static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    private TaxiDAO taxiDao;
    private ClientDAO clientDao;
    
    public ReservationDAOImpl() {
		this.clientDao= new ClientDAOImpl();
		this.taxiDao = new TaxiDAOImpl();
	}
    
	@Override
	public Boolean add(Reservation reservation) throws SQLException {
		Boolean isAdded=false;
		String query = "INSERT INTO reservation (taxi_id, client_id, date_reservation, heureDebut_reservation,minDebut_reservation,heureFin_reservation,minFin_reservation, isValidate) VALUES (?,?,?,?,?,?,?,2)";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setLong(1,reservation.getTaxi().getTexi_ID());
        ps.setLong(2, reservation.getClient().getClient_id());
        ps.setDate(3, java.sql.Date.valueOf(reservation.getDate_reservation()));
        ps.setInt(4, reservation.getHeureDebut_reservation());
        ps.setInt(5, reservation.getMinDebut_reservation());
        ps.setInt(6, reservation.getHeureFin_reservation());
        ps.setInt(7, reservation.getMinFin_reservation());
        if(ps.executeUpdate()>0) {
        	isAdded=true;}
        return isAdded;
	}

	@Override
	public Boolean update(Reservation reservation) throws SQLException {
		String query = "UPDATE reservation SET taxi_id=?, client_id=?, date_reservation=?, heureDebut_reservation=?,minDebut_reservation=?,heureFin_reservation=?,minFin_reservation=?, isValidate=? WHERE res_id=?";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setLong(1,reservation.getTaxi().getTexi_ID());
        ps.setLong(2, reservation.getClient().getClient_id());
        ps.setDate(3, java.sql.Date.valueOf(reservation.getDate_reservation()));
        ps.setInt(4, reservation.getHeureDebut_reservation());
        ps.setInt(5, reservation.getMinDebut_reservation());
        ps.setInt(6, reservation.getHeureFin_reservation());
        ps.setInt(7, reservation.getMinFin_reservation());
        ps.setBoolean(8, false);
        ps.setLong(9,reservation.getRes_id());
        return  ps.executeUpdate()>0;
	}

	@Override
	public Boolean deleteByID(Long res_id) throws SQLException {
		String query = "DELETE FROM reservation WHERE res_id=?";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setLong(1,res_id);
        return  ps.executeUpdate()>0;
	}

	@Override
	public Reservation getOneById(Long res_id) throws SQLException {
		Reservation reservation = new Reservation();
		String query="SELECT * FROM reservation WHERE res_id=?";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		ps.setLong(1, res_id);
		rs=ps.executeQuery();
		while(rs.next()) {
			reservation.setClient(clientDao.getOneById(rs.getLong("client_id")));
			reservation.setTaxi(taxiDao.getOneById(rs.getLong("taxi_id")));
			reservation.setDate_reservation(rs.getDate("date_reservation").toLocalDate());
			reservation.setHeureDebut_reservation(rs.getInt("heureDebut_reservation"));
			reservation.setMinDebut_reservation(rs.getInt("minDebut_reservation"));
			reservation.setHeureFin_reservation(rs.getInt("heureFin_reservation"));
			reservation.setMinFin_reservation(rs.getInt("minFin_reservation"));
			reservation.setIsValidate(rs.getInt("isValidate"));
		}
		return reservation;
		
	}

	@Override
	public Set<Reservation> getAll() throws SQLException {
		Set<Reservation> reservations = new HashSet<>();
		String query="SELECT * FROM reservation";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		while(rs.next()) {
			Reservation reservation = new Reservation();
			reservation.setRes_id(rs.getLong("res_id"));
			reservation.setClient(clientDao.getOneById(rs.getLong("client_id")));
			reservation.setTaxi(taxiDao.getOneById(rs.getLong("taxi_id")));
			reservation.setDate_reservation(rs.getDate("date_reservation").toLocalDate());
			reservation.setHeureDebut_reservation(rs.getInt("heureDebut_reservation"));
			reservation.setMinDebut_reservation(rs.getInt("minDebut_reservation"));
			reservation.setHeureFin_reservation(rs.getInt("heureFin_reservation"));
			reservation.setMinFin_reservation(rs.getInt("minFin_reservation"));
			reservation.setIsValidate(rs.getInt("isValidate"));
			reservations.add(reservation);
		}
		return reservations;
	}

	@Override
	public Boolean setValidationReservation(Long idReservation, int decision) throws SQLException {
		Boolean isValidate=false;
		String query = "UPDATE reservation SET isValidate=? WHERE res_id=?";
		con =Factory.getInstance().getConnection();
        ps = con.prepareStatement(query);
        ps.setLong(1,decision);
        ps.setLong(2,idReservation);
        if(ps.executeUpdate()>0) {
        	isValidate=true;}
        return isValidate;
	}

	@Override
	public int getCountReservation(int validation) throws SQLException {
		
		int count= 0;
		String query="SELECT count(*) FROM reservation WHERE isValidate=? LIMIT 1";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		ps.setLong(1, validation);
		rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		return count;
		
	}

	@Override
	public Set<Reservation> getAllByClient(Long idClient) throws SQLException {
		Set<Reservation> reservations = new HashSet<>();
		String query="SELECT * FROM reservation WHERE client_id=? ";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		ps.setLong(1, idClient);
		rs=ps.executeQuery();
		while(rs.next()) {
			Reservation reservation = new Reservation();
			reservation.setRes_id(rs.getLong("res_id"));
			reservation.setClient(clientDao.getOneById(rs.getLong("client_id")));
			reservation.setTaxi(taxiDao.getOneById(rs.getLong("taxi_id")));
			reservation.setDate_reservation(rs.getDate("date_reservation").toLocalDate());
			reservation.setHeureDebut_reservation(rs.getInt("heureDebut_reservation"));
			reservation.setMinDebut_reservation(rs.getInt("minDebut_reservation"));
			reservation.setHeureFin_reservation(rs.getInt("heureFin_reservation"));
			reservation.setMinFin_reservation(rs.getInt("minFin_reservation"));
			reservation.setIsValidate(rs.getInt("isValidate"));
			reservations.add(reservation);
		}
		return reservations;
	}

	@Override
	public int getCountReservation() throws SQLException {
		
		int count= 0;
		String query="SELECT count(*) FROM reservation";
		con =Factory.getInstance().getConnection();
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		return count;
	}

		@Override
		public TreeMap<String, Integer> getStatistiqueReservation() throws SQLException {
			TreeMap<String, Integer> statistique = new TreeMap<String, Integer>();
			String query="select * from vue_statistique_reservation  WHERE numMoins <="+LocalDate.now().getMonthValue();
			con =Factory.getInstance().getConnection();
			Statement stmt =con.createStatement();
			rs= stmt.executeQuery(query);
			while(rs.next()) {
				statistique.put(rs.getString("mois"),rs.getInt("nbreservation"));
			}
			return statistique;

		}
		
	

}
