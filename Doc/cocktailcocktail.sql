-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 29 mars 2020 à 10:28
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cocktailcocktail`
--

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailcategories`
--

DROP TABLE IF EXISTS `cocktailcocktailcategories`;
CREATE TABLE IF NOT EXISTS `cocktailcocktailcategories` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailcategories`
--

INSERT INTO `cocktailcocktailcategories` (`id`, `name`) VALUES
(1, 'Plateaux Repas'),
(2, 'Buffet'),
(3, 'Petit-déjeuner'),
(4, 'Lunch box'),
(5, 'Plateau sandwiches'),
(6, 'Cocktail'),
(7, 'Boissons');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmeal`
--

DROP TABLE IF EXISTS `cocktailcocktailmeal`;
CREATE TABLE IF NOT EXISTS `cocktailcocktailmeal` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_Subcategory` tinyint(5) NOT NULL,
  `id_MealCategory` tinyint(5) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Meal_Subcategory` (`id_Subcategory`),
  KEY `FK_Meal_MealCategory` (`id_MealCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailmeal`
--

INSERT INTO `cocktailcocktailmeal` (`id`, `id_Subcategory`, `id_MealCategory`, `description`) VALUES
(1, 1, NULL, 'Entré du marché'),
(2, 2, NULL, 'Plat du marché'),
(3, 3, NULL, 'Fromage du marché'),
(4, 4, NULL, 'Dessert du marché'),
(29, 7, 1, 'Emincé de volaille et crudités / Guacamole légèrement pimenté / Cream cheese à la ciboulette…'),
(30, 7, 2, 'Rillette de saumon et crème d’aneth / Fromage frais ciboulette / Chèvre et tomates confites…'),
(31, 7, 3, 'Rôti de veau braisé sauce tartare / Tapenade de légumes et pignons / Ricotta au basilic'),
(32, 7, 4, 'Carpaccio de bœuf et parmesan / Chèvre frais et concombre / Rillettes de saumon au tzaziki…'),
(33, 1, 5, 'Salade de pâtes vitaminée aux agrumes et à la coriandre '),
(34, 1, 5, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe'),
(35, 1, 5, 'Tartare de courgettes et tomates, féta aux herbes'),
(36, 1, 5, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin '),
(37, 1, 5, 'Tartare de tomates, réduction de balsamique à la savora, crumble de parmesan'),
(38, 1, 5, 'Salade fraîcheur, volaille caramélisée et vinaigrette de noisettes torréfiées'),
(39, 4, 6, 'Moelleux aux amandes et cassis, crème anglaise'),
(40, 4, 6, 'Fromage blanc de campagne aux pralines roses et coulis de fruits'),
(41, 4, 6, 'Tiramisu au cacao amer'),
(42, 4, 6, 'Compote de pommes et rhubarbe, copeaux de chocolat'),
(43, 4, 6, 'Salade d’ananas aux éclats de noix de pécan'),
(44, 4, 6, 'Panacotta au coulis de fruits rouges et zestes d’agrumes'),
(45, 4, 7, 'Brochettes de fruits frais, Mini Macarons, Opéra, Clafoutis…'),
(47, 5, 17, 'L’Ovale de Cassini'),
(48, 5, 18, 'Hautes Gravières, Graves'),
(49, 5, 19, 'Château Cassini, Saint Emilion BIO'),
(50, 5, 20, 'Héritage de Le Boscq, Saint Estèphe'),
(51, 1, NULL, 'Salade de pâtes vitaminée à la coriandre, vinaigrette d’agrumes'),
(52, 1, NULL, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe'),
(53, 1, NULL, 'Clafoutis de printemps aux légumes, coulis fraîcheur'),
(54, 1, NULL, 'Entrée du jour'),
(55, 2, NULL, 'Rôti de bœuf aux oignons doux, tagliatelles fondantes'),
(56, 2, NULL, 'Volaille rôtie aux légumes, crumble de parmesan, tomates confites au romarin '),
(57, 2, NULL, 'Millefeuille d’aubergines confites au bœuf, coulis de légumes au basilic '),
(58, 2, NULL, 'Pavé de lieu noir rôti sur peau, sauce à l’oseille, carottes biseau à la ciboule '),
(59, 2, NULL, 'Dos de saumon mariné sur peau, tagliatelles fraîches et légumes'),
(60, 2, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin '),
(61, 2, NULL, 'Plat du jour'),
(62, 3, NULL, 'Fromage affiné'),
(63, 3, NULL, 'Fromage frais de campagne aux herbes fraîches'),
(64, 4, NULL, 'Moelleux aux amandes et cassis, crème anglaise '),
(65, 4, NULL, 'Fromage blanc de campagne aux pralines roses et coulis de fruits '),
(66, 4, NULL, 'Mousse au chocolat, pépites de spéculoos '),
(67, 4, NULL, 'Fruit frais de saison '),
(68, 4, NULL, 'Dessert du jour '),
(69, 1, NULL, 'Oeuf poché, duo de carottes au vinaigre de framboises'),
(70, 1, NULL, 'Tartare de courgettes et tomates, féta aux herbes '),
(71, 1, NULL, 'Salade de ravioles au pesto,  légumes primeurs croquants'),
(72, 1, NULL, 'Entrée du jour'),
(73, 2, NULL, 'Quasi de veau rôti au miel,  wok de légumes du moment '),
(74, 2, NULL, 'Emincé de porc à l’arrabbiata,  salade pomme de terre au romarin '),
(75, 2, NULL, 'Rôti de filet de volaille mariné,  nouilles soba sautées façon thaï '),
(76, 2, NULL, 'Blanc de cabillaud iodé, croquant de légumes et émulsion de betterave rouge '),
(77, 2, NULL, 'Vapeur de saumon au tilleul, sauce raïta, copeaux de légumes fondants '),
(78, 2, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin '),
(79, 2, NULL, 'Plat du jour'),
(80, 3, NULL, 'Fromages affinés'),
(81, 3, NULL, 'Fromage frais de campagne aux herbes fraîches'),
(82, 4, NULL, 'Mi cuit au chocolat et fruits rouges, crème anglaise vanillée '),
(83, 4, NULL, 'Compote de pommes et rhubarbe rouge aux pralines roses '),
(84, 4, NULL, 'Dacquoise au citron confit,  coulis de fruits jaunes '),
(85, 4, NULL, 'Salade d’ananas aux éclats de noix de pécan '),
(86, 4, NULL, 'Dessert du jour '),
(87, 1, NULL, 'Saumon mariné, tartare d’avocats à la citronnelle, copeaux de fenouils '),
(88, 1, NULL, 'Tartare de tomates fraîches sur sablé parmesan vinaigrette balsamique à la savora'),
(89, 1, NULL, 'Salade fraîcheur, volaille caramélisée et vinaigrette de noisettes torréfiées'),
(90, 1, NULL, 'Entrée du jour  '),
(91, 2, NULL, 'Confit de bœuf aux carottes, sauce gribiche, salade de grenailles aux herbes '),
(92, 2, NULL, 'Emincé de veau poêlé à l’estragon, tatin de tomates confites au thym '),
(93, 2, NULL, 'Suprême de volaille aux olives Kalamata, tian de légumes aux courgettes jaunes '),
(94, 2, NULL, 'Gambas au curry et au lait de coco, légumes parfumés au poivre de Sichuan '),
(95, 2, NULL, 'Filet de dorade grillée, sauce vierge aux échalotes roses, linguines de courgettes et ratatouille '),
(96, 2, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin'),
(97, 2, NULL, 'Plat du jour'),
(98, 3, NULL, 'Fromages affinés'),
(99, 3, NULL, 'Fromage frais de campagne aux herbes fraîches'),
(100, 4, NULL, 'Marbré aux 2 chocolats et myrtille sauvage, crème anglaise'),
(101, 4, NULL, 'Pannacotta aux fruits rouges et zestes d’agrumes '),
(102, 4, NULL, 'Fondant de poires aux éclats d’amandes grillées '),
(103, 4, NULL, 'Salade de fruits frais, sirop au thé jasmin '),
(104, 4, NULL, 'Dessert du jour '),
(105, 1, NULL, 'Carpaccio de St jacques à la citronnelle, bouillon terre et mer au ponzu  '),
(106, 1, NULL, 'Pressé de volaille au citron confit basse température, chapelure d’herbelette'),
(107, 1, NULL, 'Gourmandises de fèves et petits pois primeurs, œuf poché et croquant '),
(108, 1, NULL, 'Entrée du jour'),
(109, 2, NULL, 'Filet de pintade à la tapenade de tomates, bayaldi d’aubergines '),
(110, 2, NULL, 'Piéce de bœuf poêlé aux girolles, dentelle de parmesan, compotée de légumes'),
(111, 2, NULL, 'Pavé de noix de veau au miel et ciboule, écrasé de pommes de terre douces'),
(112, 2, NULL, 'Filet de bar cuit et cru au cœur d’agrumes et huile parfumée, légumes grillés'),
(113, 2, NULL, 'Dos de rascasse poêlé, haricots blancs au pistou'),
(114, 2, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin '),
(115, 2, NULL, 'Plat du jour'),
(116, 3, NULL, 'Fromages affinés'),
(117, 3, NULL, 'Fromage frais de campagne aux herbes fraîches'),
(118, 4, NULL, 'Fondant de chocolat au thé vert, crème anglaise à la vanille  '),
(119, 4, NULL, 'Croustillant noisettes, coulis de fruits frais et petite meringue '),
(120, 4, NULL, 'Salade d’agrumes à la cannelle et pralines roses '),
(121, 4, NULL, 'Dessert du jour '),
(122, 1, NULL, 'Tartare de thon au gingembre, mangue, feuilles de shiso et tuile de lotus'),
(123, 1, NULL, 'Marbré de foie gras aux figues et piments d’Espelette laqué au jus de grenade '),
(124, 1, NULL, 'Œuf poché aux pointes d’asperges vertes, roquette et pecorino'),
(125, 1, NULL, 'Entrée du jour'),
(126, 2, NULL, 'Selle d’agneau à la sauge, polenta poêlé et légumes sifflets rôtis'),
(127, 2, NULL, 'Pintade fermière rôtie, salade de pois gourmands et haricots verts et pignons torréfiés'),
(128, 2, NULL, 'Mignon de veau poêlé à l’estragon, rose de pomme de terre rôtie'),
(129, 2, NULL, 'Saint jacques et gambas poêlées au curcuma, poêlé de pleurotes et girolles'),
(130, 2, NULL, 'Dos de dorade, vinaigrette gourmande aux fèves de soja, purée au beurre yuzu'),
(131, 2, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin '),
(132, 2, NULL, 'Plat du jour '),
(133, 3, NULL, 'Fromages affinés'),
(134, 3, NULL, 'Fromage frais de campagne aux herbes fraîches'),
(135, 4, NULL, 'Clafoutis de fruits frais caramélisé façon crème brulée'),
(136, 4, NULL, 'Cœur fondant chocolat et caramel au beurre salé '),
(137, 4, NULL, 'Salade de fruits frais et mangue rôtie'),
(138, 4, NULL, 'Dessert du jour '),
(139, 1, NULL, 'Clafoutis de légumes de saison, coulis fraîcheur '),
(140, 1, NULL, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe '),
(141, 1, NULL, 'Salade de pâte vitaminée à la coriandre, vinaigrette d’agrumes '),
(142, 2, NULL, 'Rôti de bœuf aux oignons doux '),
(143, 2, NULL, 'Filet de mignon de porc poêlé à l’arrabbiata, chips de coppa'),
(144, 3, NULL, 'Plateaux de fromages affinés '),
(145, 3, NULL, 'Mesclun croquant  '),
(146, 4, NULL, 'Tartes aux pommes aux pralines roses, coulis de fruits '),
(147, 4, NULL, 'Mousse au chocolat, copeaux de chocolat blanc et spéculos '),
(148, 1, NULL, 'Saumon mariné, tartare d’avocats à la citronnelle, copeaux de fenouils'),
(149, 1, NULL, 'Salade de ravioles au pesto, légumes primeurs croquants'),
(150, 1, NULL, 'Nouilles soba thaï à la citronnelle et au gingembre '),
(151, 2, NULL, 'Gourmandise de volaille au citron confit, crème fouettée à la coriandre'),
(152, 2, NULL, 'Blanc de cabillaud iodé, vinaigrette gourmande aux fèves de soja'),
(153, 3, NULL, 'Plateaux de Fromages affinés '),
(154, 3, NULL, 'Mesclun croquant '),
(155, 4, NULL, 'Tarte aux fruits de saison, amandes émondées '),
(156, 4, NULL, 'Salade d’ananas aux copeaux de noix de coco '),
(157, 1, NULL, 'Tartare de courgettes et tomates, féta aux herbes'),
(158, 1, NULL, 'Petite ratatouille de légumes confit au romarin '),
(159, 1, NULL, 'Farfalles au pécorino et piquillos, basilic ciselé'),
(160, 2, NULL, 'Volaille rôtie aux légumes, crumble de parmesan '),
(161, 2, NULL, 'Dos de dorade grillé aux herbes, vinaigrette gourmande et copeaux de légumes'),
(162, 3, NULL, 'Plateaux de fromages affinés '),
(163, 3, NULL, 'Mesclun croquant '),
(164, 4, NULL, 'Tarte aux fruits de saison '),
(165, 4, NULL, 'Dacquoise au lemoncello et citron confit, coulis de fruits frais'),
(166, 1, NULL, 'Marbré de foie gras aux figues, laqué au jus de grenade '),
(167, 1, NULL, 'Salade de roquette, œufs pochés et saumon fumé, pointes d’asperges vertes '),
(168, 1, NULL, 'Pipe rigate et haricots verts et champignons du moment'),
(169, 2, NULL, 'Petit rôti de pintade aux légumes croquants, sauce tartare'),
(170, 2, NULL, 'Dos de rascasse poêlé sur peau, vinaigrette d’agrumes '),
(171, 3, NULL, 'Plateaux de Fromages affinés '),
(172, 3, NULL, 'Mesclun aux pignons de pin grillés '),
(173, 4, NULL, 'Salade de fruits frais à la mangue rôtie, pistaches émondées'),
(174, 4, NULL, 'Mi cuit au chocolat, copeaux de pain d’épices, crème anglaise vanillée'),
(175, 5, NULL, 'Café Arabica'),
(176, 5, NULL, 'Thés assortis : English breakfast, Earl Grey, Jasmine green, Ginger lemongrass…'),
(177, 5, NULL, 'Evian et Perrier'),
(178, 5, NULL, 'Jus de fruit : Orange et pamplemousse rose'),
(179, 6, NULL, 'Croissants, pains au chocolat, pains aux raisins…'),
(180, 5, NULL, 'Café Arabica'),
(181, 5, NULL, 'Thés assortis : English breakfast, Earl Grey, Jasmine green, Ginger lemongrass…'),
(182, 5, NULL, 'Evian et Perrier'),
(183, 5, NULL, 'Jus de fruits : Orange et pamplemousse rose'),
(184, 6, NULL, 'Croissants, pains au chocolat, pains aux raisins…'),
(185, 6, NULL, '1 brochette de fruits frais de saison'),
(186, 1, NULL, 'Salade de pâtes vitaminée aux agrumes et à la coriandre'),
(187, 1, NULL, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe'),
(188, 1, NULL, 'Tartare de courgettes et tomates, féta aux herbes'),
(189, 1, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin '),
(190, 1, NULL, 'Tartare de tomates, réduction de balsamique à la savora, crumble de parmesan'),
(191, 1, NULL, 'Salade fraîcheur, volaille caramélisée et vinaigrette de noisettes torréfiées'),
(192, 7, NULL, 'Club sandwiches :  Emincé de volaille et crudités / Guacamole légèrement pimenté'),
(193, 7, NULL, 'Pain nordique :  Rillette de saumon et crème d’aneth / Fromage frais ciboulette'),
(194, 7, NULL, 'Foccacia :  Rôti de veau braisé sauce tartare / Tapenade de légumes et pignons'),
(195, 7, NULL, 'Pain viennois :  Carpaccio de bœuf et parmesan / Chèvre frais et concombre'),
(196, 4, NULL, 'Moelleux aux amandes et cassis, crème anglaise '),
(197, 4, NULL, 'Fromage blanc de campagne aux pralines roses et coulis de fruits'),
(198, 4, NULL, 'Tiramisu au cacao amer'),
(199, 4, NULL, 'Compote de pommes et rhubarbe, copeaux de chocolat  '),
(200, 4, NULL, 'Salade d’ananas aux éclats de noix de pécan'),
(201, 4, NULL, 'Panacotta au coulis de fruits rouges et zestes d’agrumes');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmealcategory`
--

DROP TABLE IF EXISTS `cocktailcocktailmealcategory`;
CREATE TABLE IF NOT EXISTS `cocktailcocktailmealcategory` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailmealcategory`
--

INSERT INTO `cocktailcocktailmealcategory` (`id`, `name`, `price`) VALUES
(1, 'Plateau de Demi-Club sandwichs pain de mie', 60.00),
(2, 'Plateau de sandwiches pain « Nordique »', 60.00),
(3, 'Plateau de sandwiches « Focaccia »', 60.00),
(4, 'Plateau de sandwiches pain viennois', 60.00),
(5, 'Petits pots d\'Entrées', 3.00),
(6, 'Petits pots de Desserts', 3.50),
(7, 'Assortiment de 5 pièces sucrées', 7.00),
(17, 'Rouge', 12.00),
(18, 'Rouge', 15.00),
(19, 'Rouge', 17.00),
(20, 'Rouge', 20.00);

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmenu`
--

DROP TABLE IF EXISTS `cocktailcocktailmenu`;
CREATE TABLE IF NOT EXISTS `cocktailcocktailmenu` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_Category` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(4,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Menu_Category` (`id_Category`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailmenu`
--

INSERT INTO `cocktailcocktailmenu` (`id`, `id_Category`, `name`, `price`, `image_url`, `creationDate`) VALUES
(1, 1, 'Menu du Marché', 23.00, 'User_01BIS.png', '2019-10-19'),
(2, 2, 'Buffet Tradition', 21.00, 'User_01BIS.png', '2019-10-17'),
(3, 2, 'Buffet du Monde', 26.00, 'User_01BIS.png', '2019-10-17'),
(4, 2, 'Buffet Italien', 23.00, 'User_01BIS.png', '2019-10-17'),
(5, 2, 'Buffet Découverte', 32.00, 'User_01BIS.png', '2019-10-17'),
(6, 1, 'Menu Tradition', 19.90, 'User_01BIS.png', '2019-10-17'),
(7, 1, 'Menu Gourmet', 22.90, 'User_01BIS.png', '2019-10-17'),
(8, 1, 'Menu Plaisir', 24.90, 'User_01BIS.png', '2019-10-17'),
(9, 1, 'Menu Délice', 27.90, 'User_01BIS.png', '2019-10-17'),
(10, 1, 'Menu Prestige', 32.90, 'User_01BIS.png', '2019-10-17'),
(23, 3, 'Petit-Déjeuner Classique', 8.00, 'User_01BIS.png', '2019-10-18'),
(24, 3, 'Petit-Déjeuner Prestige', 10.00, 'User_01BIS.png', '2019-10-18'),
(25, 4, 'Lunch Box Classique', 15.00, 'User_01BIS.png', '2020-01-14'),
(26, 5, 'Plateau Sandwiches Classique', 0.00, 'User_01BIS.png', '2019-10-19'),
(27, 6, 'Apéritif 8 pièces', 12.00, 'User_01BIS.png', '2019-10-20'),
(28, 6, 'Apéritif 12 pièces', 18.00, 'User_01BIS.png', '2019-10-20'),
(29, 6, 'Déjeuner 20 pièces', 28.00, 'User_01BIS.png', '2019-10-20'),
(30, 6, 'Déjeuner 25 pièces', 35.00, 'User_01BIS.png', '2019-10-20'),
(31, 6, 'Goûter 10 pièces', 15.00, 'User_01BIS.png', '2019-10-20'),
(32, 7, 'Bordeaux', 0.00, 'User_01BIS.png', '2019-10-20'),
(33, 7, 'Bourgogne', 0.00, 'User_01BIS.png', '2019-10-20'),
(34, 7, 'Loire', 0.00, 'User_01BIS.png', '2019-10-20'),
(35, 7, 'Vallée du Rhone', 0.00, 'User_01BIS.png', '2019-10-20'),
(36, 7, 'Autre', 0.00, 'User_01BIS.png', '2019-10-20'),
(37, 7, 'Champagne', 0.00, 'User_01BIS.png', '2019-10-20'),
(38, 7, 'Non Alcoolisée', 0.00, 'User_01BIS.png', '2019-10-20'),
(39, 7, 'Boisson Chaude', 0.00, 'User_01BIS.png', '2019-10-20'),
(40, 7, 'Alcool', 0.00, 'User_01BIS.png', '2019-10-20'),
(41, 7, 'Diver', 0.00, 'User_01BIS.png', '2019-10-20');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmenumeal`
--

DROP TABLE IF EXISTS `cocktailcocktailmenumeal`;
CREATE TABLE IF NOT EXISTS `cocktailcocktailmenumeal` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_Menu` tinyint(5) NOT NULL,
  `id_Meal` int(5) NOT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Menu_Meal_Menu` (`id_Menu`),
  KEY `FK_Menu_Meal_Meal` (`id_Meal`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailmenumeal`
--

INSERT INTO `cocktailcocktailmenumeal` (`id`, `id_Menu`, `id_Meal`, `creationDate`) VALUES
(1, 1, 1, '2019-10-07'),
(2, 1, 2, '2019-10-07'),
(3, 1, 3, '2019-10-07'),
(4, 1, 4, '2019-10-07'),
(26, 26, 29, '2019-10-20'),
(27, 26, 30, '2019-10-20'),
(28, 26, 30, '2019-10-20'),
(29, 26, 31, '2019-10-20'),
(30, 26, 32, '2019-10-20'),
(31, 26, 33, '2019-10-20'),
(32, 26, 34, '2019-10-20'),
(33, 26, 35, '2019-10-20'),
(34, 26, 36, '2019-10-20'),
(35, 26, 37, '2019-10-20'),
(36, 26, 38, '2019-10-20'),
(37, 26, 39, '2019-10-20'),
(38, 26, 40, '2019-10-20'),
(39, 26, 41, '2019-10-20'),
(40, 26, 42, '2019-10-20'),
(41, 26, 43, '2019-10-20'),
(42, 26, 44, '2019-10-20'),
(43, 26, 45, '2019-10-20'),
(45, 32, 47, '2019-10-20'),
(46, 32, 48, '2019-10-20'),
(47, 32, 49, '2019-10-20'),
(48, 32, 50, '2019-10-20'),
(49, 6, 51, '2020-01-14'),
(50, 6, 52, '2020-01-14'),
(51, 6, 53, '2020-01-14'),
(52, 6, 54, '2020-01-14'),
(53, 6, 55, '2020-01-14'),
(54, 6, 56, '2020-01-14'),
(55, 6, 57, '2020-01-14'),
(56, 6, 58, '2020-01-14'),
(57, 6, 59, '2020-01-14'),
(58, 6, 60, '2020-01-14'),
(59, 6, 61, '2020-01-14'),
(60, 6, 62, '2020-01-14'),
(61, 6, 63, '2020-01-14'),
(62, 6, 64, '2020-01-14'),
(63, 6, 65, '2020-01-14'),
(64, 6, 66, '2020-01-14'),
(65, 6, 67, '2020-01-14'),
(66, 6, 68, '2020-01-14'),
(67, 7, 69, '2020-01-14'),
(68, 7, 70, '2020-01-14'),
(69, 7, 71, '2020-01-14'),
(70, 7, 72, '2020-01-14'),
(71, 7, 73, '2020-01-14'),
(72, 7, 74, '2020-01-14'),
(73, 7, 75, '2020-01-14'),
(74, 7, 76, '2020-01-14'),
(75, 7, 77, '2020-01-14'),
(76, 7, 78, '2020-01-14'),
(77, 7, 79, '2020-01-14'),
(78, 7, 80, '2020-01-14'),
(79, 7, 81, '2020-01-14'),
(80, 7, 82, '2020-01-14'),
(81, 7, 83, '2020-01-14'),
(82, 7, 84, '2020-01-14'),
(83, 7, 85, '2020-01-14'),
(84, 7, 86, '2020-01-14'),
(85, 8, 87, '2020-01-14'),
(86, 8, 88, '2020-01-14'),
(87, 8, 89, '2020-01-14'),
(88, 8, 90, '2020-01-14'),
(89, 8, 91, '2020-01-14'),
(90, 8, 92, '2020-01-14'),
(91, 8, 93, '2020-01-14'),
(92, 8, 94, '2020-01-14'),
(93, 8, 95, '2020-01-14'),
(94, 8, 96, '2020-01-14'),
(95, 8, 97, '2020-01-14'),
(96, 8, 98, '2020-01-14'),
(97, 8, 99, '2020-01-14'),
(98, 8, 100, '2020-01-14'),
(99, 8, 101, '2020-01-14'),
(100, 8, 102, '2020-01-14'),
(101, 8, 103, '2020-01-14'),
(102, 8, 104, '2020-01-14'),
(103, 9, 105, '2020-01-14'),
(104, 9, 106, '2020-01-14'),
(105, 9, 107, '2020-01-14'),
(106, 9, 108, '2020-01-14'),
(107, 9, 109, '2020-01-14'),
(108, 9, 110, '2020-01-14'),
(109, 9, 111, '2020-01-14'),
(110, 9, 112, '2020-01-14'),
(111, 9, 113, '2020-01-14'),
(112, 9, 114, '2020-01-14'),
(113, 9, 115, '2020-01-14'),
(114, 9, 116, '2020-01-14'),
(115, 9, 117, '2020-01-14'),
(116, 9, 118, '2020-01-14'),
(117, 9, 119, '2020-01-14'),
(118, 9, 120, '2020-01-14'),
(119, 9, 121, '2020-01-14'),
(120, 10, 122, '2020-01-14'),
(121, 10, 123, '2020-01-14'),
(122, 10, 124, '2020-01-14'),
(123, 10, 125, '2020-01-14'),
(124, 10, 126, '2020-01-14'),
(127, 10, 127, '2020-01-14'),
(128, 10, 128, '2020-01-14'),
(129, 10, 129, '2020-01-14'),
(130, 10, 130, '2020-01-14'),
(131, 10, 131, '2020-01-14'),
(132, 10, 132, '2020-01-14'),
(133, 10, 133, '2020-01-14'),
(134, 10, 134, '2020-01-14'),
(135, 10, 135, '2020-01-14'),
(136, 10, 136, '2020-01-14'),
(137, 10, 137, '2020-01-14'),
(138, 10, 138, '2020-01-14'),
(139, 2, 139, '2020-01-14'),
(140, 2, 140, '2020-01-14'),
(141, 2, 141, '2020-01-14'),
(142, 2, 142, '2020-01-14'),
(143, 2, 143, '2020-01-14'),
(144, 2, 144, '2020-01-14'),
(145, 2, 145, '2020-01-14'),
(146, 2, 146, '2020-01-14'),
(147, 2, 147, '2020-01-14'),
(148, 3, 148, '2020-01-14'),
(149, 3, 149, '2020-01-14'),
(150, 3, 150, '2020-01-14'),
(151, 3, 151, '2020-01-14'),
(152, 3, 152, '2020-01-14'),
(153, 3, 153, '2020-01-14'),
(154, 3, 154, '2020-01-14'),
(155, 3, 155, '2020-01-14'),
(156, 3, 156, '2020-01-14'),
(157, 4, 157, '2020-01-14'),
(158, 4, 158, '2020-01-14'),
(159, 4, 159, '2020-01-14'),
(160, 4, 160, '2020-01-14'),
(161, 4, 161, '2020-01-14'),
(162, 4, 162, '2020-01-14'),
(163, 4, 163, '2020-01-14'),
(164, 4, 164, '2020-01-14'),
(165, 4, 165, '2020-01-14'),
(166, 5, 166, '2020-01-14'),
(167, 5, 167, '2020-01-14'),
(168, 5, 168, '2020-01-14'),
(169, 5, 169, '2020-01-14'),
(170, 5, 170, '2020-01-14'),
(171, 5, 171, '2020-01-14'),
(172, 5, 172, '2020-01-14'),
(173, 5, 173, '2020-01-14'),
(174, 5, 174, '2020-01-14'),
(175, 23, 175, '2020-01-14'),
(176, 23, 176, '2020-01-14'),
(177, 23, 177, '2020-01-14'),
(178, 23, 178, '2020-01-14'),
(179, 23, 179, '2020-01-14'),
(180, 24, 180, '2020-01-14'),
(181, 24, 181, '2020-01-14'),
(182, 24, 182, '2020-01-14'),
(183, 24, 183, '2020-01-14'),
(184, 24, 184, '2020-01-14'),
(185, 24, 185, '2020-01-14'),
(186, 25, 186, '2020-01-14'),
(187, 25, 187, '2020-01-14'),
(188, 25, 188, '2020-01-14'),
(189, 25, 189, '2020-01-14'),
(190, 25, 190, '2020-01-14'),
(191, 25, 191, '2020-01-14'),
(192, 25, 192, '2020-01-14'),
(193, 25, 193, '2020-01-14'),
(194, 25, 194, '2020-01-14'),
(195, 25, 195, '2020-01-14'),
(196, 25, 196, '2020-01-14'),
(197, 25, 197, '2020-01-14'),
(198, 25, 198, '2020-01-14'),
(199, 25, 199, '2020-01-14'),
(200, 25, 200, '2020-01-14'),
(201, 25, 201, '2020-01-14');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailsubcategories`
--

DROP TABLE IF EXISTS `cocktailcocktailsubcategories`;
CREATE TABLE IF NOT EXISTS `cocktailcocktailsubcategories` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailsubcategories`
--

INSERT INTO `cocktailcocktailsubcategories` (`id`, `name`) VALUES
(1, 'Entré'),
(2, 'Plat'),
(3, 'Fromage'),
(4, 'Dessert'),
(5, 'Boisson'),
(6, 'Autre'),
(7, 'Sandwiches');

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

DROP TABLE IF EXISTS `header`;
CREATE TABLE IF NOT EXISTS `header` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `metaDescription` text NOT NULL,
  `metaKeywords` text NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `metaDescription`, `metaKeywords`, `lang`) VALUES
(1, '', '', '', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `lang`
--

DROP TABLE IF EXISTS `lang`;
CREATE TABLE IF NOT EXISTS `lang` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lang`
--

INSERT INTO `lang` (`id`, `code`) VALUES
(1, 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `lesterrassescategories`
--

DROP TABLE IF EXISTS `lesterrassescategories`;
CREATE TABLE IF NOT EXISTS `lesterrassescategories` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lesterrassescategories`
--

INSERT INTO `lesterrassescategories` (`id`, `name`) VALUES
(1, 'Entrées'),
(2, 'Plats'),
(3, 'Desserts'),
(4, 'Sur le pource');

-- --------------------------------------------------------

--
-- Structure de la table `lesterrassesmeal`
--

DROP TABLE IF EXISTS `lesterrassesmeal`;
CREATE TABLE IF NOT EXISTS `lesterrassesmeal` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `id_Category` tinyint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double(4,2) NOT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LesTerrassesMeal_Category` (`id_Category`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lesterrassesmeal`
--

INSERT INTO `lesterrassesmeal` (`id`, `id_Category`, `description`, `price`, `creationDate`) VALUES
(1, 1, 'Lentilles aux Herbes et Lamelle de Magret de Canard Fumé', 11.00, '2019-10-21'),
(2, 2, 'Chakchouka Nature ou au Chorizo', 15.00, '2019-11-19'),
(3, 3, 'Tiramisu à l’Italienne', 8.00, '2019-10-21'),
(4, 1, 'Salade de Gambas aux Herbes Fraîches', 11.00, '2019-11-19'),
(5, 1, 'Carpaccio de Tomates à l’Orientale, Thon et Menthe Fraîche', 11.00, '2019-11-19'),
(6, 1, 'Carpaccio de Tomates, Mozzarella Di Buffala et Menthe Fraîche', 11.00, '2019-11-19'),
(7, 1, 'Carpaccio de Bœuf aux Copeaux de Parmesan , Mesclun de Salade à l’Huile Vierge', 13.00, '2019-11-19'),
(8, 1, 'Croquant de Fenouil, Daurade Marinée aux Herbes Fraîches', 13.00, '2019-11-19'),
(9, 2, 'Dos de Saumon, Sauce Crustacés, Petits Légumes', 15.00, '2019-11-19'),
(10, 2, 'Penne aux Légumes Grillés et Copeaux de Parmesan (Végétarien)', 14.00, '2019-11-19'),
(11, 2, 'Parmentier de Canard, Salade Verte', 15.00, '2019-11-19'),
(12, 2, 'Noix de Saint Jacques et Gambas, Fondue de Jeunes Pousses de Poireaux', 17.00, '2019-11-19'),
(13, 2, 'Poulet Fermier de Bresse au Vin Jaune, Fèves et Champignons', 15.00, '2019-11-19'),
(14, 2, 'Papillote de Flétan au Lait de Coco, Julienne de Légumes, Riz Basmati', 15.00, '2019-11-19'),
(15, 2, 'Epaule d’Agneau Confit de 7 heures et Haricots Paimpol', 17.00, '2019-11-19'),
(16, 3, 'Salade de Fruits Frais de Saison', 8.00, '2019-11-19'),
(17, 3, 'Tarte Citron Meringuée', 8.00, '2019-11-19'),
(18, 3, 'Riz au Lait, Caramel Beurre Salé et Amandes Grillées', 8.00, '2019-11-19'),
(19, 3, 'Crumble Pêche-Poire', 8.00, '2019-11-19'),
(20, 3, 'Clafoutis aux Cerises', 8.00, '2019-11-19'),
(21, 3, 'Verrine de Fraises, Chantilly à la Vanille de Bourbon', 8.00, '2019-11-19'),
(22, 3, 'Vraie Polonaise et sa Crème Anglaise', 8.00, '2019-11-19'),
(23, 3, 'Café Gourmand', 9.00, '2019-11-19'),
(24, 3, 'Thé Gourmand', 10.00, '2019-11-19'),
(25, 4, 'Trianon au chocolat', 12.00, '2019-12-23');

-- --------------------------------------------------------

--
-- Structure de la table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_User` tinyint(5) DEFAULT NULL,
  `isCompany` bit(1) NOT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `companySiret` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fromCompany` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `eventDate` varchar(255) DEFAULT NULL,
  `eventTime` varchar(255) DEFAULT NULL,
  `people` int(5) DEFAULT NULL,
  `isCommand` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `request`
--

INSERT INTO `request` (`id`, `id_User`, `isCompany`, `companyName`, `companySiret`, `firstname`, `lastname`, `phoneNumber`, `email`, `fromCompany`, `message`, `eventDate`, `eventTime`, `people`, `isCommand`, `creationDate`) VALUES
(1, NULL, b'1', 'Betclic', 'FR76129803344', 'Nicolas', 'Beraud', '0689571118', 'ergerg@azd.com', 'Mets-Tendances', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2019-12-12', '15:00:00', 35, 0, '2019-11-08'),
(2, NULL, b'0', NULL, NULL, 'Thibault', 'Dulon', '0689675644', 'zzerrty@gmail.com', 'Cocktail-Cocktail', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis nisi risus. Pellentesque tincidunt diam mi, bibendum auctor lacus lacinia id. Nunc dignissim semper convallis. Donec eu luctus tellus, eu lacinia nibh. Aenean laoreet, ipsum eget facilisis pharetra, lacus orci commodo eros, et tempor dui diam vel ante. Donec eget urna id ex auctor suscipit. Fusce id feugiat arcu. Aliquam erat volutpat.', NULL, NULL, NULL, 0, '2019-11-30'),
(3, NULL, b'1', 'KEAKR', '134RFR30', NULL, NULL, '0689471118', 'thibault.dulon@gmail.com', 'Mets-Tendances', 'zedfp iojze vpijzef pijzef ', NULL, NULL, NULL, 0, '2019-11-18 16:46:30'),
(4, NULL, b'1', 'testca', 'testca', NULL, NULL, '09876543', 'gervdf@erve.vom', 'Mets-Tendances', '', NULL, NULL, NULL, 0, '2020-02-01 22:49:43'),
(5, NULL, b'1', 'testca', 'testca', NULL, NULL, '09876543', 'gervdf@erve.vom', 'Mets-Tendances', '', NULL, NULL, NULL, 0, '2020-02-01 22:50:32'),
(6, NULL, b'1', 'KEAKR', '134RFR30', NULL, NULL, '0689471118', 'thibault.dulon@gmail.com', 'Mets-Tendances', 'zEFP 99UZE FP9UEP ZEC ZEP VZEUP', '2018-06-04', NULL, 20, 0, '2020-02-02 21:27:39'),
(7, NULL, b'1', 'KEAKR', '134RFR30', NULL, NULL, '0610370251', 'thibault.dulon@gmail.com', 'Cocktail-Cocktail', 'reg e terhtyn uj yuj rdfv', NULL, NULL, NULL, 0, '2020-03-21 16:52:18'),
(8, NULL, b'1', 'testca', 'zef9898', NULL, NULL, '+33689471118', 'thibault.dulon@gmail.com', 'Cocktail-Cocktail', 'uhkbjnk,;', NULL, NULL, NULL, 0, '2020-03-22 17:03:14'),
(9, NULL, b'1', 'keakr', 'zef9898', NULL, NULL, '+33689471118', 'thibault.dulon@gmail.com', 'Cocktail-Cocktail', 'dsfgh', NULL, NULL, NULL, 0, '2020-03-22 17:40:33'),
(10, 5, b'1', NULL, NULL, NULL, NULL, '', '', 'Cocktail-Cocktail', '', NULL, NULL, NULL, 0, '2020-03-22 17:54:16'),
(11, 5, b'1', NULL, NULL, NULL, NULL, '', 'ererg@ergerg.erg', 'Cocktail-Cocktail', '', NULL, NULL, NULL, 1, '2020-03-22 17:57:16');

-- --------------------------------------------------------

--
-- Structure de la table `requestcart`
--

DROP TABLE IF EXISTS `requestcart`;
CREATE TABLE IF NOT EXISTS `requestcart` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_Request` int(5) NOT NULL,
  `id_Menu` int(5) NOT NULL,
  `id_Meal` int(5) NOT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_requestcart_request` (`id_Request`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `requestcart`
--

INSERT INTO `requestcart` (`id`, `id_Request`, `id_Menu`, `id_Meal`, `quantity`) VALUES
(4, 7, 6, 51, 2),
(5, 7, 6, 55, 2),
(6, 7, 6, 62, 2),
(7, 7, 6, 64, 2),
(8, 7, 7, 71, 3),
(9, 7, 7, 77, 3),
(10, 7, 7, 80, 3),
(11, 7, 7, 84, 3),
(12, 8, 26, 33, 1),
(13, 8, 26, 39, 1),
(14, 8, 26, 29, 1),
(15, 9, 32, 47, 2),
(16, 9, 32, 48, 1),
(17, 9, 32, 49, 2),
(18, 9, 26, 33, 2),
(19, 9, 26, 36, 2),
(20, 9, 26, 37, 1),
(21, 9, 26, 39, 1),
(22, 9, 26, 42, 2),
(23, 9, 26, 44, 2),
(24, 9, 26, 29, 1),
(25, 9, 26, 31, 2),
(26, 9, 26, 32, 2);

-- --------------------------------------------------------

--
-- Structure de la table `rewrittingurl`
--

DROP TABLE IF EXISTS `rewrittingurl`;
CREATE TABLE IF NOT EXISTS `rewrittingurl` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `idRouteUrl` tinyint(5) NOT NULL,
  `urlMatched` varchar(255) NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'fr',
  PRIMARY KEY (`id`),
  KEY `FK_RewrittingUrl_RouteUrl` (`idRouteUrl`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rewrittingurl`
--

INSERT INTO `rewrittingurl` (`id`, `idRouteUrl`, `urlMatched`, `lang`) VALUES
(1, 1, '/', 'fr'),
(3, 2, '/404.html', 'fr'),
(5, 3, '/mentions-legales.html', 'fr'),
(6, 4, '/qui-sommes-nous.html', 'fr'),
(7, 5, '/nos-services.html', 'fr'),
(8, 6, '/catalogue.html', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `routeurl`
--

DROP TABLE IF EXISTS `routeurl`;
CREATE TABLE IF NOT EXISTS `routeurl` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `controller` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `order` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `routeurl`
--

INSERT INTO `routeurl` (`id`, `name`, `controller`, `action`, `order`) VALUES
(1, 'home', 'home', 'index', 0),
(2, 'error404', 'home', 'error404', 0),
(3, 'legal', 'home', 'legal', 0),
(4, 'about', 'home', 'about', 0),
(5, 'services', 'home', 'services', 0),
(6, 'catalog', 'home', 'catalog', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `isCompany` bit(1) NOT NULL DEFAULT b'0',
  `companyName` varchar(255) DEFAULT NULL,
  `companySiret` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'0',
  `fromCompany` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `isCompany`, `companyName`, `companySiret`, `firstname`, `lastname`, `phoneNumber`, `email`, `address`, `city`, `isActive`, `fromCompany`, `password`, `creationDate`) VALUES
(1, b'1', 'Betclic', 'FR01240982', 'Nicolas', 'Berault', '06896745', 'berault@betclic.com', '1 rue de truc', 'Paris', b'0', 'Mets-Tendances', NULL, '2019-09-27'),
(3, b'0', '', '', 'thibault', 'dulon', '0689471118', 'test@test.com', '38 rue du bouvier', 'Paris', b'1', 'Mets-Tendances', NULL, '2019-10-01'),
(5, b'0', '', '', 'cedric', 'regnier', '09876543', 'ererg@ergerg.erg', '46 avenue mitterand', 'Paris', b'1', 'Cocktail-Cocktail', 'azertyuiop', '2019-10-01');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cocktailcocktailmeal`
--
ALTER TABLE `cocktailcocktailmeal`
  ADD CONSTRAINT `FK_Meal_MealCategory` FOREIGN KEY (`id_MealCategory`) REFERENCES `cocktailcocktailmealcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Meal_Subcategory` FOREIGN KEY (`id_Subcategory`) REFERENCES `cocktailcocktailsubcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cocktailcocktailmenu`
--
ALTER TABLE `cocktailcocktailmenu`
  ADD CONSTRAINT `FK_Menu_Category` FOREIGN KEY (`id_Category`) REFERENCES `cocktailcocktailcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cocktailcocktailmenumeal`
--
ALTER TABLE `cocktailcocktailmenumeal`
  ADD CONSTRAINT `FK_Menu_Meal_Meal` FOREIGN KEY (`id_Meal`) REFERENCES `cocktailcocktailmeal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Menu_Meal_Menu` FOREIGN KEY (`id_Menu`) REFERENCES `cocktailcocktailmenu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lesterrassesmeal`
--
ALTER TABLE `lesterrassesmeal`
  ADD CONSTRAINT `FK_LesTerrassesMeal_Category` FOREIGN KEY (`id_Category`) REFERENCES `lesterrassescategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `requestcart`
--
ALTER TABLE `requestcart`
  ADD CONSTRAINT `FK_requestcart_request` FOREIGN KEY (`id_Request`) REFERENCES `request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rewrittingurl`
--
ALTER TABLE `rewrittingurl`
  ADD CONSTRAINT `FK_RewrittingUrl_RouteUrl` FOREIGN KEY (`idRouteUrl`) REFERENCES `routeurl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
