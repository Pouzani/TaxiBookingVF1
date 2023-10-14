package com.example.taxibookingvf1.controller;

import com.example.taxibookingvf1.dao.ClientDAO;
import com.example.taxibookingvf1.dao.ReservationDAO;
import com.example.taxibookingvf1.dao.TaxiDAO;
import com.example.taxibookingvf1.dao.impl.ClientDAOImpl;
import com.example.taxibookingvf1.dao.impl.ReservationDAOImpl;
import com.example.taxibookingvf1.dao.impl.TaxiDAOImpl;
import com.example.taxibookingvf1.models.Client;
import com.example.taxibookingvf1.models.Reservation;
import com.example.taxibookingvf1.models.Taxi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class ClientController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    TaxiDAO taxiDAO;
    ClientDAO clientDAO;
    ReservationDAO reservationDAO;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientController() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
        // TODO Auto-generated method stub
        this.taxiDAO = new TaxiDAOImpl();
        this.clientDAO = new ClientDAOImpl();
        this.reservationDAO = new ReservationDAOImpl();
        super.init();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        try {
            HttpSession session = request.getSession();
            String SearcheavailibleTaxi = request.getParameter("SearcheavailibleTaxi");

            String connexionClient = request.getParameter("connexion");

            String singup = request.getParameter("singup");

            String save_reservation = request.getParameter("save_reservation");

            String saveClient = request.getParameter("saveClient");

            System.out.println("*********************************actions*********************************");
            System.out.println(SearcheavailibleTaxi);
            System.out.println(connexionClient);
            System.out.println(singup);
            System.out.println(save_reservation);
            System.out.println(saveClient);


            /*
             *
             *
             * Searche availible Taxi
             */
            if (SearcheavailibleTaxi != null) {


                Integer heureDebut = null, minDebut = null, heureFin = null, minFin = null;


                String dateReservation = null;

                if (!request.getParameter("inputDateReservation").isBlank()) {
                    dateReservation = request.getParameter("inputDateReservation");
                }

                if (!request.getParameter("inputHeureDebut").isBlank()) {
                    heureDebut = Integer.parseInt(request.getParameter("inputHeureDebut"));
                }

                if (!request.getParameter("inputMinDebut").isBlank()) {
                    minDebut = Integer.parseInt(request.getParameter("inputMinDebut"));
                }
                if (!request.getParameter("inputHeureFin").isBlank()) {
                    heureFin = Integer.parseInt(request.getParameter("inputHeureFin"));
                }
                if (!request.getParameter("inputMinFin").isBlank()) {
                    minFin = Integer.parseInt(request.getParameter("inputMinFin"));
                }


                Set<Taxi> taxis = new HashSet<Taxi>();
                if (dateReservation != null && heureDebut != null && minDebut != null) {
                    taxis.addAll(this.taxiDAO.getAvailibleTaxi(LocalDate.parse(dateReservation), heureDebut, minDebut));
                }

                request.setAttribute("taxis", taxis);
                request.setAttribute("inputDateReservation", dateReservation);
                request.setAttribute("inputHeureDebut", heureDebut);
                request.setAttribute("inputMinDebut", minDebut);
                request.setAttribute("inputHeureFin", heureFin);
                request.setAttribute("inputMinFin", minFin);
            }
            /*
             *
             *
             *
             *  Traitement evenement authentifiaction
             */
            else if (connexionClient != null) {

                System.out.println("*********************************connexionClient*********************************");

                // Get value from Login Modul
                String login = request.getParameter("inputlogin");
                String motPasse = request.getParameter("inputpassword");
                Optional<Client> client = null;
                Integer heureDebut = null, minDebut = null, heureFin = null, minFin = null;

                if (!login.isBlank() && !motPasse.isBlank()) {
                    client = Optional.ofNullable(this.clientDAO.authentifier(login, motPasse));
                    if (client.isPresent()) {
                        // Create session
                        session.setAttribute("client", client.get());
                        session.setAttribute("reservations", reservationDAO.getAllByClient(client.get().getClient_id()));
                        request.setAttribute("successMsg", "Bienvenue " + client.get().getNom() + " " + client.get().getPrenom());
                    } else {
                        request.setAttribute("dangerMsg", "login ou mot de passe incorrect");
                    }

                } else {
                    request.setAttribute("dangerMsg", "login ou mot de passe est vide");
                }


                String dateReservation = request.getParameter("inputDateReservation");

                if (!request.getParameter("inputHeureDebut").isBlank()) {
                    heureDebut = Integer.parseInt(request.getParameter("inputHeureDebut"));
                }

                if (!request.getParameter("inputMinDebut").isBlank()) {
                    minDebut = Integer.parseInt(request.getParameter("inputMinDebut"));
                }
                if (!request.getParameter("inputHeureFin").isBlank()) {
                    heureFin = Integer.parseInt(request.getParameter("inputHeureFin"));
                }
                if (!request.getParameter("inputMinFin").isBlank()) {
                    minFin = Integer.parseInt(request.getParameter("inputMinFin"));
                }


                Set<Taxi> taxis = new HashSet<Taxi>();
                if (heureDebut != null && minDebut != null) {
                    taxis.addAll(this.taxiDAO.getAvailibleTaxi(LocalDate.parse(dateReservation), heureDebut, minDebut));
                }

                request.setAttribute("taxis", taxis);

                if (request.getParameter("taxiId") != null) {
                    Long taxiId = Long.parseLong(request.getParameter("taxiId"));
                    request.setAttribute("taxiId", taxiId);
                }

                if (request.getParameter("taxiId") != null) {
                    Long clientid = Long.parseLong(request.getParameter("clientid"));
                    request.setAttribute("clientid", clientid);
                }

                request.setAttribute("inputDateReservation", dateReservation);
                request.setAttribute("inputHeureDebut", heureDebut);
                request.setAttribute("inputMinDebut", minDebut);
                request.setAttribute("inputHeureFin", heureFin);
                request.setAttribute("inputMinFin", minFin);

            }
            /*
             *
             *  Traitement de la partie  SAVE RESERVATION
             */
            else if (save_reservation != null) {
                System.out.println("*********************************SAVE RESERVATION*********************************");
                Integer minDebut = null;
                Integer heureFin = null;
                Integer minFin = null;
                String dateReservation = null;
                Integer heureDebut = null;
                Long clientid = null;
                Long taxiId = null;

                /*
                 *
                 *
                 * Validation donne�s
                 */
                if (request.getParameter("inputMinFin") != null) {
                    minFin = Integer.parseInt(request.getParameter("inputMinFin"));
                }
                if (request.getParameter("inputHeureFin") != null) {
                    heureFin = Integer.parseInt(request.getParameter("inputHeureFin"));
                }


                if (request.getParameter("inputMinDebut") != null) {
                    minDebut = Integer.parseInt(request.getParameter("inputMinDebut"));
                }
                if (request.getParameter("inputHeureDebut") != null) {
                    heureDebut = Integer.parseInt(request.getParameter("inputHeureDebut"));
                }

                if (request.getParameter("inputDateReservation") != null) {
                    dateReservation = request.getParameter("inputDateReservation");
                }
                if (request.getParameter("taxiId") != null) {
                    taxiId = Long.parseLong(request.getParameter("taxiId"));
                }

                if (request.getParameter("clientid") != null) {
                    clientid = Long.parseLong(request.getParameter("clientid"));
                }

                System.out.print("minDebut=" + minDebut);
                System.out.print("heureFin=" + heureFin);
                System.out.print("minFin=" + minFin);
                System.out.print("dateReservation=" + dateReservation);
                System.out.print("heureDebut=" + heureDebut);
                System.out.print("clientid=" + clientid);
                System.out.print("taxiId=" + taxiId);
                // call RESERVATION DAO pour Ajouter la  reservation
                if (clientid != null && taxiId != null && dateReservation != null && heureDebut != null && minDebut != null && heureFin != null && minFin != null) {

                    if (reservationDAO.add(new Reservation(null, new Client(clientid, null, null, null, null, null, null), new Taxi(taxiId, null, null, null, null), LocalDate.parse(dateReservation), heureDebut, minDebut, heureFin, minFin, null))) {
                        request.setAttribute("successMsg", "Opr�ration Bien Effectu�e");
                    } else {
                        request.setAttribute("dangerMsg", "une erreur survenue lors de traitement de votre requ�te");
                    }

                }


            }
            /*
             * Sauvgarder Client
             */
            else if (saveClient != null) {

                String nomClient = null;
                String prenomClient = null;
                String adresseClient = null;
                String datenaissanceClient = null;
                String emailClient = null;


                if (!request.getParameter("inputNomClient").isBlank()) {
                    nomClient = request.getParameter("inputNomClient");
                }
                if (!request.getParameter("inputPrenomClient").isBlank()) {
                    prenomClient = request.getParameter("inputPrenomClient");
                }
                if (!request.getParameter("inputDateNaisClient").isBlank()) {
                    datenaissanceClient = request.getParameter("inputDateNaisClient");
                }
                if (!request.getParameter("inputAdresseClient").isBlank()) {
                    adresseClient = request.getParameter("inputAdresseClient");
                }
                if (!request.getParameter("inputEmailClient").isBlank()) {
                    emailClient = request.getParameter("inputEmailClient");
                }


                if (nomClient != null && prenomClient != null && adresseClient != null && datenaissanceClient != null && emailClient != null) {
                    // Long client_id, String nom, String prenom, LocalDate dateNais, String adresse, String login,
                    // String motPasse
                    if (clientDAO.add(new Client(null, nomClient, prenomClient, LocalDate.parse(datenaissanceClient), adresseClient, emailClient, prenomClient.charAt(0) + "@" + nomClient))) {
                        request.setAttribute("successMsg", "Opr�ration Bien Effectu�e");
                    } else {
                        request.setAttribute("dangerMsg", "une erreur survenue lors de traitement de votre requ�te");
                    }
                } else {
                    request.setAttribute("dangerMsg", "Donn�s Invalides");
                }
                // clientDAO
            }
            /*
             *
             *  Traiteement de la partie d�connexion
             */
            else if (singup != null) {
                session.removeAttribute("client");
                session.invalidate();
                request.setAttribute("successMsg", "� bient�t ... ");
            } else {
            }


            request.getServletContext().getRequestDispatcher("/clientIndex.jsp").forward(request, response);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);


    }

}
