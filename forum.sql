-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 22 jan. 2022 à 23:09
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `f_categories`
--

DROP TABLE IF EXISTS `f_categories`;
CREATE TABLE IF NOT EXISTS `f_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `f_messages`
--

DROP TABLE IF EXISTS `f_messages`;
CREATE TABLE IF NOT EXISTS `f_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_topic` int(11) NOT NULL,
  `id_posteur` int(11) NOT NULL,
  `date_heure_post` datetime NOT NULL,
  `date_heure_edition` datetime NOT NULL,
  `meilleure_reponse` tinyint(1) NOT NULL,
  `contenu` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `f_sous-categories`
--

DROP TABLE IF EXISTS `f_sous-categories`;
CREATE TABLE IF NOT EXISTS `f_sous-categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `f_suivis`
--

DROP TABLE IF EXISTS `f_suivis`;
CREATE TABLE IF NOT EXISTS `f_suivis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_topic` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `f_topics`
--

DROP TABLE IF EXISTS `f_topics`;
CREATE TABLE IF NOT EXISTS `f_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_createur` int(11) NOT NULL,
  `sujet` text NOT NULL,
  `contenu` text NOT NULL,
  `date_heure_creation` datetime NOT NULL,
  `resolu` tinyint(1) NOT NULL,
  `notif_createur` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `f_topics-categorie`
--

DROP TABLE IF EXISTS `f_topics-categorie`;
CREATE TABLE IF NOT EXISTS `f_topics-categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_topic` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_souscategorie` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `nom` varchar(40) NOT NULL,
  `adresse` varchar(42) NOT NULL,
  `mdp` varchar(150) CHARACTER SET latin2 COLLATE latin2_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`nom`, `adresse`, `mdp`, `id`) VALUES
('kljkhss00', 'kjhjkh@gmail.com', '$2y$10$S.n8T/Rzyt2N.DC9jN39k.ry1Q5VM61dYYNgmIuY3f1uVy2B9qnpG', 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
