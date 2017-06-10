-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 30 Mai 2017 à 22:31
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `adresse_1` varchar(255) DEFAULT NULL,
  `adresse_2` varchar(255) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `pays` varchar(120) DEFAULT 'FRANCE',
  `label` varchar(140) NOT NULL,
  `code_acces` varchar(10) DEFAULT NULL,
  `description` varchar(70) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `adresses`
--

INSERT INTO `adresses` (`id`, `adresse_1`, `adresse_2`, `code_postal`, `ville`, `pays`, `label`, `code_acces`, `description`, `latitude`, `longitude`) VALUES
(1, '853 Santina Junctions\nCorneliusview, NC 67724-7746', '', '75679', 'Paris', 'FRANCE', 'domicile', '', 'http://lorempixel.com/240/180/?34277', -27.158391, -108.622038),
(2, '2590 Huel Parkway Apt. 683\nSouth Hendersonshire, MA 81358', '', '75127', 'Paris', 'FRANCE', 'boulot', '', 'http://lorempixel.com/240/180/?12450', -85.447892, 77.428496),
(3, '23507 Ernser Brooks\nEast Markus, MN 51010-4168', '', '75689', 'Paris', 'FRANCE', 'home', '#4365A', 'http://lorempixel.com/240/180/?77543', -23.327167, -31.420579),
(4, '73993 Fahey Drive\nAmarachester, CO 42677-4827', '', '75655', 'Paris', 'FRANCE', 'boulot', '', 'http://lorempixel.com/240/180/?39912', -70.362487, 105.802618),
(5, '369 Nikolaus Knolls Apt. 241\nNorth Susie, OR 78042-0397', '', '75792', 'Paris', 'FRANCE', 'domicile', '', 'http://lorempixel.com/240/180/?27191', -12.080469, -129.114881);

-- --------------------------------------------------------

--
-- Structure de la table `adresse_clients`
--

