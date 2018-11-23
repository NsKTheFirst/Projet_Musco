-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 15 nov. 2018 à 11:37
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
  `id_annonce` smallint(6) NOT NULL,
  `annonce` text NOT NULL,
  `id_annonce_owner` smallint(6) NOT NULL,
  `date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `annonce_needs_skills`
--

CREATE TABLE `annonce_needs_skills` (
  `id_annonce_skill` smallint(6) NOT NULL,
  `id_skills_needed` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id_message` smallint(6) NOT NULL,
  `date` varchar(45) NOT NULL,
  `sujet` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `id_emetteur` smallint(6) NOT NULL,
  `id_receveur` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id_skill` smallint(6) NOT NULL,
  `categorie` enum('audio','video','instruments') NOT NULL,
  `skill` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` smallint(6) NOT NULL,
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

-- --------------------------------------------------------

--
-- Structure de la table `users_skills`
--

CREATE TABLE `users_skills` (
  `id_skill_user` smallint(6) NOT NULL,
  `id_user_skilled` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_follows_user`
--

CREATE TABLE `user_follows_user` (
  `id_user` smallint(6) NOT NULL,
  `id_user_followed` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`id_annonce`),
  ADD KEY `Annonces_fk0` (`id_annonce_owner`);

--
-- Index pour la table `annonce_needs_skills`
--
ALTER TABLE `annonce_needs_skills`
  ADD KEY `Annonce_needs_skills_fk0` (`id_annonce_skill`),
  ADD KEY `Annonce_needs_skills_fk1` (`id_skills_needed`);

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
-- Index pour la table `users_skills`
--
ALTER TABLE `users_skills`
  ADD KEY `users_skills_fk0` (`id_skill_user`),
  ADD KEY `users_skills_fk1` (`id_user_skilled`);

--
-- Index pour la table `user_follows_user`
--
ALTER TABLE `user_follows_user`
  ADD KEY `user_follows_user_fk0` (`id_user`),
  ADD KEY `user_follows_user_fk1` (`id_user_followed`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `id_annonce` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id_skill` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `Annonces_fk0` FOREIGN KEY (`id_annonce_owner`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `annonce_needs_skills`
--
ALTER TABLE `annonce_needs_skills`
  ADD CONSTRAINT `Annonce_needs_skills_fk0` FOREIGN KEY (`id_annonce_skill`) REFERENCES `annonces` (`id_annonce`),
  ADD CONSTRAINT `Annonce_needs_skills_fk1` FOREIGN KEY (`id_skills_needed`) REFERENCES `skills` (`id_skill`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `Messages_fk0` FOREIGN KEY (`id_emetteur`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `Messages_fk1` FOREIGN KEY (`id_receveur`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `users_skills`
--
ALTER TABLE `users_skills`
  ADD CONSTRAINT `users_skills_fk0` FOREIGN KEY (`id_skill_user`) REFERENCES `skills` (`id_skill`),
  ADD CONSTRAINT `users_skills_fk1` FOREIGN KEY (`id_user_skilled`) REFERENCES `users` (`id_user`);

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
