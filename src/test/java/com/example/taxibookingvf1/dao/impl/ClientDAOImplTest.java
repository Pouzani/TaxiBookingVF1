package com.example.taxibookingvf1.dao.impl;

import com.example.taxibookingvf1.dao.ClientDAO;
import com.example.taxibookingvf1.dao.factory.Factory;
import com.example.taxibookingvf1.models.Client;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class ClientDAOImplTest {

    private ClientDAO clientDAO;

    @BeforeAll
    static void setUpBeforeClass() {
        Connection con = null;
        try {
            con = Factory.getInstance().getConnection();
            executeSqlScript(con, "src/test/resources/clients.sql");
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
        clientDAO = new ClientDAOImpl();
    }

    @Test
    void add() throws SQLException {
        Client client = new Client();
        client.setNom("Test");
        client.setPrenom("Testing");
        client.setDateNais(LocalDate.of(1990, 5, 15));
        client.setAdresse("123 Main St");
        client.setLogin("test");
        client.setMotPasse("password");

        assertTrue(clientDAO.add(client));
    }

    @Test
    void update() throws SQLException {
        Set<Client> clients = clientDAO.getAll();
        assertFalse(clients.isEmpty());

        Client client = new Client();
        List<Client> list = new ArrayList<>(clients);
        client.setClient_id(list.get(0).getClient_id());  // Assuming a valid client ID in the database
        client.setNom("UpdatedName");
        client.setPrenom("UpdatedPrenom");
        client.setDateNais(LocalDate.of(1990, 5, 15));
        client.setAdresse("123 Main St");
        client.setLogin("test");
        client.setMotPasse("password");

        assertTrue(clientDAO.update(client));
    }

    @Test
    void deleteByID() throws SQLException {
        Set<Client> clients = clientDAO.getAll();
        List<Client> list = new ArrayList<>(clients);
        assertTrue(clientDAO.deleteByID(list.get(0).getClient_id()));
    }

    @Test
    void getOneById() throws SQLException {
        Set<Client> clients = clientDAO.getAll();
        List<Client> list = new ArrayList<>(clients);  // Assuming a valid client ID in the database

        Client client = clientDAO.getOneById(list.get(0).getClient_id());
        assertNotNull(client);
        assertEquals(list.get(0).getClient_id(), client.getClient_id());
    }

    @Test
    void getAll() throws SQLException {
        Set<Client> clients = clientDAO.getAll();
        assertNotNull(clients);
        assertFalse(clients.isEmpty());
    }

    @Test
    void authentifier() throws SQLException {
        String login = "johndoe";
        String password = "password";  // Assuming valid credentials

        Client client = clientDAO.authentifier(login, password);
        assertNotNull(client);
        assertEquals(login, client.getLogin());
    }
}