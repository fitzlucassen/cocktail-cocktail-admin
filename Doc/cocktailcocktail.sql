-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  sam. 05 sep. 2020 à 12:17
-- Version du serveur :  5.5.61-38.13-log
-- Version de PHP :  7.3.6

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

CREATE TABLE `cocktailcocktailcategories` (
  `id` tinyint(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailcategories`
--

INSERT INTO `cocktailcocktailcategories` (`id`, `name`) VALUES
(1, 'Plateaux Repas'),
(2, 'Buffet'),
(3, 'Petit-déjeuner'),
(4, 'Lunch box'),
(5, 'Sandwiches & Snacking'),
(6, 'Cocktail'),
(7, 'Boissons'),
(12, 'Planches');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmeal`
--

CREATE TABLE `cocktailcocktailmeal` (
  `id` int(5) NOT NULL,
  `id_Subcategory` tinyint(5) NOT NULL,
  `id_MealCategory` tinyint(5) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailmeal`
--

INSERT INTO `cocktailcocktailmeal` (`id`, `id_Subcategory`, `id_MealCategory`, `description`, `active`) VALUES
(1, 2, NULL, 'Entré du marché', 1),
(2, 3, NULL, 'Plat du marché', 1),
(3, 4, NULL, 'Fromage du marché', 1),
(4, 5, NULL, 'Dessert du marché', 1),
(29, 1, 1, 'Emincé de volaille et crudités / Guacamole légèrement pimenté / Cream cheese à la ciboulette…', 1),
(30, 1, 2, 'Rillette de saumon et crème d’aneth / Fromage frais ciboulette / Chèvre et tomates confites…', 1),
(31, 1, 3, 'Rôti de veau braisé sauce tartare / Tapenade de légumes et pignons / Ricotta au basilic', 1),
(32, 1, 4, 'Carpaccio de bœuf et parmesan / Chèvre frais et concombre / Rillettes de saumon au tzaziki…', 1),
(33, 2, 5, 'Salade de pâtes vitaminée aux agrumes et à la coriandre ', 1),
(34, 2, 5, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe', 1),
(35, 2, 5, 'Tartare de courgettes et tomates, féta aux herbes', 1),
(36, 2, 5, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin ', 1),
(37, 2, 5, 'Tartare de tomates, réduction de balsamique à la savora, crumble de parmesan', 1),
(38, 2, 5, 'Salade fraîcheur, volaille caramélisée et vinaigrette de noisettes torréfiées', 1),
(39, 5, 6, 'Moelleux aux amandes et cassis, crème anglaise', 1),
(40, 5, 6, 'Fromage blanc de campagne aux pralines roses et coulis de fruits', 1),
(41, 5, 6, 'Tiramisu au cacao amer', 1),
(42, 5, 6, 'Compote de pommes et rhubarbe, copeaux de chocolat', 1),
(43, 5, 6, 'Salade d’ananas aux éclats de noix de pécan', 1),
(44, 5, 6, 'Panacotta au coulis de fruits rouges et zestes d’agrumes', 1),
(45, 5, 7, 'Brochettes de fruits frais, Mini Macarons, Opéra, Clafoutis…', 1),
(47, 6, 17, 'L’Ovale de Cassini', 1),
(48, 6, 18, 'Hautes Gravières, Graves', 1),
(49, 6, 19, 'Château Cassini, Saint Emilion BIO', 1),
(50, 6, 20, 'Héritage de Le Boscq, Saint Estèphe', 1),
(51, 2, NULL, 'Salade de pâtes vitaminée à la coriandre, vinaigrette d’agrumes', 1),
(52, 2, NULL, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe', 1),
(53, 2, NULL, 'Clafoutis de printemps aux légumes, coulis fraîcheur', 1),
(54, 2, NULL, 'Entrée du jour', 1),
(55, 3, NULL, 'Rôti de bœuf aux oignons doux, tagliatelles fondantes', 1),
(56, 3, NULL, 'Volaille rôtie aux légumes, crumble de parmesan, tomates confites au romarin ', 1),
(57, 3, NULL, 'Millefeuille d’aubergines confites au bœuf, coulis de légumes au basilic ', 1),
(58, 3, NULL, 'Pavé de lieu noir rôti sur peau, sauce à l’oseille, carottes biseau à la ciboule ', 1),
(59, 3, NULL, 'Dos de saumon mariné sur peau, tagliatelles fraîches et légumes', 1),
(60, 3, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin ', 1),
(61, 3, NULL, 'Plat du jour', 1),
(62, 4, NULL, 'Fromage affiné', 1),
(63, 4, NULL, 'Fromage frais de campagne aux herbes fraîches', 1),
(64, 5, NULL, 'Moelleux aux amandes et cassis, crème anglaise ', 1),
(65, 5, NULL, 'Fromage blanc de campagne aux pralines roses et coulis de fruits ', 1),
(66, 5, NULL, 'Mousse au chocolat, pépites de spéculoos ', 1),
(67, 5, NULL, 'Fruit frais de saison ', 1),
(68, 5, NULL, 'Dessert du jour ', 1),
(69, 2, NULL, 'Oeuf poché, duo de carottes au vinaigre de framboises', 1),
(70, 2, NULL, 'Tartare de courgettes et tomates, féta aux herbes ', 1),
(71, 2, NULL, 'Salade de ravioles au pesto,  légumes primeurs croquants', 1),
(72, 2, NULL, 'Entrée du jour', 1),
(73, 3, NULL, 'Quasi de veau rôti au miel,  wok de légumes du moment ', 1),
(74, 3, NULL, 'Emincé de porc à l’arrabbiata,  salade pomme de terre au romarin ', 1),
(75, 3, NULL, 'Rôti de filet de volaille mariné,  nouilles soba sautées façon thaï ', 1),
(76, 3, NULL, 'Blanc de cabillaud iodé, croquant de légumes et émulsion de betterave rouge ', 1),
(77, 3, NULL, 'Vapeur de saumon au tilleul, sauce raïta, copeaux de légumes fondants ', 1),
(78, 3, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin ', 1),
(79, 3, NULL, 'Plat du jour', 1),
(80, 4, NULL, 'Fromages affinés', 1),
(81, 4, NULL, 'Fromage frais de campagne aux herbes fraîches', 1),
(82, 5, NULL, 'Mi cuit au chocolat et fruits rouges, crème anglaise vanillée ', 1),
(83, 5, NULL, 'Compote de pommes et rhubarbe rouge aux pralines roses ', 1),
(84, 5, NULL, 'Dacquoise au citron confit,  coulis de fruits jaunes ', 1),
(85, 5, NULL, 'Salade d’ananas aux éclats de noix de pécan ', 1),
(86, 5, NULL, 'Dessert du jour ', 1),
(87, 2, NULL, 'Saumon mariné, tartare d’avocats à la citronnelle, copeaux de fenouils ', 1),
(88, 2, NULL, 'Tartare de tomates fraîches sur sablé parmesan vinaigrette balsamique à la savora', 1),
(89, 2, NULL, 'Salade fraîcheur, volaille caramélisée et vinaigrette de noisettes torréfiées', 1),
(90, 2, NULL, 'Entrée du jour  ', 1),
(91, 3, NULL, 'Confit de bœuf aux carottes, sauce gribiche, salade de grenailles aux herbes ', 1),
(92, 3, NULL, 'Emincé de veau poêlé à l’estragon, tatin de tomates confites au thym ', 1),
(93, 3, NULL, 'Suprême de volaille aux olives Kalamata, tian de légumes aux courgettes jaunes ', 1),
(94, 3, NULL, 'Gambas au curry et au lait de coco, légumes parfumés au poivre de Sichuan ', 1),
(95, 3, NULL, 'Filet de dorade grillée, sauce vierge aux échalotes roses, linguines de courgettes et ratatouille ', 1),
(96, 3, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin', 1),
(97, 3, NULL, 'Plat du jour', 1),
(98, 4, NULL, 'Fromages affinés', 1),
(99, 4, NULL, 'Fromage frais de campagne aux herbes fraîches', 1),
(100, 5, NULL, 'Marbré aux 2 chocolats et myrtille sauvage, crème anglaise', 1),
(101, 5, NULL, 'Pannacotta aux fruits rouges et zestes d’agrumes ', 1),
(102, 5, NULL, 'Fondant de poires aux éclats d’amandes grillées ', 1),
(103, 5, NULL, 'Salade de fruits frais, sirop au thé jasmin ', 1),
(104, 5, NULL, 'Dessert du jour ', 1),
(105, 2, NULL, 'Carpaccio de St jacques à la citronnelle, bouillon terre et mer au ponzu  ', 1),
(106, 2, NULL, 'Pressé de volaille au citron confit basse température, chapelure d’herbelette', 1),
(107, 2, NULL, 'Gourmandises de fèves et petits pois primeurs, œuf poché et croquant ', 1),
(108, 2, NULL, 'Entrée du jour', 1),
(109, 3, NULL, 'Filet de pintade à la tapenade de tomates, bayaldi d’aubergines ', 1),
(110, 3, NULL, 'Piéce de bœuf poêlé aux girolles, dentelle de parmesan, compotée de légumes', 1),
(111, 3, NULL, 'Pavé de noix de veau au miel et ciboule, écrasé de pommes de terre douces', 1),
(112, 3, NULL, 'Filet de bar cuit et cru au cœur d’agrumes et huile parfumée, légumes grillés', 1),
(113, 3, NULL, 'Dos de rascasse poêlé, haricots blancs au pistou', 1),
(114, 3, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin ', 1),
(115, 3, NULL, 'Plat du jour', 1),
(116, 4, NULL, 'Fromages affinés', 1),
(117, 4, NULL, 'Fromage frais de campagne aux herbes fraîches', 1),
(118, 5, NULL, 'Fondant de chocolat au thé vert, crème anglaise à la vanille  ', 1),
(119, 5, NULL, 'Croustillant noisettes, coulis de fruits frais et petite meringue ', 1),
(120, 5, NULL, 'Salade d’agrumes à la cannelle et pralines roses ', 1),
(121, 5, NULL, 'Dessert du jour ', 1),
(122, 2, NULL, 'Tartare de thon au gingembre, mangue, feuilles de shiso et tuile de lotus', 1),
(123, 2, NULL, 'Marbré de foie gras aux figues et piments d’Espelette laqué au jus de grenade ', 1),
(124, 2, NULL, 'Œuf poché aux pointes d’asperges vertes, roquette et pecorino', 1),
(125, 2, NULL, 'Entrée du jour', 1),
(126, 3, NULL, 'Selle d’agneau à la sauge, polenta poêlé et légumes sifflets rôtis', 1),
(127, 3, NULL, 'Pintade fermière rôtie, salade de pois gourmands et haricots verts et pignons torréfiés', 1),
(128, 3, NULL, 'Mignon de veau poêlé à l’estragon, rose de pomme de terre rôtie', 1),
(129, 3, NULL, 'Saint jacques et gambas poêlées au curcuma, poêlé de pleurotes et girolles', 1),
(130, 3, NULL, 'Dos de dorade, vinaigrette gourmande aux fèves de soja, purée au beurre yuzu', 1),
(131, 3, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin ', 1),
(132, 3, NULL, 'Plat du jour ', 1),
(133, 4, NULL, 'Fromages affinés', 1),
(134, 4, NULL, 'Fromage frais de campagne aux herbes fraîches', 1),
(135, 5, NULL, 'Clafoutis de fruits frais caramélisé façon crème brulée', 1),
(136, 5, NULL, 'Cœur fondant chocolat et caramel au beurre salé ', 1),
(137, 5, NULL, 'Salade de fruits frais et mangue rôtie', 1),
(138, 5, NULL, 'Dessert du jour ', 1),
(139, 2, NULL, 'Clafoutis de légumes de saison, coulis fraîcheur ', 1),
(140, 2, NULL, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe ', 1),
(141, 2, NULL, 'Salade de pâte vitaminée à la coriandre, vinaigrette d’agrumes ', 1),
(142, 3, NULL, 'Rôti de bœuf aux oignons doux ', 1),
(143, 3, NULL, 'Filet de mignon de porc poêlé à l’arrabbiata, chips de coppa', 1),
(144, 4, NULL, 'Plateaux de fromages affinés ', 1),
(145, 4, NULL, 'Mesclun croquant  ', 1),
(146, 5, NULL, 'Tartes aux pommes aux pralines roses, coulis de fruits ', 1),
(147, 5, NULL, 'Mousse au chocolat, copeaux de chocolat blanc et spéculos ', 1),
(148, 2, NULL, 'Saumon mariné, tartare d’avocats à la citronnelle, copeaux de fenouils', 1),
(149, 2, NULL, 'Salade de ravioles au pesto, légumes primeurs croquants', 1),
(150, 2, NULL, 'Nouilles soba thaï à la citronnelle et au gingembre ', 1),
(151, 3, NULL, 'Gourmandise de volaille au citron confit, crème fouettée à la coriandre', 1),
(152, 3, NULL, 'Blanc de cabillaud iodé, vinaigrette gourmande aux fèves de soja', 1),
(153, 4, NULL, 'Plateaux de Fromages affinés ', 1),
(154, 4, NULL, 'Mesclun croquant ', 1),
(155, 5, NULL, 'Tarte aux fruits de saison, amandes émondées ', 1),
(156, 5, NULL, 'Salade d’ananas aux copeaux de noix de coco ', 1),
(157, 2, NULL, 'Tartare de courgettes et tomates, féta aux herbes', 1),
(158, 2, NULL, 'Petite ratatouille de légumes confit au romarin ', 1),
(159, 2, NULL, 'Farfalles au pécorino et piquillos, basilic ciselé', 1),
(160, 3, NULL, 'Volaille rôtie aux légumes, crumble de parmesan ', 1),
(161, 3, NULL, 'Dos de dorade grillé aux herbes, vinaigrette gourmande et copeaux de légumes', 1),
(162, 4, NULL, 'Plateaux de fromages affinés ', 1),
(163, 4, NULL, 'Mesclun croquant ', 1),
(164, 5, NULL, 'Tarte aux fruits de saison ', 1),
(165, 5, NULL, 'Dacquoise au lemoncello et citron confit, coulis de fruits frais', 1),
(166, 2, NULL, 'Marbré de foie gras aux figues, laqué au jus de grenade ', 1),
(167, 2, NULL, 'Salade de roquette, œufs pochés et saumon fumé, pointes d’asperges vertes ', 1),
(168, 2, NULL, 'Pipe rigate et haricots verts et champignons du moment', 1),
(169, 3, NULL, 'Petit rôti de pintade aux légumes croquants, sauce tartare', 1),
(170, 3, NULL, 'Dos de rascasse poêlé sur peau, vinaigrette d’agrumes ', 1),
(171, 4, NULL, 'Plateaux de Fromages affinés ', 1),
(172, 4, NULL, 'Mesclun aux pignons de pin grillés ', 1),
(173, 5, NULL, 'Salade de fruits frais à la mangue rôtie, pistaches émondées', 1),
(174, 5, NULL, 'Mi cuit au chocolat, copeaux de pain d’épices, crème anglaise vanillée', 1),
(175, 6, NULL, 'Café Arabica', 1),
(176, 6, NULL, 'Thés assortis : English breakfast, Earl Grey, Jasmine green, Ginger lemongrass…', 1),
(177, 6, NULL, 'Evian et Perrier', 1),
(178, 6, NULL, 'Jus de fruit : Orange et pamplemousse rose', 1),
(179, 7, NULL, 'Croissants, pains au chocolat, pains aux raisins…', 1),
(180, 6, NULL, 'Café Arabica', 1),
(181, 6, NULL, 'Thés assortis : English breakfast, Earl Grey, Jasmine green, Ginger lemongrass…', 1),
(182, 6, NULL, 'Evian et Perrier', 1),
(183, 6, NULL, 'Jus de fruits : Orange et pamplemousse rose', 1),
(184, 7, NULL, 'Croissants, pains au chocolat, pains aux raisins…', 1),
(185, 7, NULL, '1 brochette de fruits frais de saison', 1),
(186, 2, NULL, 'Salade de pâtes vitaminée aux agrumes et à la coriandre', 1),
(187, 2, NULL, 'Coleslaw de carottes et choux blanc aux raisins de Corinthe', 1),
(188, 2, NULL, 'Tartare de courgettes et tomates, féta aux herbes', 1),
(189, 2, NULL, 'Salade végan aux légumes de saison, quinoa, grenade et graines de lin ', 1),
(190, 2, NULL, 'Tartare de tomates, réduction de balsamique à la savora, crumble de parmesan', 1),
(191, 2, NULL, 'Salade fraîcheur, volaille caramélisée et vinaigrette de noisettes torréfiées', 1),
(192, 1, NULL, 'Club sandwiches :  Emincé de volaille et crudités / Guacamole légèrement pimenté', 1),
(193, 1, NULL, 'Pain nordique :  Rillette de saumon et crème d’aneth / Fromage frais ciboulette', 1),
(194, 1, NULL, 'Foccacia :  Rôti de veau braisé sauce tartare / Tapenade de légumes et pignons', 1),
(195, 1, NULL, 'Pain viennois :  Carpaccio de bœuf et parmesan / Chèvre frais et concombre', 1),
(196, 5, NULL, 'Moelleux aux amandes et cassis, crème anglaise ', 1),
(197, 5, NULL, 'Fromage blanc de campagne aux pralines roses et coulis de fruits', 1),
(198, 5, NULL, 'Tiramisu au cacao amer', 1),
(199, 5, NULL, 'Compote de pommes et rhubarbe, copeaux de chocolat  ', 1),
(200, 5, NULL, 'Salade d’ananas aux éclats de noix de pécan', 1),
(201, 5, NULL, 'Panacotta au coulis de fruits rouges et zestes d’agrumes', 1),
(202, 1, NULL, 'Salade de fruits frais, sirop d’hibiscus et sureau', 1),
(203, 1, NULL, 'Poêlée d’abricots, crème mascarpone, thym et citron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmealcategory`
--

CREATE TABLE `cocktailcocktailmealcategory` (
  `id` tinyint(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `cocktailcocktailmenu` (
  `id` tinyint(4) NOT NULL,
  `id_Category` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double(4,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `creationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailmenu`
--

INSERT INTO `cocktailcocktailmenu` (`id`, `id_Category`, `name`, `price`, `image_url`, `active`, `creationDate`) VALUES
(1, 1, 'Menu du Marché', 23.00, '/upload_test/new_tradition.png', 1, '2019-10-19'),
(2, 2, 'Buffet Tradition', 21.00, '/upload_test/Sans titre.png', 1, '2019-10-17'),
(3, 2, 'Buffet du Monde', 26.00, '/upload_test/Sans titre.png', 1, '2019-10-17'),
(4, 2, 'Buffet Italien', 23.00, '/upload_test/Sans titre.png', 1, '2019-10-17'),
(5, 2, 'Buffet Découverte', 32.00, '/upload_test/Sans titre.png', 1, '2019-10-17'),
(6, 1, 'Menu Tradition', 19.90, '/upload_test/new_tradition.png', 1, '2019-10-17'),
(7, 1, 'Menu Gourmet', 22.90, '/upload_test/new_gourmet.png', 1, '2019-10-17'),
(8, 1, 'Menu Plaisir', 24.90, '/upload_test/new_plaisir.png', 1, '2019-10-17'),
(9, 1, 'Menu Délice', 27.90, '/upload_test/new_delice.png', 1, '2019-10-17'),
(10, 1, 'Menu Prestige', 32.90, '/upload_test/new_vendome.png', 1, '2019-10-17'),
(23, 3, 'Petit-Déjeuner Classique', 8.00, '/upload_test/Sans titre.png', 1, '2019-10-18'),
(24, 3, 'Petit-Déjeuner Prestige', 10.00, '/upload_test/Sans titre.png', 1, '2019-10-18'),
(25, 4, 'Lunch Box Classique', 15.00, '/upload_test/DSC02476.JPG', 1, '2020-01-14'),
(26, 5, 'Plateau Sandwiches Classique', 0.00, '/upload_test/new_dess.png', 1, '2020-09-05'),
(27, 6, 'Plateau cocktail prestige', 12.00, '/upload_test/new_sal1.png', 1, '2020-09-04'),
(28, 6, 'Plateau cocktail fraicheur', 18.00, '/upload_test/new_sal2.png', 1, '2020-09-04'),
(29, 6, 'Plateau cocktail terroir', 28.00, '/upload_test/new_sal3.png', 1, '2020-09-04'),
(31, 6, 'Plateau cocktail évasion', 15.00, '/upload_test/new_suc1.png', 1, '2020-09-04'),
(32, 7, 'Bordeaux', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(36, 7, 'Autre', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(37, 7, 'Champagne', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(38, 7, 'Non Alcoolisée', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(39, 7, 'Boisson Chaude', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(40, 7, 'Alcool', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(41, 7, 'Diver', 0.00, '/upload_test/Sans titre.png', 1, '2019-10-20'),
(43, 6, 'Plateau cocktail gourmand', 12.00, '/upload_test/new_suc2.png', 1, '2020-09-04'),
(44, 6, 'Plateau cocktail tradition', 12.00, '/upload_test/new_suc3.png', 1, '2020-09-04'),
(45, 6, 'Plateau macarons', 12.00, '/upload_test/new_macaron.png', 1, '2020-09-04'),
(46, 6, 'Plateau brochettes de fruit frais', 12.00, '/upload_test/new_broch.png', 1, '2020-09-04'),
(47, 12, 'Planche charcuterie', 12.00, '/upload_test/charcuterie.JPG', 1, '2020-08-21'),
(48, 12, 'Planche fromages', 12.00, '/upload_test/fromage.JPG', 1, '2020-08-21'),
(49, 5, 'Les Salad&#039;Bar', 35.00, '/upload_test/new_salad.png', 1, '2020-09-04'),
(50, 5, 'Les Pâtiss&#039;Bar', NULL, '/upload_test/new_dess.png', 1, '2020-09-04');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailmenumeal`
--

CREATE TABLE `cocktailcocktailmenumeal` (
  `id` int(5) NOT NULL,
  `id_Menu` tinyint(5) NOT NULL,
  `id_Meal` int(5) NOT NULL,
  `creationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(201, 25, 201, '2020-01-14'),
(202, 49, 202, '2020-08-21'),
(203, 49, 203, '2020-08-21');

-- --------------------------------------------------------

--
-- Structure de la table `cocktailcocktailsubcategories`
--

CREATE TABLE `cocktailcocktailsubcategories` (
  `id` tinyint(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cocktailcocktailsubcategories`
--

INSERT INTO `cocktailcocktailsubcategories` (`id`, `name`) VALUES
(1, 'Sandwiches'),
(2, 'Entré'),
(3, 'Plat'),
(4, 'Fromage'),
(5, 'Dessert'),
(6, 'Boisson'),
(7, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` tinyint(5) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `metaDescription` text NOT NULL,
  `metaKeywords` text NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `metaDescription`, `metaKeywords`, `lang`) VALUES
(1, '', '', '', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `lang`
--

CREATE TABLE `lang` (
  `id` tinyint(5) NOT NULL,
  `code` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lang`
--

INSERT INTO `lang` (`id`, `code`) VALUES
(1, 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `lesterrassescategories`
--

CREATE TABLE `lesterrassescategories` (
  `id` tinyint(5) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `lesterrassesmeal` (
  `id` tinyint(5) NOT NULL,
  `id_Category` tinyint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double(4,2) NOT NULL,
  `creationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `request` (
  `id` int(5) NOT NULL,
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
  `zone` tinyint(1) NOT NULL DEFAULT '3',
  `eventZipcode` varchar(5) DEFAULT NULL,
  `eventDate` varchar(255) DEFAULT NULL,
  `eventTime` varchar(255) DEFAULT NULL,
  `people` int(5) DEFAULT NULL,
  `isCommand` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `request`
--

INSERT INTO `request` (`id`, `id_User`, `isCompany`, `companyName`, `companySiret`, `firstname`, `lastname`, `phoneNumber`, `email`, `fromCompany`, `message`, `zone`, `eventZipcode`, `eventDate`, `eventTime`, `people`, `isCommand`, `creationDate`) VALUES
(1, NULL, b'1', 'Betclic', 'FR76129803344', 'Nicolas', 'Beraud', '0689571118', 'ergerg@azd.com', 'Mets-Tendances', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, '', '2019-12-12', '15:00:00', 35, 0, '2019-11-08'),
(7, NULL, b'1', 'KEAKR', '134RFR30', NULL, NULL, '0610370251', 'thibault.dulon@gmail.com', 'Cocktail-Cocktail', 'reg e terhtyn uj yuj rdfv', 3, '', NULL, NULL, NULL, 0, '2020-03-21 16:52:18'),
(8, NULL, b'1', 'testca', 'zef9898', NULL, NULL, '+33689471118', 'thibault.dulon@gmail.com', 'Cocktail-Cocktail', 'uhkbjnk,;', 3, '', NULL, NULL, NULL, 0, '2020-03-22 17:03:14'),
(9, NULL, b'1', 'keakr', 'zef9898', NULL, NULL, '+33689471118', 'thibault.dulon@gmail.com', 'Cocktail-Cocktail', 'dsfgh', 3, '', NULL, NULL, NULL, 0, '2020-03-22 17:40:33'),
(10, 5, b'1', NULL, NULL, NULL, NULL, '', '', 'Cocktail-Cocktail', '', 3, '', NULL, NULL, NULL, 0, '2020-03-22 17:54:16'),
(15, 5, b'1', NULL, NULL, NULL, NULL, '09876543', 'ererg@ergerg.erg', 'Cocktail-Cocktail', '', 2, '75012', NULL, NULL, NULL, 1, '2020-05-09 13:36:02');

-- --------------------------------------------------------

--
-- Structure de la table `requestcart`
--

CREATE TABLE `requestcart` (
  `id` int(5) NOT NULL,
  `id_Request` int(5) NOT NULL,
  `id_Menu` int(5) NOT NULL,
  `id_Meal` int(5) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `rewrittingurl` (
  `id` tinyint(5) NOT NULL,
  `idRouteUrl` tinyint(5) NOT NULL,
  `urlMatched` varchar(255) NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'fr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `routeurl` (
  `id` tinyint(5) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `controller` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `order` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `user` (
  `id` tinyint(5) NOT NULL,
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
  `creationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `isCompany`, `companyName`, `companySiret`, `firstname`, `lastname`, `phoneNumber`, `email`, `address`, `city`, `isActive`, `fromCompany`, `password`, `creationDate`) VALUES
(1, b'1', 'Betclic', 'FR01240982', 'Nicolas', 'Berault', '06896745', 'thibault.dulon@gmail.com', '1 rue de truc', 'Paris', b'0', 'Mets-Tendances', 'uep8HK5CBS', '2019-09-27'),
(3, b'0', '', '', 'thibault', 'dulon', '0689471118', 'test@test.com', '38 rue du bouvier', 'Paris', b'1', 'Mets-Tendances', NULL, '2019-10-01'),
(5, b'0', '', '', 'cedric', 'regnier', '09876543', 'ererg@ergerg.erg', '46 avenue mitterand', 'Paris', b'1', 'Cocktail-Cocktail', 'azertyuiop', '2019-10-01');

-- --------------------------------------------------------

--
-- Structure de la table `zipcodezone`
--

CREATE TABLE `zipcodezone` (
  `id` int(5) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `zone` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zipcodezone`
--

INSERT INTO `zipcodezone` (`id`, `zipcode`, `zone`) VALUES
(1, '75001', 1),
(2, '75002', 1),
(3, '75006', 1),
(4, '75007', 1),
(5, '75008', 1),
(6, '75009', 1),
(7, '75015', 1),
(8, '75016', 1),
(9, '75017', 1),
(10, '78500', 1),
(11, '92004', 1),
(12, '92270', 1),
(13, '92100', 1),
(14, '92110', 1),
(15, '92700', 1),
(16, '92400', 1),
(17, '92380', 1),
(18, '92230', 1),
(19, '92130', 1),
(20, '92250', 1),
(21, '92300', 1),
(22, '92240', 1),
(23, '92000', 1),
(24, '92200', 1),
(25, '92800', 1),
(26, '92500', 1),
(27, '92310', 1),
(28, '92210', 1),
(29, '92150', 1),
(30, '92170', 1),
(31, '95870', 1),
(32, '75003', 2),
(33, '75004', 2),
(34, '75005', 2),
(35, '75010', 2),
(36, '75011', 2),
(37, '75012', 2),
(38, '75013', 2),
(39, '75014', 2),
(40, '75018', 2),
(41, '75019', 2),
(42, '75020', 2),
(43, '92160', 2),
(44, '92220', 2),
(45, '92340', 2),
(46, '92500', 2),
(47, '92290', 2),
(48, '92320', 2),
(49, '92370', 2),
(50, '92190', 2),
(51, '92260', 2),
(52, '92290', 2),
(53, '92140', 2),
(54, '92350', 2),
(55, '92430', 2),
(56, '92360', 2),
(57, '92190', 2),
(58, '92350', 2),
(59, '92330', 2),
(60, '92420', 2),
(61, '92410', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cocktailcocktailcategories`
--
ALTER TABLE `cocktailcocktailcategories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cocktailcocktailmeal`
--
ALTER TABLE `cocktailcocktailmeal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Meal_Subcategory` (`id_Subcategory`),
  ADD KEY `FK_Meal_MealCategory` (`id_MealCategory`);

--
-- Index pour la table `cocktailcocktailmealcategory`
--
ALTER TABLE `cocktailcocktailmealcategory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cocktailcocktailmenu`
--
ALTER TABLE `cocktailcocktailmenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Menu_Category` (`id_Category`);

--
-- Index pour la table `cocktailcocktailmenumeal`
--
ALTER TABLE `cocktailcocktailmenumeal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Menu_Meal_Menu` (`id_Menu`),
  ADD KEY `FK_Menu_Meal_Meal` (`id_Meal`);

--
-- Index pour la table `cocktailcocktailsubcategories`
--
ALTER TABLE `cocktailcocktailsubcategories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lesterrassescategories`
--
ALTER TABLE `lesterrassescategories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lesterrassesmeal`
--
ALTER TABLE `lesterrassesmeal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_LesTerrassesMeal_Category` (`id_Category`);

--
-- Index pour la table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `requestcart`
--
ALTER TABLE `requestcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_requestcart_request` (`id_Request`);

--
-- Index pour la table `rewrittingurl`
--
ALTER TABLE `rewrittingurl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_RewrittingUrl_RouteUrl` (`idRouteUrl`);

--
-- Index pour la table `routeurl`
--
ALTER TABLE `routeurl`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zipcodezone`
--
ALTER TABLE `zipcodezone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cocktailcocktailcategories`
--
ALTER TABLE `cocktailcocktailcategories`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `cocktailcocktailmeal`
--
ALTER TABLE `cocktailcocktailmeal`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT pour la table `cocktailcocktailmealcategory`
--
ALTER TABLE `cocktailcocktailmealcategory`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `cocktailcocktailmenu`
--
ALTER TABLE `cocktailcocktailmenu`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `cocktailcocktailmenumeal`
--
ALTER TABLE `cocktailcocktailmenumeal`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT pour la table `cocktailcocktailsubcategories`
--
ALTER TABLE `cocktailcocktailsubcategories`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lesterrassescategories`
--
ALTER TABLE `lesterrassescategories`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lesterrassesmeal`
--
ALTER TABLE `lesterrassesmeal`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `requestcart`
--
ALTER TABLE `requestcart`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `rewrittingurl`
--
ALTER TABLE `rewrittingurl`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `routeurl`
--
ALTER TABLE `routeurl`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `zipcodezone`
--
ALTER TABLE `zipcodezone`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
