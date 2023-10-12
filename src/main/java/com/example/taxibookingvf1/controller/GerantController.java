package com.example.taxibookingvf1.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import java.util.TreeMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.taxibookingvf1.dao.ClientDAO;
import com.example.taxibookingvf1.dao.GerantDAO;
import com.example.taxibookingvf1.dao.ReservationDAO;
import com.example.taxibookingvf1.dao.TaxiDAO;
import com.example.taxibookingvf1.dao.impl.ClientDAOImpl;
import com.example.taxibookingvf1.dao.impl.GerantDAOImpl;
import com.example.taxibookingvf1.dao.impl.ReservationDAOImpl;
import com.example.taxibookingvf1.dao.impl.TaxiDAOImpl;
import com.example.taxibookingvf1.models.Gerant;
import com.example.taxibookingvf1.models.Taxi;
/**
 * Servlet implementation class GerantController
 */
@WebServlet("/GerantController")
public class GerantController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private GerantDAO gerantDAO;
	private ReservationDAO reservationDAO;
	private ClientDAO clientDAO;
	private TaxiDAO taxiDAO;
	
	
    public GerantController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	this.gerantDAO = new GerantDAOImpl();
    	this.reservationDAO = new ReservationDAOImpl();
    	this.clientDAO= new ClientDAOImpl();
    	this.taxiDAO=new TaxiDAOImpl();
    	super.init();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		/*
		 * OPTIONS 
		 */
		String choix_Login = request.getParameter("login");
		String choix_Reservation=request.getParameter("reservation");
		String choix_ValidationRservationId = request.getParameter("id");
		String choix_ValidationRservationFABORABLE = request.getParameter("FABORABLE");
		String choix_clients = request.getParameter("clients");
		String choix_taxis = request.getParameter("taxis");
		String choix_saveTaxi = request.getParameter("saveTaxi");
		String choix_modifierTaxi=request.getParameter("modifierTaxi");
		String choix_savemodifierTaxi=request.getParameter("updateTaxi");
		String choix_dashboard=request.getParameter("dashboard");
		String choix_logout=request.getParameter("logout");
		
		HttpSession session=request.getSession();
		/*
		 * Traitemant Login EVENT
		 */
		if(choix_Login!=null) {
			String login = request.getParameter("inputlogin");
			String motPasse = request.getParameter("inputpassword");
			Optional<Gerant> gerant=null;
			if(login!=null && motPasse!=null) {
				
				gerant = Optional.ofNullable(this.gerantDAO.authentifier(login, motPasse));
				if(gerant.isPresent()) {
					// Create session
					session.setAttribute("gerant", gerant.get());
					// GET STATISTIC
					session.setAttribute("count_Reservation_encours", reservationDAO.getCountReservation(2));
					session.setAttribute("count_Reservation_favorable", reservationDAO.getCountReservation(1));
					session.setAttribute("count_Reservation_defavorable", reservationDAO.getCountReservation(0));
					session.setAttribute("count_Reservation", reservationDAO.getCountReservation());
					TreeMap<String, Integer> statistiques = new TreeMap<String, Integer>();
					statistiques.putAll(reservationDAO.getStatistiqueReservation());
					session.setAttribute("chart_Reservation_mois1", statistiques.get("Janvier"));
					session.setAttribute("chart_Reservation_mois2", statistiques.get("F�vrier"));
					session.setAttribute("chart_Reservation_mois3", statistiques.get("Mars"));
					session.setAttribute("chart_Reservation_mois4", statistiques.get("Avril"));
					session.setAttribute("chart_Reservation_mois5", statistiques.get("Mai"));
					session.setAttribute("chart_Reservation_mois6", statistiques.get("Juin"));
					session.setAttribute("chart_Reservation_mois7", statistiques.get("Juillet"));
					session.setAttribute("chart_Reservation_mois8", statistiques.get("Aout"));
					session.setAttribute("chart_Reservation_mois9", statistiques.get("Sept"));
					session.setAttribute("chart_Reservation_mois10", statistiques.get("Oct"));
					session.setAttribute("chart_Reservation_mois11", statistiques.get("Nov"));
					session.setAttribute("chart_Reservation_mois12", statistiques.get("Dece"));
					session.setAttribute("chart_Reservation_count", statistiques.values());
					
					// redirection to Home Admin Page
					
					request.getServletContext().getRequestDispatcher("/adminIndex.jsp").forward(request, response);
					}
				// echec authentific
					else {request.setAttribute("dangerMsg","login ou mot de passe incorrect");
					request.getServletContext().getRequestDispatcher("/adminLogin.jsp").forward(request, response);}
			}
		}
		
		else if(session.getAttribute("gerant")!=null && choix_dashboard!=null) {
			// redirection to Home Admin Page
			request.getServletContext().getRequestDispatcher("/adminIndex.jsp").forward(request, response);
		}
		
		/*
		 * Reservation
		 * 
		 */
		else if (session.getAttribute("gerant")!=null && choix_Reservation!=null) {
			

			request.setAttribute("reservations", reservationDAO.getAll());
			
			request.getServletContext().getRequestDispatcher("/adminReservation.jsp").forward(request, response);
		}
		/*
		 * Validation Reservation
		 * 
		 */
		else if (session.getAttribute("gerant")!=null && choix_ValidationRservationId!=null && choix_ValidationRservationFABORABLE!=null) {
			int a=-1;
			if(choix_ValidationRservationFABORABLE.matches("true")) {
				a=1;
			}
			else if(choix_ValidationRservationFABORABLE.matches("false")) {
				a=0;
			}
			if(a>-1) {
			this.reservationDAO.setValidationReservation(Long.parseLong(choix_ValidationRservationId), a);
			
			}
			
			request.setAttribute("reservations", reservationDAO.getAll());
			
			request.getServletContext().getRequestDispatcher("/adminReservation.jsp").forward(request, response);
			
		}
		/*
		 * Gestion Client
		 * 
		 */
		else if (session.getAttribute("gerant")!=null && choix_clients!=null) {
			
			request.setAttribute("clients", clientDAO.getAll());
			
			request.getServletContext().getRequestDispatcher("/adminClients.jsp").forward(request, response);
		}
		/*
		 * Taxis
		 */
		else if(session.getAttribute("gerant")!=null && choix_taxis!=null) {
			
			request.setAttribute("taxis", taxiDAO.getAll());
			request.getServletContext().getRequestDispatcher("/adminTaxis.jsp").forward(request, response);
		}
		/*
		 * save taxi
		 * 
		 */
		else if(session.getAttribute("gerant")!=null && choix_saveTaxi!=null) {
			
			String marque=request.getParameter("inputmarque");
			String version=request.getParameter("inputversion");
			String matricule=request.getParameter("inputmatricule");
			String couleur=request.getParameter("selectcouleur");
			
			if(marque!=null && version!=null && matricule!=null && couleur!=null) {
				if(taxiDAO.add(new Taxi(null, marque, version, matricule, couleur))) {
					request.setAttribute("taxis", taxiDAO.getAll());
					request.setAttribute("successMsg", "Opr�ration Bien Effectu�e");
					request.getServletContext().getRequestDispatcher("/adminTaxis.jsp").forward(request, response);
				}
				else {request.setAttribute("dangerMsg","login ou mot de passe incorrect");
					request.getServletContext().getRequestDispatcher("/adminTaxis.jsp").forward(request, response);
				}
			}
			
		}
		/*
		 * GET Modifier Taxi
		 * 
		 */
		else if (session.getAttribute("gerant")!=null && choix_modifierTaxi!=null) {
			Long idTaxi=Long.parseLong(choix_modifierTaxi);
			Optional<Taxi> taxi =null;
			taxi=Optional.ofNullable(taxiDAO.getOneById(idTaxi));
			
			if(taxi.isPresent()) {
				request.setAttribute("inputmarque", taxi.get().getMarque());
				request.setAttribute("inputversion", taxi.get().getVersion());
				request.setAttribute("inputmatricule", taxi.get().getMatricule());
				request.setAttribute("selectcouleur", taxi.get().getCouleur());
				request.setAttribute("idTaxi", taxi.get().getTexi_ID());
				request.setAttribute("taxis", taxiDAO.getAll());
				
				request.getServletContext().getRequestDispatcher("/adminTaxis.jsp").forward(request, response);
				
			}
			
		}
		/*
		 * SAVE modifer Taxi
		 * 
		 */
		else if(session.getAttribute("gerant")!=null && choix_savemodifierTaxi!=null) {
			
			String marque=request.getParameter("inputmarque");
			String version=request.getParameter("inputversion");
			String matricule=request.getParameter("inputmatricule");
			String couleur=request.getParameter("selectcouleur");
			String idTaxi=request.getParameter("idTaxi");
			
			if(marque!=null && version!=null && matricule!=null && couleur!=null && idTaxi!=null) {
				if(taxiDAO.update(new Taxi(Long.parseLong(idTaxi) , marque, version, matricule, couleur))) {
					request.setAttribute("taxis", taxiDAO.getAll());
					request.setAttribute("successMsg", "Opr�ration Bien Effectu�e");
					request.getServletContext().getRequestDispatcher("/adminTaxis.jsp").forward(request, response);
				}
				else {request.setAttribute("dangerMsg","login ou mot de passe incorrect");
					request.getServletContext().getRequestDispatcher("/adminTaxis.jsp").forward(request, response);
				}
			}
			
		}
		// logout ADmin
		else if (session.getAttribute("gerant")!=null && choix_logout!=null) {
			session.removeAttribute("client");
			session.invalidate();
			request.getServletContext().getRequestDispatcher("/adminLogin.jsp").forward(request, response);
		}
		
		else{
			if(session.getAttribute("gerant")!=null) {
				// redirection to Home Admin Page
				request.getServletContext().getRequestDispatcher("/adminIndex.jsp").forward(request, response);
			}
			else {
				request.getServletContext().getRequestDispatcher("/adminLogin.jsp").forward(request, response);}
			
		}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
