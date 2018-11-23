-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 10 nov. 2018 à 17:40
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `musco`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE `annonces` (
  `id_annonce` int(11) NOT NULL,
  `annonce` text NOT NULL,
  `id_skill` int(11) DEFAULT NULL,
  `id_instrument` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `annonces`
--

INSERT INTO `annonces` (`id_annonce`, `annonce`, `id_skill`, `id_instrument`, `id_user`) VALUES
(3, 'annonce1', NULL, 2, 3),
(4, 'annonce2', 6, NULL, 1),
(5, 'annonce3', NULL, 1, 8),
(6, 'annonce4', 7, NULL, 6),
(7, 'annonce5', 1, NULL, 2),
(8, 'annonce6', NULL, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `instruments`
--

CREATE TABLE `instruments` (
  `id-instrument` int(11) NOT NULL,
  `instrument` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `instruments`
--

INSERT INTO `instruments` (`id-instrument`, `instrument`) VALUES
(1, 'instrument1'),
(2, 'instrument2'),
(3, 'instrument3'),
(4, 'instrument4'),
(5, 'instrument5'),
(6, 'instrument6'),
(7, 'instrument7'),
(8, 'instrument8'),
(9, 'instrument9'),
(10, 'instrument10');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `sujet` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `id_emetteur` int(11) NOT NULL,
  `id_receveur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id_message`, `date`, `sujet`, `message`, `id_emetteur`, `id_receveur`) VALUES
(1, 'date1', 'sujet1', 'message1', 2, 5),
(2, 'date2', 'sujet2', 'message2', 1, 8),
(3, 'date3', 'sujet3', 'message3', 4, 1),
(4, 'date4', 'sujet4', 'message4', 8, 10);

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id_skill` int(11) NOT NULL,
  `categorie` enum('audio','video') NOT NULL,
  `skill` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `skills`
--

INSERT INTO `skills` (`id_skill`, `categorie`, `skill`) VALUES
(1, 'audio', 'skill1'),
(2, 'video', 'skill2'),
(3, 'video', 'skill3'),
(4, 'video', 'skill4'),
(5, 'audio', 'skill5'),
(6, 'video', 'skill6'),
(7, 'audio', 'skill7'),
(8, 'audio', 'skill8'),
(9, 'audio', 'skill9'),
(10, 'video', 'skill10');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `pseudo` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `soundcloud` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `localisation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prenom`, `pseudo`, `mdp`, `mail`, `avatar`, `soundcloud`, `youtube`, `facebook`, `localisation`) VALUES
(1, 'nom1', 'prenom1', 'peuso1', 'mdp1', 'mail1', 'avatar1', 'sc1', 'yt1', 'fb1', 'loc1'),
(2, 'nom2', 'prenom2', 'pseudo2', 'mdp2', 'mail2', 'avatar2', 'sc2', 'yt2', 'fb2', 'loc2'),
(3, 'nom3', 'prenom3', 'pseudo3', 'mdp3', 'mail3', 'avatar3', 'sc3', 'yt3', 'fb3', 'loc3'),
(4, 'nom4', 'prenom4', 'pseudo4', 'mdp4', 'mail4', 'avatar4', 'sc4', 'yt4', 'fb4', 'loc4'),
(5, 'nom5', 'prenom5', 'pseudo5', 'mdp5', 'mail5', 'avatar5', 'sc5', 'yt5', 'fb5', 'loc5'),
(6, 'nom6', 'prenom6', 'pseudo6', 'mdp6', 'mail6', 'avatar6', 'sc6', 'yt6', 'fb6', 'loc6'),
(7, 'nom7', 'prenom7', 'pseudo7', 'mdp7', 'mail7', 'avatar7', 'sc7', 'yt7', 'fb7', 'loc7'),
(8, 'nom8', 'prenom8', 'pseudo8', 'mdp8', 'mail8', 'avatar8', 'sc8', 'yt8', 'fb8', 'loc8'),
(9, 'nom9', 'prenom9', 'pseudo9', 'mdp9', 'mail9', 'avatar9', 'sc9', 'yt9', 'fb9', 'loc9'),
(10, 'nom10', 'prenom10', 'pseudo10', 'mdp10', 'mail10', 'avatar10', 'sc10', 'yt10', 'fb10', 'loc10');

-- --------------------------------------------------------

--
-- Structure de la table `users_instru`
--

CREATE TABLE `users_instru` (
  `id_instru` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users_instru`
--

INSERT INTO `users_instru` (`id_instru`, `id_user`) VALUES
(3, 5),
(1, 9),
(6, 5),
(9, 2);

-- --------------------------------------------------------

--
-- Structure de la table `users_skills`
--

CREATE TABLE `users_skills` (
  `id_skill` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users_skills`
--

INSERT INTO `users_skills` (`id_skill`, `id_user`) VALUES
(5, 3),
(1, 8),
(4, 6),
(10, 8);

-- --------------------------------------------------------

--
-- Structure de la table `user_follows_user`
--

CREATE TABLE `user_follows_user` (
  `id_user` int(11) NOT NULL,
  `id_user_followed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_follows_user`
--

INSERT INTO `user_follows_user` (`id_user`, `id_user_followed`) VALUES
(1, 5),
(3, 8),
(7, 1),
(10, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`id_annonce`),
  ADD KEY `Annonces_fk0` (`id_skill`),
  ADD KEY `Annonces_fk1` (`id_instrument`),
  ADD KEY `Annonces_fk2` (`id_user`);

--
-- Index pour la table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id-instrument`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `Messages_fk0` (`id_emetteur`),
  ADD KEY `Messages_fk1` (`id_receveur`);

--
-- Index pour la table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id_skill`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `users_instru`
--
ALTER TABLE `users_instru`
  ADD KEY `Users_instru_fk0` (`id_instru`),
  ADD KEY `Users_instru_fk1` (`id_user`);

--
-- Index pour la table `users_skills`
--
ALTER TABLE `users_skills`
  ADD KEY `Users_Skills_fk0` (`id_skill`),
  ADD KEY `Users_Skills_fk1` (`id_user`);

--
-- Index pour la table `user_follows_user`
--
ALTER TABLE `user_follows_user`
  ADD PRIMARY KEY (`id_user`,`id_user_followed`),
  ADD KEY `user_follows_user_fk1` (`id_user_followed`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `id_annonce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id-instrument` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id_skill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `Annonces_fk0` FOREIGN KEY (`id_skill`) REFERENCES `skills` (`id_skill`),
  ADD CONSTRAINT `Annonces_fk1` FOREIGN KEY (`id_instrument`) REFERENCES `instruments` (`id-instrument`),
  ADD CONSTRAINT `Annonces_fk2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `Messages_fk0` FOREIGN KEY (`id_emetteur`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `Messages_fk1` FOREIGN KEY (`id_receveur`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `users_instru`
--
ALTER TABLE `users_instru`
  ADD CONSTRAINT `Users_instru_fk0` FOREIGN KEY (`id_instru`) REFERENCES `instruments` (`id-instrument`),
  ADD CONSTRAINT `Users_instru_fk1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `users_skills`
--
ALTER TABLE `users_skills`
  ADD CONSTRAINT `Users_Skills_fk0` FOREIGN KEY (`id_skill`) REFERENCES `skills` (`id_skill`),
  ADD CONSTRAINT `Users_Skills_fk1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `user_follows_user`
--
ALTER TABLE `user_follows_user`
  ADD CONSTRAINT `user_follows_user_fk0` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `user_follows_user_fk1` FOREIGN KEY (`id_user_followed`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
