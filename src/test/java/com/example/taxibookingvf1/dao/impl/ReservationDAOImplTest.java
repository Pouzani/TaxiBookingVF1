package com.example.taxibookingvf1.dao.impl;

import com.example.taxibookingvf1.dao.ClientDAO;
import com.example.taxibookingvf1.dao.ReservationDAO;
import com.example.taxibookingvf1.dao.TaxiDAO;
import com.example.taxibookingvf1.dao.factory.Factory;
import com.example.taxibookingvf1.models.Client;
import com.example.taxibookingvf1.models.Reservation;
import com.example.taxibookingvf1.models.Taxi;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;

import static org.junit.jupiter.api.Assertions.*;

class ReservationDAOImplTest {


    private ReservationDAO reservationDAO;


    @BeforeAll
    static void setUpBeforeClass() {
        Connection con = null;
        try {
            con = Factory.getInstance().getConnection();
            executeSqlScript(con, "src/test/resources/clients.sql");
            executeSqlScript(con, "src/test/resources/reservations.sql");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }

    private static void executeSqlScript(Connection connection, String scriptFilePath) throws Exception {
        try (Statement statement = connection.createStatement()) {
            String sqlScript = new String(Files.readAllBytes(Paths.get(scriptFilePath)));
            String[] sqlStatements = sqlScript.split(";");
            for (String sql : sqlStatements) {
                statement.addBatch(sql);
            }
            statement.executeBatch();
        }
    }

    @BeforeEach
    void setUp() {
        reservationDAO = new ReservationDAOImpl();
    }


    @Test
    void deleteByID() throws SQLException {
        // Add a sample reservation to the test database
        // Replace with actual SQL insert statement
        Set<Reservation> reservations = reservationDAO.getAll();
        assertFalse(reservations.isEmpty());
        List<Reservation> list = new ArrayList<>(reservations);

        // Call the deleteByID method and assert the result
        boolean isDeleted = reservationDAO.deleteByID(list.get(0).getRes_id()); // Replace with an actual ID
        assertTrue(isDeleted);
    }

    @Test
    void getAll() throws SQLException {
        // Call the getAll method and assert the result
        Set<Reservation> reservations = reservationDAO.getAll();
        // Assert the size and content of the result set
        assertNotNull(reservations);
        assertFalse(reservations.isEmpty());

    }

    @Test
    void setValidationReservation() throws SQLException {
        Set<Reservation> reservations = reservationDAO.getAll();
        assertFalse(reservations.isEmpty());
        List<Reservation> list = new ArrayList<>(reservations);

        boolean isValidate = reservationDAO.setValidationReservation(list.get(0).getRes_id(), 1); // Replace with actual values
        assertTrue(isValidate);
    }

    @Test
    void getCountReservation() throws SQLException {
        // Call the getCountReservation method and assert the result
        Set<Reservation> reservations = reservationDAO.getAll();
        assertFalse(reservations.isEmpty());
        List<Reservation> list = new ArrayList<>(reservations);

        int count = reservationDAO.getCountReservation(1); // Replace with an actual validation value
        assertEquals(list.stream().filter(reservation -> reservation.getIsValidate().equals(1)).count(), count);
    }

    @Test
    void getAllByClient() throws SQLException {
        Set<Reservation> reservations = reservationDAO.getAll();
        assertFalse(reservations.isEmpty());
        List<Reservation> list = new ArrayList<>(reservations);

        // Call the getAllByClient method and assert the result
        Set<Reservation> reservationsByClient = reservationDAO.getAllByClient(list.get(0).getRes_id()); // Replace with an actual client ID
        // Assert the size and content of the result set
        assertNotNull(reservationsByClient);
    }

    @Test
    void testGetCountReservation() throws SQLException {
        // Call the getCountReservation method and assert the result
        Set<Reservation> reservations = reservationDAO.getAll();
        assertFalse(reservations.isEmpty());
        List<Reservation> list = new ArrayList<>(reservations);

        int count = reservationDAO.getCountReservation(); // Replace with an actual validation value
        assertEquals(list.size(), count);

    }
}