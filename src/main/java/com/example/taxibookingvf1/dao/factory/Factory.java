package com.example.taxibookingvf1.dao.factory;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.example.taxibookingvf1.dao.exception.DaoException;

public class Factory {
	private static Factory instance;
	private Connection connection;

	// Private constructor to prevent instantiation from outside the class
	private Factory() {
		initializeConnection();
	}

	public static Factory getInstance() {
		if (instance == null) {
			synchronized (Factory.class) {
				if (instance == null) {
					instance = new Factory();
				}
			}
		}
		return instance;
	}

	public Connection getConnection() {
		return connection;
	}

	private void initializeConnection() {
		final String FICHIER_PROPERTIES = "jdbc.properties";
		final String PROPERTY_URL = "jdbc.url";
		final String PROPERTY_DRIVER = "jdbc.driver";
		final String PROPERTY_NOM_UTILISATEUR = "jdbc.username";
		final String PROPERTY_MOT_DE_PASSE = "jdbc.password";

		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream fichierProperties = classLoader.getResourceAsStream(FICHIER_PROPERTIES);
		String url;
		String driver;
		String nomUtilisateur;
		String motDePasse;
		Properties properties = new Properties();

		if (fichierProperties == null) {
			throw new DaoException("Le fichier properties " + FICHIER_PROPERTIES + " est introuvable.");
		}

		try {
			properties.load(fichierProperties);
			url = properties.getProperty(PROPERTY_URL);
			driver = properties.getProperty(PROPERTY_DRIVER);
			nomUtilisateur = properties.getProperty(PROPERTY_NOM_UTILISATEUR);
			motDePasse = properties.getProperty(PROPERTY_MOT_DE_PASSE);
		} catch (IOException e) {
			throw new DaoException("Impossible de charger le fichier properties ", e);
		}

		try {
			Class.forName(driver);
			System.out.println("\n\n Driver approuvé");
			connection = DriverManager.getConnection(url, nomUtilisateur, motDePasse);
			System.out.println("Connection a la base réussie");
		} catch (ClassNotFoundException e) {
			throw new DaoException("Le driver est introuvable dans le classpath.", e);
		} catch (SQLException e) {
			throw new DaoException(e.toString(), e);
		}
	}
}
