-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 03 juil. 2021 à 19:48
-- Version du serveur : 10.4.19-MariaDB
-- Version de PHP : 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `taxibooking_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `client_id` bigint(20) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `dateNais` date DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `login` varchar(200) NOT NULL,
  `motPasse` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`client_id`, `nom`, `prenom`, `dateNais`, `adresse`, `login`, `motPasse`) VALUES
(1, 'BELEFQIH', 'SAAD', '1990-06-01', 'rabat', 's.belefqih@gmail.com', '123456'),
(2, 'ELGHAZI', 'NOUR EL IMANE', '2000-01-01', 'SALE', 'nour@elghazi.com', 'n@elgahzi');

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE `gerant` (
  `gerant_id` bigint(20) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `login` varchar(200) NOT NULL,
  `motPasse` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gerant`
--

INSERT INTO `gerant` (`gerant_id`, `nom`, `prenom`, `login`, `motPasse`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'P@2021');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `res_id` bigint(20) NOT NULL,
  `taxi_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `date_reservation` date NOT NULL,
  `heureDebut_reservation` int(11) NOT NULL,
  `minDebut_reservation` int(11) NOT NULL,
  `heureFin_reservation` int(11) NOT NULL,
  `minFin_reservation` int(11) NOT NULL,
  `isValidate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`res_id`, `taxi_id`, `client_id`, `date_reservation`, `heureDebut_reservation`, `minDebut_reservation`, `heureFin_reservation`, `minFin_reservation`, `isValidate`) VALUES
(1, 1, 1, '2021-06-26', 10, 0, 11, 0, 1),
(4, 3, 1, '2021-06-24', 6, 0, 6, 15, 0),
(6, 3, 2, '2021-07-20', 2, 15, 3, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `taxi`
--

CREATE TABLE `taxi` (
  `taxi_id` bigint(20) NOT NULL,
  `marque` varchar(200) NOT NULL,
  `version` varchar(200) NOT NULL,
  `matricule` varchar(200) NOT NULL,
  `couleur` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `taxi`
--

INSERT INTO `taxi` (`taxi_id`, `marque`, `version`, `matricule`, `couleur`) VALUES
(1, 'DACIA', 'LOCAN', '125-A-1', 'Noir'),
(2, 'TOYOTA', 'YARIS', '5784-A-1', 'Rouge'),
(3, 'BMW', 'SERIE 1', '125-B-6', 'Noir'),
(4, 'VOLKSWAGEN', 'GOLF 7', '1994-E-6', 'Vert'),
(5, 'RENAULT', 'CLIO 5', '2457-A-2', 'Gris'),
(6, 'PEUGEOT', '208', '7896-A-1', 'Vert'),
(7, 'FIAT', '500', '654-A-26', 'Jaune'),
(8, 'FIAT', 'PUNTO', '8544-D-4', 'Vert');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_reservation_details`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_reservation_details` (
`res_id` bigint(20)
,`date_reservation` date
,`heureDebut_reservation` int(11)
,`minDebut_reservation` int(11)
,`heureFin_reservation` int(11)
,`minFin_reservation` int(11)
,`isValidate` int(1)
,`client_id` bigint(20)
,`nom` varchar(200)
,`prenom` varchar(200)
,`dateNais` date
,`adresse` varchar(200)
,`login` varchar(200)
,`motPasse` varchar(200)
,`taxi_id` bigint(20)
,`marque` varchar(200)
,`version` varchar(200)
,`matricule` varchar(200)
,`couleur` varchar(200)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_statistique_reservation`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_statistique_reservation` (
`nbreservation` bigint(21)
,`numMoins` int(2)
,`mois` varchar(7)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_reservation_details`
--
DROP TABLE IF EXISTS `vue_reservation_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_reservation_details`  AS SELECT `reservation`.`res_id` AS `res_id`, `reservation`.`date_reservation` AS `date_reservation`, `reservation`.`heureDebut_reservation` AS `heureDebut_reservation`, `reservation`.`minDebut_reservation` AS `minDebut_reservation`, `reservation`.`heureFin_reservation` AS `heureFin_reservation`, `reservation`.`minFin_reservation` AS `minFin_reservation`, `reservation`.`isValidate` AS `isValidate`, `client`.`client_id` AS `client_id`, `client`.`nom` AS `nom`, `client`.`prenom` AS `prenom`, `client`.`dateNais` AS `dateNais`, `client`.`adresse` AS `adresse`, `client`.`login` AS `login`, `client`.`motPasse` AS `motPasse`, `taxi`.`taxi_id` AS `taxi_id`, `taxi`.`marque` AS `marque`, `taxi`.`version` AS `version`, `taxi`.`matricule` AS `matricule`, `taxi`.`couleur` AS `couleur` FROM ((`reservation` join `client`) join `taxi`) WHERE `reservation`.`taxi_id` = `taxi`.`taxi_id` AND `reservation`.`taxi_id` = `client`.`client_id` ORDER BY `taxi`.`taxi_id` ASC, `reservation`.`date_reservation` DESC, `reservation`.`heureDebut_reservation` ASC ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_statistique_reservation`
--
DROP TABLE IF EXISTS `vue_statistique_reservation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_statistique_reservation`  AS SELECT count(0) AS `nbreservation`, 1 AS `numMoins`, 'Janvier' AS `mois` FROM `reservation` WHERE month(`reservation`.`date_reservation`) = 1 ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Index pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`gerant_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `fk_taxi` (`taxi_id`),
  ADD KEY `fk_client` (`client_id`);

--
-- Index pour la table `taxi`
--
ALTER TABLE `taxi`
  ADD PRIMARY KEY (`taxi_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `gerant`
--
ALTER TABLE `gerant`
  MODIFY `gerant_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `res_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `taxi`
--
ALTER TABLE `taxi`
  MODIFY `taxi_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`client_id`) REFERENCES `taxi` (`taxi_id`),
  ADD CONSTRAINT `fk_taxi` FOREIGN KEY (`taxi_id`) REFERENCES `taxi` (`taxi_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