CREATE TABLE `adresse_clients` (
  `adresses_id` int(10) UNSIGNED NOT NULL,
  `utilisateurs_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `adresse_clients`
--

INSERT INTO `adresse_clients` (`adresses_id`, `utilisateurs_id`) VALUES
(1, 31),
(2, 31),
(3, 32),
(4, 33),
(5, 34);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `slug`) VALUES
(1, 'Plats', 'plats'),
(2, 'Desserts', 'desserts');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(10) UNSIGNED NOT NULL,
  `utilisateurs_id` int(10) UNSIGNED NOT NULL,
  `adresses_id` int(10) UNSIGNED NOT NULL,
  `livreurs_id` int(10) UNSIGNED NOT NULL,
  `ref_commande` varchar(16) DEFAULT NULL,
  `prix_total` float DEFAULT NULL,
  `statut_paiement` varchar(255) DEFAULT NULL,
  `statut_livraison` varchar(45) DEFAULT NULL,
  `details_service_client` text,
  `date_ajout` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `date_prise_charge` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`id`, `utilisateurs_id`, `adresses_id`, `livreurs_id`, `ref_commande`, `prix_total`, `statut_paiement`, `statut_livraison`, `details_service_client`, `date_ajout`, `date_modification`, `date_paiement`, `date_prise_charge`) VALUES
(1, 31, 1, 1, '2045201717', 48, 'paiement accepté', 'en cours de livraison', NULL, '2017-05-31 20:12:00', '2017-05-31 20:12:00', '2017-05-31 20:14:00', '2017-05-31 20:20:00'),
(3, 32, 3, 3, '2045201718', 58, 'paiement accepté', 'en cours de livraison', NULL, '2017-05-31 20:30:00', '2017-05-31 20:32:00', '2017-05-31 20:30:00', '2017-05-31 20:35:00'),
(4, 34, 5, 0, '2045201719', 48, 'paiement refusé', 'attente de paiement', '', '2017-05-31 21:00:00', '2017-05-31 21:00:00', '2017-05-31 21:10:00', '2017-05-31 21:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `id` int(10) UNSIGNED NOT NULL,
  `produits_id` int(10) UNSIGNED NOT NULL,
  `commandes_id` int(10) UNSIGNED NOT NULL,
  `commandes_utilisateurs_id` int(10) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `date_ajout` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande_produit`
--

INSERT INTO `commande_produit` (`id`, `produits_id`, `commandes_id`, `commandes_utilisateurs_id`, `quantity`, `details`, `date_ajout`, `date_modification`) VALUES
(2, 1, 1, 31, 2, 'quantité : x2 - Boeuf bourguignon', '2017-04-30 20:00:00', '2017-04-30 20:00:00'),
(3, 2, 3, 32, 2, 'qunatité : x2 - Noix de saint Jacques sautées', '2017-05-31 19:00:00', '2017-05-31 19:00:00'),
(4, 3, 3, 32, 2, 'quantité : x2 - Fondant au chocolat', '2017-05-31 19:00:00', '2017-05-31 06:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `livreurs`
--

CREATE TABLE `livreurs` (
  `id` int(10) UNSIGNED NOT NULL,
  `utilisateurs_id` int(10) UNSIGNED NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `statut` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livreurs`
--

INSERT INTO `livreurs` (`id`, `utilisateurs_id`, `longitude`, `latitude`, `statut`) VALUES
(1, 11, -111.495509, -68.077318, 'en cours de livraison'),
(2, 12, 106.850404, 84.850404, 'libre'),
(3, 13, 106.850404, -84.685121, 'en cours de livraison'),
(4, 14, NULL, NULL, 'off');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(10) UNSIGNED NOT NULL,
  `categories_id` int(10) UNSIGNED NOT NULL,
  `code_barre` varchar(13) DEFAULT NULL,
  `ref` varchar(16) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `image` varchar(255) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `date_ajout` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`id`, `categories_id`, `code_barre`, `ref`, `meta`, `titre`, `description`, `image`, `prix`, `date_ajout`, `date_modification`, `date_publication`) VALUES
(1, 1, '9797425481187', '2045201784', 'boeuf bourguignon de Machin chose', 'boeuf bourguignon accompagné d\'un gratin dauphinois', 'Labore eaque perferendis inventore ullam ipsa. Accusantium ex quas ex. A maiores et tempore molestias quos eos. Delectus nemo rerum ratione quis esse rerum pariatur assumenda.', 'http://static.cuisineaz.com/400x320/i94631-boeuf-bourguignon.jpg', 24, '2017-05-30 06:00:00', '2017-05-30 06:00:00', '2017-05-30 06:00:00'),
(2, 1, '9799455349284', '2045201717', 'Noix de saint Jacques sautées', 'Noix de saint Jacques sautées', 'Ut voluptas qui porro quia autem aut sapiente. Vitae inventore reiciendis dolore laudantium. Occaecati quia odit numquam aspernatur culpa.', 'http://res.cloudinary.com/hv9ssmzrz/image/fetch/c_fill,f_auto,h_286,q_60,w_382/http://s3-eu-west-1.amazonaws.com/images-site-chefsimon-eu/image8/saint-jacques-sautees14.jpg', 26, '2017-05-30 06:00:00', '2017-05-30 06:00:00', '2017-05-31 06:00:00'),
(3, 2, '9789104778923', '2045201765', 'Succulent fondant au chocolat du chef Robert Legout', 'Fondant au chocolat', 'Nostrum iste recusandae sunt placeat dolor. Et hic voluptatum fuga sapiente voluptatem autem. Eos aut nam autem aut temporibus numquam voluptatem qui. Doloribus aliquid qui qui.', 'https://images.marmitoncdn.org/recipephotos/multiphoto/5b/5b364988-43c2-4a4a-bdd3-981f6232bfa9_normal.jpg', 3, '2017-05-30 06:00:00', '2017-05-30 06:00:00', '2017-05-31 06:00:00'),
(4, 2, '9797994734615', '2045201798', 'tarte aux fraises de saison', '\'The\' tarte aux fraises', 'Est deserunt aut numquam facere possimus quod nisi. Amet culpa suscipit assumenda.', 'https://images.marmitoncdn.org/recipephotos/multiphoto/0b/0bdc0dab-ba8f-438d-aabe-dfc5d67ee7f2_normal.jpg', 3, '2017-05-30 06:00:00', '2017-05-30 06:00:00', '2017-05-31 06:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `stocks_livreurs`
--

CREATE TABLE `stocks_livreurs` (
  `id` int(10) UNSIGNED NOT NULL,
  `livreurs_id` int(10) UNSIGNED NOT NULL,
  `produits_id` int(10) UNSIGNED NOT NULL,
  `quantite_total` int(10) UNSIGNED DEFAULT '0',
  `quantite_restante` int(10) UNSIGNED DEFAULT NULL,
  `date_prise_en_charge` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stocks_livreurs`
--

INSERT INTO `stocks_livreurs` (`id`, `livreurs_id`, `produits_id`, `quantite_total`, `quantite_restante`, `date_prise_en_charge`) VALUES
(1, 1, 1, 10, 8, '2017-05-31 20:00:00'),
(2, 1, 2, 10, 10, '2017-05-31 20:00:00'),
(3, 1, 3, 10, 10, '2017-05-31 20:00:00'),
(4, 1, 4, 10, 10, '2017-05-31 20:00:00'),
(5, 2, 1, 10, 10, '2017-05-31 20:02:00'),
(6, 2, 2, 10, 10, '2017-05-31 20:02:00'),
(7, 2, 3, 10, 10, '2017-05-31 20:05:00'),
(8, 2, 4, 10, 10, '2017-05-31 20:05:00'),
(9, 3, 1, 10, 10, '2017-05-31 20:10:00'),
(10, 3, 2, 10, 8, '2017-05-31 20:10:00'),
(11, 3, 3, 10, 8, '2017-05-31 20:10:00'),
(12, 3, 4, 10, 10, '2017-05-31 20:10:00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(45) DEFAULT 'client',
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(70) DEFAULT NULL,
  `prenom` varchar(70) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mot_de_passe` varchar(70) DEFAULT NULL,
  `validation_token` varchar(70) DEFAULT NULL,
  `date_ajout` datetime DEFAULT NULL,
  `date_modification` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `role`, `email`, `nom`, `prenom`, `telephone`, `mot_de_passe`, `validation_token`, `date_ajout`, `date_modification`) VALUES
(1, 'admin', 'contact@email.fr', 'ligalo', 'tom', '0608726372', '1c75f39d68a0e492b65f8a0929a9a835ae838302', NULL, '2017-05-30 00:00:00', '2017-05-30 00:00:00'),
(2, 'admin', 'lucie@mail.fr', 'fabre', 'lucie', '0626374819', '55f9b8f8662e65c073bd98e4edacf978757b6153', NULL, '2017-05-30 00:00:00', '2017-05-30 00:00:00'),
(3, 'service client', 'akris@example.com', 'Rolfson', 'Shane', '+33 1 25 51 45 24', 'hEDSIroIiIS16X4AFAM78Xv6Vw4Iu7JwVPYbMBmzQOb0SAweR7JW5F3rvhdL4GSpeV0nez', '', '2017-05-14 16:28:37', '2017-05-14 16:28:37'),
(4, 'service client', 'tromp.pearlie@example.com', 'Koepp', 'Cleora', '+33 7 16 25 65 80', '9JHXuiJq12uajWYoxd8VCtwuoFzZKHSDuVZDyKENgIaslcu5nioYiT0C6GarjWoma1sWnc', '', '2017-05-05 19:46:13', '2017-05-05 19:46:13'),
(11, 'livreur', 'johnathan.wilderman@example.com', 'Crooks', 'Adalberto', '06 86 80 17 44', 'RHdTGKAXsDZWYYDZE787mh66hC6AHD4L5CiwkOCoPGCOl6Es0fDj0yFyoU0Uc1vTuiNyll', '', '2017-05-03 00:32:47', '2017-05-03 00:32:47'),
(12, 'livreur', 'runolfsdottir.dejah@example.com', 'Padberg', 'Frida', '+33 7 57 62 10 17', 'XzinD0vSBE17aAXyhFOENO8QfP4GhPJJrYbtTBeZsRdnJsbqsNDNdmuFIlF44DiF9hdVS2', '', '2017-05-24 22:15:40', '2017-05-24 22:15:40'),
(13, 'livreur', 'hwaters@example.com', 'Hettinger', 'Jewel', '07 13 10 87 38', 'Rx57tDLs4S24A1079C0lOgufya6GI2UW04S9hXrx5xrA23KCXGtFf1BQgIzL0CwjXCHl77', '', '2017-05-14 00:36:00', '2017-05-14 00:36:00'),
(14, 'livreur', 'yswift@example.net', 'Weber', 'Guy', '07 98 88 57 31', 'ewIvQNfeDQ8JtpSucBazgdcUyba28fGUPS1oj6zX7hofArjpGT9OBhOuOkEPbQaBRNSHzZ', '', '2017-05-09 22:26:51', '2017-05-09 22:26:51'),
(31, 'client', 'diana69@example.net', 'Hand', 'Glennie', '01 86 84 10 56', '5xyIklmNfGNEWd0TnUAoYvqWOX5kC7gc4chMNqmXPNOiNdHH2CTQQEonBnCv1PImpE9DPw', '', '2017-05-25 10:55:08', '2017-05-25 10:55:08'),
(32, 'client', 'harmony20@example.net', 'Lang', 'Maybell', '01 72 40 52 44', 'LQveNsqAr1tw7HYzGvSzj0FtN5UqIDJD6xbnhyYCPWihS8PqCurN2OnaUpE86kGKLqW9JN', '', '2017-05-28 07:25:42', '2017-05-28 07:25:42'),
(33, 'client', 'dario80@example.net', 'Satterfield', 'Emily', '06 59 62 36 84', 'z3ec7HEtZLzYaZUcC1a1Ks80br7cJWj4QDTY1OHKUZlvwygycHbkAjfeFvvndDtNdSUZ1d', 'z3ec7Hs80br1KHKUZlvwygycHbkAjfeZ1dFvvndDtNdSU7cJWj4QDTY1OEtZLzYaZUcC1a', '2017-05-05 11:09:22', '2017-05-05 11:09:22'),
(34, 'client', 'rnienow@example.org', 'Wiza', 'Brad', '01 95 18 34 95', 'etIhqcw92LVatDmsLxb4ErmiculCq7VJGz2VCIQqOp1CAqf63RcshNDKB928E2qrTQqWyf', '', '2017-05-26 05:33:53', '2017-05-26 05:33:53');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adresse_clients`
--
ALTER TABLE `adresse_clients`
  ADD PRIMARY KEY (`adresses_id`),
  ADD KEY `fk_adresses_clients_utilisateurs1_idx` (`utilisateurs_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`,`utilisateurs_id`,`adresses_id`),
  ADD KEY `fk_commandes_utilisateurs1_idx` (`utilisateurs_id`),
  ADD KEY `fk_commandes_adresses1_idx` (`adresses_id`),
  ADD KEY `fk_commandes_livreurs1_idx` (`livreurs_id`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`id`,`produits_id`,`commandes_id`,`commandes_utilisateurs_id`),
  ADD KEY `fk_commande_produit_commandes1_idx` (`commandes_id`,`commandes_utilisateurs_id`),
  ADD KEY `fk_commande_produit_produits1_idx` (`produits_id`);

--
-- Index pour la table `livreurs`
--
ALTER TABLE `livreurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_livreurs_utilisateurs1_idx` (`utilisateurs_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produits_categories1_idx` (`categories_id`);

--
-- Index pour la table `stocks_livreurs`
--
ALTER TABLE `stocks_livreurs`
  ADD PRIMARY KEY (`id`,`livreurs_id`),
  ADD KEY `fk_produit_livreur_livreurs1_idx` (`livreurs_id`),
  ADD KEY `fk_stocks_livreurs_produits1_idx` (`produits_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `livreurs`
--
ALTER TABLE `livreurs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `stocks_livreurs`
--
ALTER TABLE `stocks_livreurs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adresse_clients`
--
ALTER TABLE `adresse_clients`
  ADD CONSTRAINT `fk_adresses_clients_adresses1` FOREIGN KEY (`adresses_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_adresses_clients_utilisateurs1` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `fk_commandes_adresses1` FOREIGN KEY (`adresses_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commandes_utilisateurs1` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `fk_commande_produit_commandes1` FOREIGN KEY (`commandes_id`,`commandes_utilisateurs_id`) REFERENCES `commandes` (`id`, `utilisateurs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_produit_produits1` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreurs`
--
ALTER TABLE `livreurs`
  ADD CONSTRAINT `fk_livreurs_utilisateurs1` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `fk_produits_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stocks_livreurs`
--
ALTER TABLE `stocks_livreurs`
  ADD CONSTRAINT `fk_produit_livreur_livreurs1` FOREIGN KEY (`livreurs_id`) REFERENCES `livreurs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stocks_livreurs_produits1` FOREIGN KEY (`produits_id`) REFERENCES `produits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
