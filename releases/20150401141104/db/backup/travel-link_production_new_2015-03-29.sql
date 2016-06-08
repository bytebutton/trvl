# ************************************************************
# Sequel Pro SQL dump
# Версия 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Адрес: 127.0.0.1 (MySQL 5.6.22-1+deb.sury.org~precise+1)
# Схема: travel-link_production_new
# Время создания: 2015-03-29 18:18:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `description`, `created_at`, `updated_at`)
VALUES
	(13,'Test Co','Used for Demo to clients','2014-07-04 13:37:28','2014-07-04 13:37:28'),
	(14,'FlightSafety International','','2014-07-04 13:37:28','2014-07-04 13:37:28'),
	(15,'Anadarko','','2014-07-04 13:37:28','2014-07-04 13:37:28'),
	(16,'Lexicon Relocation','','2014-07-04 13:37:28','2014-07-04 13:37:28'),
	(17,'Avon','','2014-07-04 13:37:28','2014-07-04 13:37:28'),
	(18,'ABS','','2014-07-04 13:37:28','2014-07-04 13:37:28'),
	(19,'Pentair','','2014-08-26 13:19:17','2014-08-26 13:19:17'),
	(20,'Harris','','2014-10-01 18:45:02','2014-10-01 18:45:02'),
	(21,'Passport Health Services','','2014-11-14 16:24:28','2014-11-14 16:24:28');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы companies_managers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies_managers`;

CREATE TABLE `companies_managers` (
  `company_id` int(11) unsigned NOT NULL,
  `manager_id` int(11) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`manager_id`),
  CONSTRAINT `companies_managers_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `companies_managers_manager_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `companies_managers` WRITE;
/*!40000 ALTER TABLE `companies_managers` DISABLE KEYS */;

INSERT INTO `companies_managers` (`company_id`, `manager_id`, `id`, `created_at`, `updated_at`)
VALUES
	(13,60,1,NULL,NULL),
	(14,166,2,NULL,NULL),
	(13,58,3,NULL,NULL),
	(13,11,4,NULL,NULL),
	(15,176,5,NULL,NULL),
	(13,7,6,NULL,NULL),
	(13,210,7,NULL,NULL),
	(15,11,8,NULL,NULL),
	(18,220,10,NULL,NULL),
	(13,9,11,NULL,NULL),
	(15,226,12,NULL,NULL),
	(13,169,13,NULL,NULL),
	(13,227,14,NULL,NULL),
	(13,239,15,NULL,NULL),
	(19,242,17,NULL,NULL),
	(20,60,18,NULL,NULL),
	(20,11,19,NULL,NULL),
	(13,255,20,NULL,NULL);

/*!40000 ALTER TABLE `companies_managers` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы companies_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies_users`;

CREATE TABLE `companies_users` (
  `user_id` int(11) unsigned NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `companies_users_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `companies_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `companies_users` WRITE;
/*!40000 ALTER TABLE `companies_users` DISABLE KEYS */;

INSERT INTO `companies_users` (`user_id`, `company_id`, `id`, `created_at`, `updated_at`)
VALUES
	(11,13,1,NULL,NULL),
	(60,13,2,NULL,NULL),
	(79,13,3,NULL,NULL),
	(166,14,4,NULL,NULL),
	(9,13,5,NULL,NULL),
	(48,13,6,NULL,NULL),
	(58,13,7,NULL,NULL),
	(176,15,8,NULL,NULL),
	(206,13,9,NULL,NULL),
	(207,13,10,NULL,NULL),
	(208,13,11,NULL,NULL),
	(209,13,12,NULL,NULL),
	(210,13,13,NULL,NULL),
	(212,13,14,NULL,NULL),
	(220,18,15,NULL,NULL),
	(226,15,16,NULL,NULL),
	(241,19,17,NULL,NULL),
	(242,19,18,NULL,NULL),
	(253,20,19,NULL,NULL),
	(252,20,20,NULL,NULL),
	(251,20,21,NULL,NULL),
	(250,20,22,NULL,NULL),
	(249,20,23,NULL,NULL),
	(247,20,25,NULL,NULL),
	(246,20,26,NULL,NULL),
	(245,20,27,NULL,NULL),
	(244,20,28,NULL,NULL),
	(255,13,29,NULL,NULL),
	(256,13,30,NULL,NULL),
	(257,13,31,NULL,NULL),
	(258,13,32,NULL,NULL),
	(259,21,33,NULL,NULL),
	(260,13,35,NULL,NULL);

/*!40000 ALTER TABLE `companies_users` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adjective` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_subunit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cca3` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cca2` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `name_en`, `code`, `adjective`, `capital`, `currency`, `currency_code`, `currency_subunit`, `full_name`, `nationality`, `cca3`, `cca2`)
VALUES
	(2,'Albania','al','Albanian','Tirana','lek','all','[qindar (pl. qindarka)]','Republic of Albania','Albanian','ALB','AL'),
	(3,'Afghanistan','af','Afghan','Kabul','afghani','afn','pul','Islamic Republic of Afghanistan','Afghan','AFG','AF'),
	(4,'Algeria','dz','Algerian','Algiers','Algerian dinar','dzd','centime','People’s Democratic Republic of Algeria','Algerian','DZA','DZ'),
	(5,'American Samoa (AS1)','as','American Samoan','Pago Pago','US dollar','usd','cent','Territory of American\n        Samoa','American Samoan','ASM','AS'),
	(6,'Andorra','ad','Andorran','Andorra la Vella','euro','eur','cent','Principality of Andorra','Andorran','AND','AD'),
	(7,'Angola','ao','Angolan','Luanda','kwanza','aoa','cêntimo','Republic of Angola','Angolan','AGO','AO'),
	(8,'Armenia','am','Armenian','Yerevan','dram (inv.)','amd','luma','Republic of Armenia','Armenian','ARM','AM'),
	(10,'Australia','au','Australian','Canberra','Australian dollar','aud','cent','Commonwealth of Australia','Australian','AUS','AU'),
	(11,'Argentina','ar','Argentine; Argentinian','Buenos Aires','Argentine peso','ars','centavo','Argentine Republic','Argentinian','ARG','AR'),
	(12,'Azerbaijan','az','Azerbaijani','Baku','Azerbaijani manat','azn','kepik (inv.)','Republic of Azerbaijan','Azerbaijani','AZE','AZ'),
	(13,'Aruba (AW1)','aw','Aruban','Oranjestad','Aruban guilder','awg','cent','Aruba','Aruban','ABW','AW'),
	(14,'Antigua and Barbuda','ag','of Antigua and Barbuda','St John’s','East Caribbean dollar','xcd','cent','Antigua and Barbuda','of Antigua and Barbuda','ATG','AG'),
	(15,'Austria','at','Austrian','Vienna','euro','eur','cent','Republic of Austria','Austrian','AUT','AT'),
	(16,'Anguilla (AI1)','ai','Anguillan','The Valley','East Caribbean dollar','xcd','cent','Anguilla','Anguillan','AIA','AI'),
	(17,'Bahamas','bs','Bahamian','Nassau','Bahamian dollar','bsd','cent','Commonwealth of the Bahamas','Bahamian','BHS','BS'),
	(18,'Bahrain','bh','Bahraini','Manama','Bahraini dinar','bhd','fils (inv.)','Kingdom of Bahrain','Bahraini','BHR','BH'),
	(19,'Bangladesh','bd','Bangladeshi','Dhaka','taka (inv.)','bdt','poisha (inv.)','People’s Republic of Bangladesh','Bangladeshi','BGD','BD'),
	(20,'Barbados','bb','Barbadian','Bridgetown','Barbados dollar','bbd','cent','Barbados','Barbadian','BRB','BB'),
	(21,'Belarus','by','Belarusian','Minsk','Belarusian rouble','byr','kopek','Republic of Belarus','Belarusian','BLR','BY'),
	(22,'Belgium','be','Belgian','Brussels','euro','eur','cent','Kingdom of Belgium','Belgian','BEL','BE'),
	(23,'Belize','bz','Belizean','Belmopan','Belize dollar','bzd','cent','Belize','Belizean','BLZ','BZ'),
	(24,'Benin','bj','Beninese','Porto Novo (BJ1)','CFA franc (BCEAO)','xof','centime','Republic of Benin','Beninese','BEN','BJ'),
	(25,'Bermuda (BM1)','bm','Bermudian','Hamilton','Bermuda dollar','bmd','cent','Bermuda','Bermudian','BMU','BM'),
	(26,'Bhutan','bt','Bhutanese','Thimphu','ngultrum (inv.)','btn','chhetrum (inv.)','Kingdom of Bhutan','Bhutanese','BTN','BT'),
	(28,'Bolivia','bo','Bolivian','Sucre (BO1)','boliviano','bob','centavo','Plurinational State of Bolivia','Bolivian','BOL','BO'),
	(29,'Bosnia and Herzegovina','ba','of Bosnia and Herzegovina','Sarajevo','convertible mark','bam','fening','Bosnia and Herzegovina','of Bosnia and Herzegovina','BIH','BA'),
	(30,'Botswana','bw','Botswanan','Gaborone','pula (inv.)','bwp','thebe (inv.)','Republic of Botswana','Botswanan','BWA','BW'),
	(32,'Brazil','br','Brazilian','Brasilia','real (pl. reais)','brl','centavo','Federative Republic of Brazil','Brazilian','BRA','BR'),
	(34,'British Virgin Islands (VG1)','vg','of the British Virgin Islands','Road Town','US dollar','usd','cent','British Virgin Islands','British Virgin Islander;\n        BV Islander','VGB','VG'),
	(35,'Brunei','bn','Bruneian','Bandar Seri Begawan','Brunei dollar','bnd','sen (inv.)','Brunei Darussalam','Bruneian','BRN','BN'),
	(36,'Bulgaria','bg','Bulgarian','Sofia','lev (pl. leva)','bgn','stotinka\n        (pl. stotinki','Republic of Bulgaria','Bulgarian','BGR','BG'),
	(37,'Burkina Faso','bf','Burkinabe','Ouagadougou','CFA franc (BCEAO)','xof','centime','Burkina Faso','Burkinabe','BFA','BF'),
	(38,'Burma/Myanmar','mm','of Burma/Myanmar\n    ','Naypyidaw','kyat','mmk','pya','Burma/Myanmar (MM1)','of Burma/Myanmar','MMR','MM'),
	(39,'Burundi','bi','Burundian','Bujumbura','Burundi franc','bif','centime','Republic of Burundi','Burundian','BDI','BI'),
	(40,'Cambodia','kh','Cambodian','Phnom Penh','riel','khr','sen (inv.)','Kingdom of Cambodia','Cambodian','KHM','KH'),
	(41,'Cameroon','cm','Cameroonian','Yaoundé','CFA franc (BEAC)','xaf','centime','Republic of Cameroon','Cameroonian','CMR','CM'),
	(42,'Canada','ca','Canadian','Ottawa','Canadian dollar','cad','cent','Canada','Canadian','CAN','CA'),
	(43,'Cape Verde','cv','Cape Verdean','Praia','Cape Verde escudo','cve','centavo','Republic of Cape Verde','Cape Verdean','CPV','CV'),
	(44,'Cayman Islands (KY1)','ky','Caymanian','George Town','Cayman Islands dollar','kyd','cent','Cayman Islands','Caymanian','CYM','KY'),
	(45,'Central African Republic','cf','Central African','Bangui','CFA franc (BEAC)','xaf','centime','Central African Republic','Central African','CAF','CF'),
	(46,'Chad','td','Chadian','N’Djamena','CFA franc (BEAC)','xaf','centime','Republic of Chad','Chadian','TCD','TD'),
	(47,'Chile','cl','Chilean','Santiago','Chilean peso','clp','centavo','Republic of Chile','Chilean','CHL','CL'),
	(48,'China','cn','Chinese','Beijing','renminbi-yuan (inv.)','cny','jiao (10)\n        fen (100)','People’s Republic of China','Chinese','CHN','CN'),
	(49,'Christmas Island (CX1)','cx','of Christmas Island','Flying Fish Cove','Australian dollar','aud','cent','Christmas Island Territory','Christmas Islander','CXR','CX'),
	(51,'Cocos (Keeling) Islands (CC1)','cc','of the Cocos (Keeling) Islands','West Island','Australian dollar','aud','cent','Territory of Cocos (Keeling) Islands','Cocos Islander','CCK','CC'),
	(52,'Colombia','co','Colombian','Bogotá','Colombian peso','cop','centavo','Republic of Colombia','Colombian','COL','CO'),
	(53,'Comoros','km','Comorian','Moroni','Comorian franc','kmf',NULL,'Union of the Comoros','Comorian','COM','KM'),
	(54,'Congo (CG*)','cg','Congolese','Brazzaville','CFA franc (BEAC)','xaf','centime','Republic of the Congo','Congolese','COG','CG'),
	(55,'Cook Islands (CK1)','ck','of the Cook Islands','Avarua','New Zealand dollar','nzd','cent','Cook Islands','Cook Islander','COK','CK'),
	(56,'Costa Rica','cr','Costa Rican','San José','Costa Rican colón (pl. colones)','crc','céntimo','Republic of Costa Rica','Costa Rican','CRI','CR'),
	(57,'Côte d’Ivoire','ci','Ivorian','Yamoussoukro (CI1)','CFA franc (BCEAO)','xof','centime','Republic of Côte d’Ivoire','Ivorian','CIV','CI'),
	(58,'Croatia','hr','Croatian','Zagreb','kuna (inv.)','hrk','lipa (inv.)','Republic of Croatia','Croat','HRV','HR'),
	(59,'Cuba','cu','Cuban','Havana','Cuban peso','cup','centavo','Republic of Cuba','Cuban','CUB','CU'),
	(61,'Curaçao (CW1)','cw','of Curaçao','Willemstad','Netherlands Antillean guilder (CW1)','ang','cent','Curaçao','Curaçaoan','CUW','CW'),
	(62,'Cyprus','cy','Cypriot','Nicosia','euro','eur','cent','Republic of Cyprus','Cypriot','CYP','CY'),
	(63,'Czech Republic','cz','Czech','Prague','Czech koruna (pl. koruny)','czk','halér\n        (pl. halére)','Czech Republic','Czech','CZE','CZ'),
	(64,'Democratic Republic of the Congo (CD*)','cd','of the Democratic Republic of the Congo (CD1)','Kinshasa','Congolese franc','cdf','centime','Democratic Republic of the Congo','of the Democratic Republic of the Congo (CD1)','COD','CD'),
	(65,'Denmark','dk','Danish','Copenhagen','Danish krone\n        (pl. kroner)','dkk','øre (inv.)','Kingdom of Denmark','Dane','DNK','DK'),
	(66,'Djibouti','dj','of Djibouti','Djibouti','Djibouti franc','djf',NULL,'Republic of Djibouti','Djiboutian','DJI','DJ'),
	(67,'Dominica','dm','of Dominica','Roseau','East Caribbean dollar','xcd','cent','Commonwealth of Dominica','Dominican','DMA','DM'),
	(68,'Dominican Republic','do','Dominican','Santo Domingo','Dominican peso','dop','centavo','Dominican Republic','Dominican','DOM','DO'),
	(70,'Ecuador','ec','Ecuadorian','Quito','US dollar','usd','cent','Republic of Ecuador','Ecuadorian','ECU','EC'),
	(71,'Egypt','eg','Egyptian','Cairo','Egyptian pound','egp','piastre','Arab Republic of Egypt','Egyptian','EGY','EG'),
	(72,'El Salvador','sv','Salvadorian; Salvadoran','San Salvador','Salvadorian colón (pl. colones)','svc','centavo','Republic of El Salvador','Salvadorian; Salvadoran','SLV','SV'),
	(74,'Equatorial Guinea','gq','of Equatorial Guinea','Malabo','CFA franc (BEAC)','xaf','centime','Republic of Equatorial Guinea','Equatorial Guinean','GNQ','GQ'),
	(75,'Eritrea','er','Eritrean','Asmara','nakfa','ern','cent','State of Eritrea','Eritrean','ERI','ER'),
	(76,'Estonia','ee','Estonian','Tallinn','euro','eur','cent','Republic of Estonia','Estonian','EST','EE'),
	(77,'Ethiopia','et','Ethiopian','Addis Ababa','birr (inv.)','etb','cent','Federal Democratic Republic of Ethiopia','Ethiopian','ETH','ET'),
	(78,'Faeroe Islands (FO1)','fo','Faeroese','Tórshavn','Danish krone\n        (pl. kroner)','dkk','øre (inv.)','Faeroe Islands','Faeroese','FRO','FO'),
	(79,'Falkland Islands (FK1)','fk','of the Falkland Islands','Stanley','Falkland Islands pound','fkp','new penny\n        (pl. pence)','Falkland Islands','Falkland Islander','FLK','FK'),
	(80,'Fiji','fj','Fijian','Suva','Fiji dollar','fjd','cent','Republic of  Fiji','Fijian','FJI','FJ'),
	(81,'Finland','fi','Finnish','Helsinki','euro','eur','cent','Republic of Finland','Finn','FIN','FI'),
	(82,'former Yugoslav Republic of Macedonia, the (5a)','mk','of the former Yugoslav Republic of Macedonia','Skopje','denar (pl. denars)','mkd','deni (inv.)','the former Yugoslav Republic of Macedonia (5b)','of the former Yugoslav Republic of Macedonia','MKD','MK'),
	(83,'France','fr','French','Paris','euro','eur','cent','French Republic','Frenchman; Frenchwoman','FRA','FR'),
	(84,'French Guiana (GF1)','gf','Guianese','Cayenne','euro','eur','cent','French Guiana','Guianese','GUF','GF'),
	(85,'French Polynesia (PF1)','pf','Polynesian','Papeete','CFP franc','xpf','centime','French Polynesia','Polynesian','PYF','PF'),
	(87,'Gabon','ga','Gabonese','Libreville','CFA franc (BEAC)','xaf','centime','Gabonese Republic','Gabonese','GAB','GA'),
	(88,'Gambia, The  (GM1)','gm','Gambian','Banjul','dalasi (inv.)','gmd','butut','Republic of The Gambia','Gambian','GMB','GM'),
	(89,'Georgia','ge','Georgian','Tbilisi','lari','gel','tetri (inv.)','Georgia','Georgian','GEO','GE'),
	(90,'Germany','de','German','Berlin','euro','eur','cent','Federal Republic of Germany','German','DEU','DE'),
	(91,'Ghana','gh','Ghanaian','Accra','Ghana cedi','ghs','pesewa','Republic of Ghana','Ghanaian','GHA','GH'),
	(92,'Gibraltar (GI1)','gi','Gibraltarian','Gibraltar','Gibraltar pound','gip','penny\n        (pl. pence)','Gibraltar','Gibraltarian','GIB','GI'),
	(93,'Greece','gr','Greek','Athens','euro','eur','cent','Hellenic Republic','Greek','GRC','GR'),
	(94,'Greenland (GL1)','gl','Greenlandic','Nuuk','Danish krone\n        (pl. kroner)','dkk','øre (inv.)','Greenland','Greenlander','GRL','GL'),
	(95,'Grenada','gd','Grenadian','St George’s','East Caribbean dollar','xcd','cent','Grenada','Grenadian','GRD','GD'),
	(96,'Guadeloupe (GP1)','gp','Guadeloupean','Basse Terre','euro','eur','cent','Guadeloupe','Guadeloupean','GLP','GP'),
	(97,'Guam (GU1)','gu','Guamanian','Agaña (Hagåtña)','US dollar','usd','cent','Territory of Guam','Guamanian','GUM','GU'),
	(98,'Guatemala','gt','Guatemalan','Guatemala City','quetzal (pl. quetzales)','gtq','centavo','Republic of Guatemala','Guatemalan','GTM','GT'),
	(99,'Guernsey (GG1)','gg','Guernsey','St Peter Port','Guernsey pound (GG2)','ggp','penny (pl. pence)','Bailiwick of Guernsey','of Guernsey','GGY','GG'),
	(101,'Guinea','gn','Guinean','Conakry','Guinean franc','gnf',NULL,'Republic of Guinea','Guinean','GIN','GN'),
	(102,'Guinea-Bissau','gw','of Guinea-Bissau','Bissau','CFA franc (BCEAO)','xof','centime','Republic of Guinea-Bissau','Guinea-Bissau national','GNB','GW'),
	(103,'Guyana','gy','Guyanese','Georgetown','Guyana dollar','gyd','cent','Cooperative Republic of Guyana','Guyanese','GUY','GY'),
	(104,'Haiti','ht','Haitian','Port-au-Prince','gourde','htg','centime','Republic of Haiti','Haitian','HTI','HT'),
	(107,'Holy See\n        Vatican City\n        State (VA1)','va','of the Holy See/of the Vatican','Vatican City','euro','eur','cent','the Holy See/ Vatican City State','of the Holy See/of the Vatican','VAT','VA'),
	(108,'Honduras','hn','Honduran','Tegucigalpa','lempira','hnl','centavo','Republic of Honduras','Honduran','HND','HN'),
	(109,'Hong Kong (HK1)','hk','Hong Kong Chinese','(HK3)','Hong Kong dollar','hkd','cent','Hong Kong Special Administrative Region of the People’s Republic of China (HK2)','Hong Kong Chinese','HKG','HK'),
	(110,'Hungary','hu','Hungarian','Budapest','forint (inv.)','huf','[fillér (inv.)]','Hungary','Hungarian','HUN','HU'),
	(111,'Iceland','is','Icelandic','Reykjavik','króna (pl. krónur)','isk',NULL,'Republic of Iceland','Icelander','ISL','IS'),
	(112,'India','in','Indian','New Delhi','Indian rupee','inr','paisa\n        (pl. paise)','Republic of India','Indian','IND','IN'),
	(113,'Indonesia','id','Indonesian','Jakarta','Indonesian rupiah (inv.)','idr','sen (inv.)','Republic of Indonesia','Indonesian','IDN','ID'),
	(114,'Iran','ir','Iranian','Tehran','Iranian rial','irr','[dinar] (IR1)','Islamic Republic of Iran','Iranian','IRN','IR'),
	(115,'Iraq','iq','Iraqi','Baghdad','Iraqi dinar','iqd','fils (inv.)','Republic of Iraq','Iraqi','IRQ','IQ'),
	(116,'Ireland','ie','Irish','Dublin','euro','eur','cent','Ireland (IE1)','Irishman; Irishwoman','IRL','IE'),
	(117,'Isle of Man (IM1)','im','Manx','Douglas','Manx pound (IM2)','imp','penny (pl. pence)','Isle of Man','Manxman; Manxwoman','IMN','IM'),
	(118,'Japan','jp','Japanese','Tokyo','yen (inv.)','jpy','[sen (inv.)] (JP1)','Japan','Japanese','JPN','JP'),
	(119,'Israel','il','Israeli','(IL1)','shekel','ils','agora\n        (pl. agorot)','State of Israel','Israeli','ISR','IL'),
	(120,'Italy','it','Italian','Rome','euro','eur','cent','Italian Republic','Italian','ITA','IT'),
	(121,'Jamaica','jm','Jamaican','Kingston','Jamaica dollar','jmd','cent','Jamaica','Jamaican','JAM','JM'),
	(123,'Jersey (JE1)','je','Jersey','St Helier','Jersey pound (JE2)','jep','penny (pl. pence)','Bailiwick of Jersey','of Jersey','JEY','JE'),
	(125,'Jordan','jo','Jordanian','Amman','Jordanian dinar','jod','100 qirsh\n        1 000 fils (','Hashemite Kingdom of Jordan','Jordanian','JOR','JO'),
	(126,'Kazakhstan','kz','Kazakh','Astana','tenge (inv.)','kzt','tiyn','Republic of Kazakhstan','Kazakh','KAZ','KZ'),
	(127,'Kenya','ke','Kenyan','Nairobi','Kenyan shilling','kes','cent','Republic of Kenya','Kenyan','KEN','KE'),
	(128,'Kiribati','ki','Kiribatian','Tarawa','Australian dollar','aud','cent','Republic of Kiribati','Kiribatian','KIR','KI'),
	(130,'Kuwait','kw','Kuwaiti','Kuwait City','Kuwaiti dinar','kwd','fils (inv.)','State of Kuwait','Kuwaiti','KWT','KW'),
	(131,'Kyrgyzstan','kg','Kyrgyz','Bishkek','som','kgs','tyiyn','Kyrgyz Republic','Kyrgyz','KGZ','KG'),
	(132,'Laos','la','Lao; Laotian','Vientiane','kip (inv.)','lak','[at (inv.)]','Lao People’s Democratic Republic','Lao','LAO','LA'),
	(133,'Latvia','lv','Latvian','Riga','lats (pl. lati)','lvl','santims\n        (pl. santimi)','Republic of Latvia','Latvian','LVA','LV'),
	(134,'Lebanon','lb','Lebanese','Beirut','Lebanese pound','lbp','[piastre]','Lebanese Republic','Lebanese','LBN','LB'),
	(135,'Lesotho','ls','of Lesotho','Maseru','loti (pl. maloti)','lsl','sente\n        (pl. lisente)','Kingdom of Lesotho','Basotho','LSO','LS'),
	(137,'Liberia','lr','Liberian','Monrovia','Liberian dollar','lrd','cent','Republic of Liberia','Liberian','LBR','LR'),
	(138,'Libya','ly','Libyan','Tripoli','Libyan dinar','lyd','dirham','Libya','Libyan','LBY','LY'),
	(139,'Liechtenstein','li','of Liechtenstein','Vaduz','Swiss franc','chf','centime','Principality of Liechtenstein','Liechtensteiner','LIE','LI'),
	(140,'Lithuania','lt','Lithuanian','Vilnius','litas (pl. litai)','ltl','centas\n        (pl. centai)','Republic of Lithuania','Lithuanian','LTU','LT'),
	(141,'Luxembourg','lu','Luxembourgish','Luxembourg','euro','eur','cent','Grand Duchy of Luxembourg','Luxembourger','LUX','LU'),
	(142,'Macao (MO1)','mo','Macanese','Macao (MO3)','pataca','mop','avo','Macao Special Administrative Region of the People’s Republic of China (MO2)','Macanese','MAC','MO'),
	(144,'Madagascar','mg','Malagasy','Antananarivo','ariary','mga','iraimbilanja (inv.)','Republic of Madagascar','Malagasy','MDG','MG'),
	(145,'Malawi','mw','Malawian','Lilongwe','Malawian kwacha (inv.)','mwk','tambala (inv.)','Republic of Malawi','Malawian','MWI','MW'),
	(146,'Malaysia','my','Malaysian','Kuala Lumpur (MY1)','ringgit (inv.)','myr','sen (inv.)','Malaysia','Malaysian','MYS','MY'),
	(147,'Maldives','mv','Maldivian','Malé','rufiyaa','mvr','laari (inv.)','Republic of Maldives','Maldivian','MDV','MV'),
	(148,'Mali','ml','Malian','Bamako','CFA franc (BCEAO)','xof','centime','Republic of Mali','Malian','MLI','ML'),
	(149,'Malta','mt','Maltese','Valletta','euro','eur','cent','Republic of Malta','Maltese','MLT','MT'),
	(150,'Marshall Islands','mh','Marshallese','Majuro','US dollar','usd','cent','Republic of the Marshall Islands','Marshallese','MHL','MH'),
	(151,'Martinique (MQ1)','mq','Martinican','Fort-de-France','euro','eur','cent','Martinique','Martinican','MTQ','MQ'),
	(152,'Mauritania','mr','Mauritanian','Nouakchott','ouguiya','mro','khoum','Islamic Republic of Mauritania','Mauritanian','MRT','MR'),
	(153,'Mauritius','mu','Mauritian','Port Louis','Mauritian rupee','mur','cent','Republic of Mauritius','Mauritian','MUS','MU'),
	(154,'Mayotte (YT1)','yt','Mahoran','Mamoudzou','euro','eur','cent','Mayotte','Mahorais','MYT','YT'),
	(155,'Mexico','mx','Mexican','Mexico City','Mexican peso','mxn','centavo','United Mexican States','Mexican','MEX','MX'),
	(156,'Micronesia','fm','of Micronesia','Palikir','US dollar','usd','cent','Federated States of Micronesia','Micronesian','FSM','FM'),
	(157,'Moldova','md','Moldovan','Chisinau','Moldovan leu (pl. lei)','mdl','ban\n        (pl. bani)','Republic of Moldova','Moldovan','MDA','MD'),
	(158,'Monaco','mc','Monegasque','Monaco','euro','eur','cent','Principality of Monaco','Monegasque','MCO','MC'),
	(159,'Mongolia','mn','Mongolian','Ulan Bator','tugrik','mnt','möngö (inv.)','Mongolia','Mongolian','MNG','MN'),
	(160,'Montenegro','me','Montenegrin','Podgorica','euro','eur','cent','Montenegro','Montenegrin','MNE','ME'),
	(161,'Montserrat (MS1)','ms','Montserratian','Plymouth (MS2)','East Caribbean dollar','xcd','cent','Montserrat','Montserratian','MSR','MS'),
	(162,'Morocco','ma','Moroccan','Rabat','Moroccan dirham','mad','centime','Kingdom of Morocco','Moroccan','MAR','MA'),
	(163,'Mozambique','mz','Mozambican','Maputo','metical\n        (pl. meticais)','mzn','centavo','Republic of Mozambique','Mozambican','MOZ','MZ'),
	(165,'Namibia','na','Namibian','Windhoek','Namibian dollar','nad','cent','Republic of Namibia','Namibian','NAM','NA'),
	(167,'Nauru','nr','Nauruan','Yaren','Australian dollar','aud','cent','Republic of Nauru','Nauruan','NRU','NR'),
	(168,'Nepal','np','Nepalese','Kathmandu','Nepalese rupee','npr','paisa (inv.)','Nepal','Nepalese','NPL','NP'),
	(169,'Netherlands (NL1)','nl','Netherlands; Dutch','Amsterdam (NL2)','euro','eur','cent','Kingdom of the Netherlands','Dutchman; Dutchwoman; Netherlander','NLD','NL'),
	(170,'New Caledonia (NC1)','nc','New Caledonian','Nouméa','CFP franc','xpf','centime','New Caledonia','New Caledonian','NCL','NC'),
	(171,'New Zealand','nz','of New Zealand','Wellington','New Zealand dollar','nzd','cent','New Zealand','New Zealander','NZL','NZ'),
	(172,'Nicaragua','ni','Nicaraguan','Managua','córdoba oro','nio','centavo','Republic of Nicaragua','Nicaraguan','NIC','NI'),
	(173,'Niger','ne','Nigerien','Niamey','CFA franc (BCEAO)','xof','centime','Republic of Niger','Nigerien','NER','NE'),
	(174,'Nigeria','ng','Nigerian','Abuja','naira (inv.)','ngn','kobo (inv.)','Federal Republic of Nigeria','Nigerian','NGA','NG'),
	(175,'Niue (NU1)','nu','Niuean','Alofi','New Zealand dollar','nzd','cent','Niue','Niuean','NIU','NU'),
	(176,'Norfolk Island (NF1)','nf','of Norfolk Island','Kingston','Australian dollar','aud','cent','Territory of Norfolk Island','Norfolk Islander','NFK','NF'),
	(177,'North Korea','kp','North Korean','Pyongyang','North Korean won (inv.)','kpw','chun (inv.)','Democratic People’s Republic of Korea','North Korean','PRK','KP'),
	(178,'Northern Mariana Islands (MP1)','mp','of the Northern Mariana Islands','Saipan','US dollar','usd','cent','Commonwealth of the Northern Mariana Islands','Northern Mariana Islander','MNP','MP'),
	(179,'Norway','no','Norwegian','Oslo','Norwegian krone (pl. kroner)','nok','øre (inv.)','Kingdom of Norway','Norwegian','NOR','NO'),
	(180,'Oman','om','Omani','Muscat','Omani rial','omr','baiza','Sultanate of Oman','Omani','OMN','OM'),
	(181,'Pakistan','pk','Pakistani','Islamabad','Pakistani rupee','pkr','paisa','Islamic Republic of Pakistan','Pakistani','PAK','PK'),
	(182,'Palau','pw','Palauan','Melekeok','US dollar','usd','cent','Republic of Palau','Palauan','PLW','PW'),
	(183,'Panama','pa','Panamanian','Panama City','balboa','pab','centésimo','Republic of Panama','Panamanian','PAN','PA'),
	(185,'Papua New Guinea','pg','of Papua New Guinea','Port Moresby','kina (inv.)','pgk','toea (inv.)','Independent State of Papua New Guinea','Papua New Guinean','PNG','PG'),
	(186,'Paraguay','py','Paraguayan','Asunción','guaraní\n        (pl. guaraníes)','pyg','céntimo','Republic of Paraguay','Paraguayan','PRY','PY'),
	(187,'Peru','pe','Peruvian','Lima','new sol','pen','céntimo','Republic of Peru','Peruvian','PER','PE'),
	(188,'Philippines','ph','Philippine','Manila','Philippine peso','php','centavo','Republic of the Philippines','Filipino','PHL','PH'),
	(189,'Pitcairn Islands (PN1)','pn','Pitcairner','Adamstown','New Zealand dollar','nzd','cent','Pitcairn Islands','Pitcairner','PCN','PN'),
	(190,'Poland','pl','Polish','Warsaw','zloty (pl. zlotys)','pln','grosz (pl. groszy)','Republic of Poland','Pole','POL','PL'),
	(191,'Portugal','pt','Portuguese','Lisbon','euro','eur','cent','Portuguese Republic','Portuguese','PRT','PT'),
	(192,'Puerto Rico (PR1)','pr','Puerto Rican','San Juan','US dollar','usd','cent','Commonwealth of Puerto Rico','Puerto Rican','PRI','PR'),
	(193,'Qatar','qa','Qatari','Doha','Qatari riyal','qar','dirham','State of Qatar','Qatari','QAT','QA'),
	(194,'Réunion (RE1)','re','Reunionese','Saint-Denis','euro','eur','cent','Réunion','Reunionese','REU','RE'),
	(195,'Romania','ro','Romanian','Bucharest','Romanian leu (pl. lei)','ron','ban (pl. bani)','Romania','Romanian','ROU','RO'),
	(196,'Russia','ru','Russian','Moscow','Russian rouble','rub','kopek','Russian Federation','Russian','RUS','RU'),
	(197,'Rwanda','rw','Rwandan; Rwandese','Kigali','Rwandese franc','rwf','centime','Republic of Rwanda','Rwandan; Rwandese','RWA','RW'),
	(198,'Saint Barthélemy (BL1)','bl','of Saint Barthélemy','Gustavia','euro','eur','cent','Collectivity of Saint Barthélemy','of Saint Barthélemy','BLM','BL'),
	(199,'Saint Helena (SH1)','sh','Saint Helenian','Jamestown','Saint Helena pound','shp','penny\n        (pl. pence)','Saint Helena, Ascension and Tristan da Cunha','Saint Helenian','SHN','SH'),
	(200,'Saint Kitts and Nevis','kn','of Saint Kitts and Nevis','Basseterre','East Caribbean dollar','xcd','cent','Federation of Saint Kitts and Nevis','Kittsian; Nevisian','KNA','KN'),
	(201,'Saint Lucia','lc','Saint Lucian','Castries','East Caribbean dollar','xcd','cent','Saint Lucia','Saint Lucian','LCA','LC'),
	(202,'Saint Martin (MF1)','mf','of Saint Martin','Marigot','euro','eur','cent','Collectivity of Saint Martin','of Saint Martin','MAF','MF'),
	(203,'Saint Pierre and Miquelon (PM1)','pm','of Saint Pierre and Miquelon','Saint-Pierre','euro','eur','cent','Territorial Collectivity of Saint Pierre and Miquelon','St-Pierrais; Miquelonnais','SPM','PM'),
	(204,'Saint Vincent and the Grenadines','vc','Vincentian; of Saint Vincent and the Grenadines','Kingstown','East Caribbean dollar','xcd','cent','Saint Vincent and the Grenadines','Vincentian','VCT','VC'),
	(206,'Samoa','ws','Samoan','Apia','tala (inv.)','wst','sene (inv.)','Independent State of Samoa','Samoan','WSM','WS'),
	(207,'San Marino','sm','of San Marino','San Marino','euro','eur','cent','Republic of San Marino','San Marinese','SMR','SM'),
	(208,'São Tomé and Príncipe','st','of São Tomé and Príncipe','São Tomé','dobra','std','centimo','Democratic Republic of São Tomé and Príncipe','São Toméan','STP','ST'),
	(209,'Saudi Arabia','sa','Saudi Arabian','Riyadh','riyal','sar','halala','Kingdom of Saudi Arabia','Saudi Arabian','SAU','SA'),
	(210,'Senegal','sn','Senegalese','Dakar','CFA franc (BCEAO)','xof','centime','Republic of Senegal','Senegalese','SEN','SN'),
	(211,'Serbia','rs','Serbian','Belgrade',' Serbian dinar','rsd','para (inv.)','Republic of Serbia','Serb','SRB','RS'),
	(212,'Seychelles','sc','of Seychelles','Victoria','Seychelles rupee','scr','cent','Republic of Seychelles','Seychellois','SYC','SC'),
	(213,'Sierra Leone','sl','Sierra Leonean','Freetown','leone','sll','cent','Republic of Sierra Leone','Sierra Leonean','SLE','SL'),
	(214,'Singapore','sg','Singaporean','Singapore','Singapore dollar','sgd','cent','Republic of Singapore','Singaporean','SGP','SG'),
	(215,'Sint Maarten (SX1)','sx','of Sint Maarten','Philipsburg','Netherlands Antillean guilder (SX1)','ang','cent','Sint Maarten','Sint Maartener','SXM','SX'),
	(216,'Slovakia','sk','Slovak; Slovakian','Bratislava','euro','eur','cent','Slovak Republic','Slovak','SVK','SK'),
	(217,'Slovenia','si','Slovenian','Ljubljana','euro','eur','cent','Republic of Slovenia','Slovene','SVN','SI'),
	(218,'Solomon Islands','sb','of the Solomon Islands','Honiara','Solomon Islands dollar','sbd','cent','Solomon Islands','Solomon Islander','SLB','SB'),
	(219,'Somalia','so','Somali; Somalian','Mogadishu','Somali shilling','sos','cent','Somali Republic','Somali','SOM','SO'),
	(220,'South Africa','za','South African','Pretoria (ZA1)','rand','zar','cent','Republic of South Africa','South African','ZAF','ZA'),
	(222,'South Korea','kr','South Korean','Seoul','South Korean won (inv.)','krw','[chun (inv.)]','Republic of Korea','South Korean','KOR','KR'),
	(223,'South Sudan','ss','South Sudanese','Juba','South Sudanese pound','ssp','piastre','Republic of South Sudan','South Sudanese','SSD','SS'),
	(224,'Spain','es','Spanish','Madrid','euro','eur','cent','Kingdom of Spain','Spaniard','ESP','ES'),
	(225,'Sri Lanka','lk','Sri Lankan','Colombo','Sri Lankan rupee','lkr','cent','Democratic Socialist Republic of Sri Lanka','Sri Lankan','LKA','LK'),
	(226,'Sudan','sd','Sudanese','Khartoum','Sudanese pound','sdg','piastre','Republic of the Sudan','Sudanese','SDN','SD'),
	(227,'Suriname','sr','Surinamese','Paramaribo','Surinamese dollar','srd','cent','Republic of Suriname','Surinamer','SUR','SR'),
	(228,'Svalbard and Jan Mayen (SJ1)','sj','of Svalbard, of Jan Mayen','Longyearbyen (Svalbard), Olonkinbyen (Jan Mayen)','Norwegian krone (pl. kroner)','nok','øre (inv.)','Svalbard and Jan Mayen','of Svalbard, of Jan Mayen','SJM','SJ'),
	(229,'Swaziland','sz','Swazi','Mbabane','lilangeni\n        (pl. emalangeni)','szl','cent','Kingdom of Swaziland','Swazi','SWZ','SZ'),
	(230,'Sweden','se','Swedish','Stockholm','krona (pl. kronor)','sek','öre (inv.)','Kingdom of Sweden','Swede','SWE','SE'),
	(231,'Switzerland','ch','Swiss','Berne','Swiss franc','chf','centime','Swiss Confederation','Swiss','CHE','CH'),
	(232,'Syria','sy','Syrian','Damascus','Syrian pound','syp','piastre','Syrian Arab Republic','Syrian','SYR','SY'),
	(233,'Taiwan','tw','Taiwanese','Taipei','new Taiwan dollar','twd','fen (inv.)','Republic of China, Taiwan (TW1)','Taiwanese','TWN','TW'),
	(234,'Tajikistan','tj','Tajik','Dushanbe','somoni','tjs','diram','Republic of Tajikistan','Tajik','TJK','TJ'),
	(235,'Tanzania','tz','Tanzanian','Dodoma (TZ1)','Tanzanian shilling','tzs','cent','United Republic of Tanzania','Tanzanian','TZA','TZ'),
	(236,'Thailand','th','Thai','Bangkok','baht (inv.)','thb','satang (inv.)','Kingdom of Thailand','Thai','THA','TH'),
	(237,'Timor-Leste','tl','East Timorese','Dili','US dollar','usd','cent','Democratic Republic of Timor-Leste','East Timorese','TLS','TL'),
	(238,'Togo','tg','Togolese','Lomé','CFA franc (BCEAO)','xof','centime','Togolese Republic','Togolese','TGO','TG'),
	(239,'Tokelau (TK1)','tk','Tokelauan','(TK2)','New Zealand dollar','nzd','cent','Tokelau','Tokelauan','TKL','TK'),
	(240,'Tonga','to','Tongan','Nuku’alofa','pa’anga (inv.)','top','seniti (inv.)','Kingdom of Tonga','Tongan','TON','TO'),
	(241,'Trinidad and Tobago','tt','of Trinidad and Tobago','Port of Spain','Trinidad and Tobago dollar','ttd','cent','Republic of Trinidad and Tobago','Trinidadian; Tobagonian','TTO','TT'),
	(242,'Tunisia','tn','Tunisian','Tunis','Tunisian dinar','tnd','millime','Republic of Tunisia','Tunisian','TUN','TN'),
	(243,'Turkey','tr','Turkish','Ankara','Turkish lira (inv.)','try','kurus (inv.)','Republic of Turkey','Turk','TUR','TR'),
	(244,'Turkmenistan','tm','Turkmen','Ashgabat','Turkmen manat (inv.)','tmt','tenge (inv.)','Turkmenistan','Turkmen','TKM','TM'),
	(245,'Turks and Caicos Islands (TC1)','tc','of the Turks and Caicos Islands','Cockburn Town','US dollar','usd','cent','Turks and Caicos Islands','Turks and Caicos Islander','TCA','TC'),
	(246,'Tuvalu','tv','Tuvaluan','Funafuti','Australian dollar','aud','cent','Tuvalu','Tuvaluan','TUV','TV'),
	(247,'Uganda','ug','Ugandan','Kampala','Uganda shilling','ugx','cent','Republic of Uganda','Ugandan','UGA','UG'),
	(248,'Ukraine','ua','Ukrainian','Kyiv','hryvnia','uah','kopiyka','Ukraine','Ukrainian','UKR','UA'),
	(249,'United Arab Emirates','ae','Emirian','Abu Dhabi','UAE dirham','aed','fils (inv.)','United Arab Emirates','Emirian','ARE','AE'),
	(250,'United Kingdom','gb','British','London','pound sterling','gbp','penny (pl. pence)','United Kingdom of Great Britain and Northern Ireland','British','GBR','GB'),
	(251,'United States','us','American; of the United States','Washington DC','US dollar','usd','cent','United States of America','American;\n        US citizen','USA','US'),
	(253,'Uruguay','uy','Uruguayan','Montevideo','Uruguayan peso','uyu','centésimo','Eastern Republic of Uruguay','Uruguayan','URY','UY'),
	(254,'US Virgin Islands (VI1)','vi','of the US Virgin Islands','Charlotte Amalie','US dollar','usd','cent','United States Virgin Islands','US Virgin Islander','VIR','VI'),
	(255,'Uzbekistan','uz','Uzbek','Tashkent','sum (inv.)','uzs','tiyin (inv.)','Republic of Uzbekistan','Uzbek','UZB','UZ'),
	(256,'Vanuatu','vu','Vanuatuan','Port Vila','vatu (inv.)','vuv',NULL,'Republic of Vanuatu','Vanuatuan','VUT','VU'),
	(258,'Venezuela','ve','Venezuelan','Caracas','bolívar  (pl. bolívares)','vef','céntimo','Bolivarian Republic of Venezuela','Venezuelan','VEN','VE'),
	(259,'Vietnam','vn','Vietnamese','Hanoi','dong','vnd','[10 hào\n        100 xu]','Socialist Republic of Vietnam','Vietnamese','VNM','VN'),
	(260,'Wallis and Futuna (WF1)','wf','of the Wallis and Futuna Islands','Mata-Utu','CFP franc','xpf','centime','Wallis and Futuna','Wallisian; Futunan; Wallis and Futuna Islander','WLF','WF'),
	(261,'Western Sahara (EH1)','eh','Sahrawi','Al aaiun','Moroccan dirham','mad','centime','Western Sahara','Sahrawi','ESH','EH'),
	(262,'Yemen','ye','Yemeni','San’a','Yemeni rial','yer','fils (inv.)','Republic of Yemen','Yemenite','YEM','YE'),
	(263,'Zambia','zm','Zambian','Lusaka','Zambian kwacha (inv.)','zmk','ngwee (inv.)','Republic of Zambia','Zambian','ZMB','ZM'),
	(264,'Zimbabwe','zw','Zimbabwean','Harare','Zimbabwe dollar (ZW1)','zwl','cent','Republic of Zimbabwe','Zimbabwean','ZWE','ZW');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы cron_passports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cron_passports`;

CREATE TABLE `cron_passports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `passport_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passport_id` (`passport_id`),
  CONSTRAINT `cron_passports_passport_id_fk` FOREIGN KEY (`passport_id`) REFERENCES `passports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cron_passports` WRITE;
/*!40000 ALTER TABLE `cron_passports` DISABLE KEYS */;

INSERT INTO `cron_passports` (`id`, `passport_id`, `created_at`, `updated_at`, `send_at`)
VALUES
	(20,38,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(24,46,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(31,60,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(32,61,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(33,77,'2014-07-04 14:00:14','2014-08-04 00:00:14','2014-08-04 00:00:00');

/*!40000 ALTER TABLE `cron_passports` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы cron_visas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cron_visas`;

CREATE TABLE `cron_visas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `visa_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visa_id` (`visa_id`),
  CONSTRAINT `cron_visas_visa_id_fk` FOREIGN KEY (`visa_id`) REFERENCES `visas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cron_visas` WRITE;
/*!40000 ALTER TABLE `cron_visas` DISABLE KEYS */;

INSERT INTO `cron_visas` (`id`, `visa_id`, `created_at`, `updated_at`, `send_at`)
VALUES
	(18,81,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(47,129,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(55,126,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(56,131,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(57,143,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(58,154,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(59,155,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(77,184,'2014-07-04 13:37:28','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(80,187,'2014-07-04 13:37:29','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(81,134,'2014-07-04 13:37:29','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(82,170,'2014-07-04 13:37:29','2014-07-04 13:38:08','2014-07-04 13:38:08'),
	(83,132,'2014-07-04 14:00:14','2014-08-04 00:00:14','2014-08-04 00:00:00'),
	(84,144,'2014-07-04 14:00:14','2014-08-04 00:00:14','2014-08-04 00:00:00'),
	(85,148,'2014-07-04 14:00:14','2014-08-04 00:00:14','2014-08-04 00:00:00'),
	(86,149,'2014-09-12 00:00:14','2014-11-12 00:00:14','2014-11-12 00:00:00'),
	(87,150,'2014-09-12 00:00:14','2014-11-12 00:00:14','2014-11-12 00:00:00'),
	(88,151,'2014-09-12 00:00:14','2014-11-12 00:00:14','2014-11-12 00:00:00'),
	(89,152,'2014-09-12 00:00:14','2014-11-12 00:00:14','2014-11-12 00:00:00'),
	(90,153,'2014-09-12 00:00:14','2014-11-12 00:00:14','2014-11-12 00:00:00'),
	(91,159,'2014-09-17 00:00:14','2014-11-17 00:00:14','2014-11-17 00:00:00'),
	(92,169,'2014-09-24 00:00:15','2014-11-24 00:00:14','2014-11-24 00:00:00'),
	(93,188,'2014-10-01 17:25:14','2014-12-01 00:00:14','2014-12-01 00:00:00'),
	(94,189,'2014-10-01 21:35:15','2014-10-01 21:35:15','2014-10-01 00:00:00'),
	(95,190,'2014-10-01 21:35:15','2014-10-01 21:35:15','2014-10-01 00:00:00'),
	(96,173,'2014-10-09 00:00:14','2014-12-09 00:00:14','2014-12-09 00:00:00'),
	(97,174,'2014-10-09 00:00:14','2014-12-09 00:00:14','2014-12-09 00:00:00'),
	(98,175,'2014-10-14 00:00:13','2014-12-14 00:00:14','2014-12-14 00:00:00'),
	(100,192,'2014-11-11 17:25:14','2014-11-11 17:25:14','2014-11-11 00:00:00'),
	(101,191,'2014-12-27 00:00:14','2015-02-27 00:00:14','2015-02-27 00:00:00');

/*!40000 ALTER TABLE `cron_visas` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы passport_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `passport_requests`;

CREATE TABLE `passport_requests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `text` text,
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `have_blank_pages` tinyint(1) DEFAULT '0',
  `is_intact` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trip_id` int(11) unsigned DEFAULT NULL,
  `is_assistance` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `passport_requests_user_id_fk` (`user_id`),
  KEY `passport_requests_trip_id_fk` (`trip_id`),
  CONSTRAINT `passport_requests_trip_id_fk` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`),
  CONSTRAINT `passport_requests_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `passport_requests` WRITE;
/*!40000 ALTER TABLE `passport_requests` DISABLE KEYS */;

INSERT INTO `passport_requests` (`id`, `user_id`, `text`, `is_processed`, `have_blank_pages`, `is_intact`, `created_at`, `updated_at`, `trip_id`, `is_assistance`)
VALUES
	(49,7,'',1,1,1,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(56,7,'',1,1,1,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(63,11,'',1,0,1,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(66,11,'',1,1,0,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(94,142,'',1,0,1,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(103,11,'',0,1,1,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(106,11,'',0,0,1,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(107,206,'',0,0,0,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(108,11,'',0,1,0,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(109,228,'',0,1,0,'2014-07-04 13:37:29','2014-07-04 13:37:29',NULL,0),
	(114,60,'',1,1,1,'2014-09-29 16:18:40','2014-10-01 18:31:16',NULL,0),
	(115,93,'',0,0,0,'2014-10-01 19:37:08','2014-10-01 19:37:08',NULL,0),
	(117,256,'',0,0,0,'2014-10-01 21:31:28','2014-10-01 21:31:28',309,0),
	(118,256,'',0,0,0,'2014-10-01 21:35:06','2014-10-01 21:35:06',NULL,0),
	(119,256,'',0,0,0,'2014-10-01 21:38:05','2014-10-01 21:38:05',311,0),
	(120,256,'',0,0,0,'2014-10-01 21:50:05','2014-10-01 21:50:05',NULL,0),
	(121,93,'',0,0,0,'2014-10-02 07:26:05','2014-10-02 07:26:05',NULL,0),
	(122,93,'',0,0,0,'2014-10-02 07:41:10','2014-10-02 07:41:10',NULL,0),
	(123,255,'',0,0,0,'2014-10-02 13:55:04','2014-10-02 13:55:04',NULL,0),
	(124,255,'',0,0,0,'2014-10-02 13:56:23','2014-10-02 13:56:23',NULL,0),
	(125,255,'',0,0,0,'2014-10-02 13:57:27','2014-10-02 13:57:27',NULL,0),
	(126,255,'',0,0,0,'2014-10-02 14:12:40','2014-10-02 14:12:40',NULL,0),
	(127,93,'',0,0,0,'2014-10-02 19:18:56','2014-10-02 19:18:56',NULL,0),
	(128,93,'',0,0,0,'2014-10-02 19:25:07','2014-10-02 19:25:07',NULL,0),
	(129,255,'',0,0,0,'2014-10-03 06:41:06','2014-10-03 06:41:06',NULL,0),
	(130,255,'',0,0,0,'2014-10-03 06:41:58','2014-10-03 06:41:58',NULL,0),
	(131,255,'',0,0,0,'2014-10-03 07:54:58','2014-10-03 07:54:58',NULL,0),
	(132,60,'',0,0,0,'2014-10-03 12:31:38','2014-10-03 12:31:38',NULL,1),
	(133,255,'',0,0,0,'2014-10-03 13:05:48','2014-10-03 13:05:48',325,0),
	(134,255,'',0,0,0,'2014-10-05 09:59:11','2014-10-05 09:59:11',NULL,0),
	(135,244,'',0,1,1,'2014-10-22 14:10:17','2014-10-22 14:10:17',327,0),
	(136,11,'',0,1,1,'2014-11-11 16:57:47','2014-11-11 16:57:47',328,0),
	(137,11,'',0,1,1,'2014-11-11 17:44:30','2014-11-11 17:44:30',329,0),
	(138,11,'',0,1,0,'2015-01-14 19:19:03','2015-01-14 19:19:03',330,0),
	(139,11,'',0,0,0,'2015-02-02 21:57:40','2015-02-02 21:57:40',31,0),
	(140,11,'',0,0,0,'2015-03-27 15:06:48','2015-03-27 15:06:48',331,1),
	(141,11,'',0,1,1,'2015-03-27 15:30:13','2015-03-27 15:30:13',332,0);

/*!40000 ALTER TABLE `passport_requests` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы passport_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `passport_types`;

CREATE TABLE `passport_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `timatic_code` varchar(100) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `passport_types` WRITE;
/*!40000 ALTER TABLE `passport_types` DISABLE KEYS */;

INSERT INTO `passport_types` (`id`, `name_en`, `timatic_code`, `code`)
VALUES
	(1,'Normal','passport','normal');

/*!40000 ALTER TABLE `passport_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы passports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `passports`;

CREATE TABLE `passports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `passport_type_id` int(11) unsigned DEFAULT NULL,
  `country_id` int(11) unsigned DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `expires_on` date DEFAULT NULL,
  `passport_bio` varchar(50) DEFAULT NULL,
  `issued_by` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passports_user_id_fk` (`user_id`),
  KEY `passports_passport_type_id_fk` (`passport_type_id`),
  KEY `passports_country_id_fk` (`country_id`),
  CONSTRAINT `passports_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `passports_passport_type_id_fk` FOREIGN KEY (`passport_type_id`) REFERENCES `passport_types` (`id`),
  CONSTRAINT `passports_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `passports` WRITE;
/*!40000 ALTER TABLE `passports` DISABLE KEYS */;

INSERT INTO `passports` (`id`, `user_id`, `passport_type_id`, `country_id`, `number`, `valid_from`, `expires_on`, `passport_bio`, `issued_by`, `is_primary`, `created_at`, `updated_at`)
VALUES
	(38,9,1,251,'215500634','2006-01-12','2016-01-11',NULL,'United States of America',1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(40,11,1,251,'0923091257','2012-01-01','2020-09-01',NULL,'texas',0,'2014-07-04 13:37:31','2014-11-11 17:06:04'),
	(46,7,1,220,'12345678912','2009-04-08','2019-04-02',NULL,'Durban',1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(60,83,1,251,'448223886','2008-06-27','2018-06-26',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(61,80,1,251,'429129121','2007-08-22','2017-08-21',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(68,60,1,251,'dfghfg897h6f8g6h8f6gh','2010-10-01','2023-10-02',NULL,NULL,1,'2014-07-04 13:37:31','2014-10-01 19:27:18'),
	(71,134,1,250,'7777','2002-07-01','2015-07-30',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(73,93,1,251,'sdjkghdfkg23593','2013-07-20','2013-07-21',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(75,111,1,181,'PAK1808XOA','2008-07-02','2018-06-30',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(77,142,1,169,'123456789','2009-09-14','2014-09-15',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(89,166,1,251,'130326404','2009-01-05','2019-01-08',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(90,79,1,251,'444348586','2008-06-04','2018-06-03',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(91,168,1,251,'DEMOPASSPORTNUMBER','2010-10-01','2023-10-02',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(92,169,1,251,'987654321','2013-10-02','2023-10-01',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(93,171,1,251,'7569841','2013-10-02','2023-10-01',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(94,173,1,251,'483920574','2013-10-17','2023-10-16',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(95,78,1,251,'123456','2000-11-15','2020-11-14',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(96,189,1,251,'425367215','2006-12-02','2016-12-01',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(97,209,1,251,'sd98f7sd89f7s89d7f9sd7f89sd7f','2008-01-01','2018-01-10',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(98,212,1,251,'df89gd7f89g7d98f7g','2006-01-02','2016-01-13',NULL,NULL,1,'2014-07-04 13:37:31','2014-07-04 13:37:37'),
	(99,210,1,251,'sdfs87d6f78sd6f78s6df','2011-01-07','2021-01-20',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(100,206,1,251,'dfgdfgdhdfh54565yh56h','2014-01-01','2024-12-31',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(102,207,1,251,'123945867','2014-01-09','2024-01-08',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(103,208,1,251,'239567039','2014-01-09','2024-01-08',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(104,213,1,222,'M00097504','2013-09-19','2023-09-18',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(106,203,1,110,'dg368379','2014-02-10','2017-02-14',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(107,225,1,251,'954724698','2012-03-01','2022-02-28',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(109,228,1,10,'34sdfs324','2014-04-01','2017-04-01',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(110,238,1,251,'2835629375','2014-05-01','2024-04-30',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(111,226,1,251,'438489985','2008-01-28','2017-01-27',NULL,NULL,1,'2014-07-04 13:37:32','2014-07-04 13:37:37'),
	(112,246,1,251,'221864220','2007-03-30','2017-03-29','Passport__1_.pdf',NULL,1,'2014-09-30 13:56:02','2014-09-30 13:56:02'),
	(113,244,1,251,'458664027','2009-08-07','2019-08-06',NULL,NULL,0,'2014-10-01 17:17:52','2014-10-01 17:17:52'),
	(114,244,1,251,'458664027','2009-08-07','2019-08-06',NULL,NULL,1,'2014-10-01 17:19:09','2014-10-01 17:19:09'),
	(115,11,1,42,'1234568','2014-10-01','2014-10-01',NULL,NULL,0,'2014-10-01 18:48:20','2014-11-11 17:07:18'),
	(120,256,1,251,'13215413','2014-10-01','2015-10-08','Lenovo_Jetpack_-_Original.jpg',NULL,1,'2014-10-01 21:28:23','2014-10-01 21:28:23'),
	(121,255,1,251,'272y3','2014-10-02','2015-10-31','1412254067545.jpg',NULL,1,'2014-10-02 12:44:26','2014-10-02 12:48:06'),
	(122,245,1,251,'437983100','2008-01-08','2018-01-07',NULL,NULL,1,'2014-10-03 10:22:16','2014-10-03 10:22:16'),
	(123,245,1,251,'437983100','2008-01-08','2018-01-07',NULL,NULL,0,'2014-10-03 10:23:37','2014-10-03 10:23:37'),
	(124,11,1,2,'SDF458721635','2016-11-09','2018-11-16','Egnyte_Folder_not_synced.png',NULL,1,'2014-11-11 17:14:55','2014-11-11 17:14:55'),
	(125,252,1,251,'436263813','2007-12-21','2017-12-20',NULL,NULL,1,'2014-12-22 21:22:24','2014-12-22 21:22:24'),
	(126,257,1,251,'123456789','2015-03-05','2025-03-05',NULL,NULL,1,'2015-03-05 17:50:57','2015-03-05 17:50:57');

/*!40000 ALTER TABLE `passports` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы purposes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purposes`;

CREATE TABLE `purposes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) DEFAULT NULL,
  `timatic_code` varchar(100) DEFAULT NULL,
  `description` text,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purposes` WRITE;
/*!40000 ALTER TABLE `purposes` DISABLE KEYS */;

INSERT INTO `purposes` (`id`, `name_en`, `timatic_code`, `description`, `code`)
VALUES
	(1,'Business','business','Activity Examples: Attending business meetings, attending a conference or lecture, or establishing contacts on behalf of your company, visiting customers, providing non-technical sales support, gathering market information, conducting short-term research, attending a business seminar, making a presentation, discussing regulatory changes, negotiating and signing contracts, participating in a conference or symposium or meeting with government officials. ','business'),
	(2,'Tourism','tourism','Activity Examples: Leisure travel for vacation purposes, to visit family, friends and sightseeing.','tourism'),
	(3,'Student','duty','Activity Examples: To enroll or take classes in a local school system or university. Most often required for undergraduate or graduate studies at an accredited university; however, can be required for elementary and secondary education depending on the country in question.','student'),
	(4,'Employment','employment','Activity Examples: Work activities that exceed those permissible under a business visa. Including, but not limited to, taking up short-or-long term employment; fulfilling job duties of a work assignment; engaging in technical, hands-on work activities; installation and/or repair of machinery or hardware; and/or performing certain types of training.','employment'),
	(5,'Transit','transit','Activity Examples: Entering the host country only as an intermediate stop in your travels to a final destination outside of that country. It can be issued valid either for immediate and continuous airport transit only, or for an extremely limited number of days, depending on the country in question.','transit'),
	(6,'Dependent','dependent','Activity Examples: To reside in a country as a family member of a work permit or work visa holder for a specific amount of time. Allows for legal residence in the host country, but often does not allow or guarantee work authorization for the dependent.','dependent'),
	(7,'Conference','conference','Activity Examples: To attend a conference only.','conference');

/*!40000 ALTER TABLE `purposes` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы request_callbacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `request_callbacks`;

CREATE TABLE `request_callbacks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `request_callbacks` WRITE;
/*!40000 ALTER TABLE `request_callbacks` DISABLE KEYS */;

INSERT INTO `request_callbacks` (`id`, `user_id`, `is_processed`, `phone`, `created_at`, `updated_at`)
VALUES
	(29,256,0,'1561531354352','2014-10-01 22:11:35','2014-10-01 22:11:35');

/*!40000 ALTER TABLE `request_callbacks` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20140130094222'),
	('20140130094722'),
	('20140131115608'),
	('20140131121454'),
	('20140131131454'),
	('20140131131554'),
	('20140131131654'),
	('20140203180732'),
	('20140223145630'),
	('20140318110349'),
	('20140404120737'),
	('20140409055911'),
	('20140409071139'),
	('20140409135758'),
	('20140411112728'),
	('20140425121634'),
	('20140429113424'),
	('20140514062021'),
	('20140611073800'),
	('20140611113128'),
	('20140630125918'),
	('20140630131606'),
	('20140702074201');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы secure_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `secure_messages`;

CREATE TABLE `secure_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `secure_messages_user_id_fk` (`user_id`),
  CONSTRAINT `secure_messages_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `secure_messages` WRITE;
/*!40000 ALTER TABLE `secure_messages` DISABLE KEYS */;

INSERT INTO `secure_messages` (`id`, `user_id`, `text`, `created_at`, `updated_at`)
VALUES
	(41,256,'hello testing','2014-10-01 22:11:59','2014-10-01 22:11:59'),
	(42,244,'Hello,\r\n\r\nMy Visa 01556/2014 expires on 1/1/2015. Can you please help in renewing this.\r\n\r\nThank You \r\nTodd Caracci','2014-11-12 18:38:50','2014-11-12 18:38:50');

/*!40000 ALTER TABLE `secure_messages` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `label`, `key`, `value`, `created_at`, `updated_at`)
VALUES
	(1,'Dial Helpline Phone','dial_helpline_phone','9417946461','2014-07-04 13:37:29','2014-07-04 13:37:29'),
	(2,'PLG Email From','from_email','no-reply@pro-linkglobal.com','2014-07-04 13:37:29','2014-07-04 13:37:29'),
	(3,'PLG Email To','to_email','travel-link@pro-linkglobal.com','2014-07-04 13:37:29','2014-07-04 13:38:05'),
	(4,'PLG Email To Name','to_email_name','Pro-Link GLOBAL','2014-07-04 13:37:29','2014-07-04 13:38:05'),
	(5,'SMTP Mail Account','smtp_settings_user_name','travel-link@law.local','2014-07-04 13:37:29','2014-07-04 13:38:05'),
	(6,'SMTP Mail Account Password','smtp_settings_password','JJnbgT%^h$f^&jjE*)@ddFr76','2014-07-04 13:37:29','2014-07-04 13:38:05'),
	(7,'SMTP Client','smtp_settings_address','remote.pro-linkglobal.com','2014-07-04 13:37:29','2014-07-04 13:38:05'),
	(9,'Port','smtp_settings_port','25','2014-07-04 13:37:29','2014-07-04 13:38:05'),
	(10,'Passport Expiry Cron ( * works at 5:00 )','passport_expiry_cron','1','2014-07-04 13:37:29','2014-07-04 13:37:29'),
	(11,'Visa Expiry Cron ( * works at 5:00 )','visa_expiry_cron','1','2014-07-04 13:37:29','2014-07-04 13:37:29'),
	(12,'Timatic Request Counter','timatic_request','888','2014-07-04 13:37:42','2015-03-27 15:30:13'),
	(13,'PLG Email From Name','from_email_name','Pro-Link GLOBAL','2014-07-04 13:38:05','2014-07-04 13:38:05'),
	(14,'SMTP Authentication Type','smtp_settings_authentication','login','2014-07-04 13:38:05','2014-07-04 13:38:05'),
	(15,'Enable TLS','smtp_settings_enable_starttls_auto','1','2014-07-04 13:38:05','2014-07-04 13:38:05');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(22) NOT NULL,
  `code` char(2) NOT NULL,
  `country_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_fk` (`country_id`),
  CONSTRAINT `states_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;

INSERT INTO `states` (`id`, `name_en`, `code`, `country_id`)
VALUES
	(1,'Alaska','AK',251),
	(2,'Alabama','AL',251),
	(3,'Arkansas','AR',251),
	(4,'Arizona','AZ',251),
	(5,'California','CA',251),
	(6,'Colorado','CO',251),
	(7,'Connecticut','CT',251),
	(8,'District of Columbia','DC',251),
	(9,'Delaware','DE',251),
	(10,'Florida','FL',251),
	(11,'Georgia','GA',251),
	(12,'Hawaii','HI',251),
	(13,'Iowa','IA',251),
	(14,'Idaho','ID',251),
	(15,'Illinois','IL',251),
	(16,'Indiana','IN',251),
	(17,'Kansas','KS',251),
	(18,'Kentucky','KY',251),
	(19,'Louisiana','LA',251),
	(20,'Massachusetts','MA',251),
	(21,'Maryland','MD',251),
	(22,'Maine','ME',251),
	(23,'Michigan','MI',251),
	(24,'Minnesota','MN',251),
	(25,'Missouri','MO',251),
	(26,'Mississippi','MS',251),
	(27,'Montana','MT',251),
	(28,'North Carolina','NC',251),
	(29,'North Dakota','ND',251),
	(30,'Nebraska','NE',251),
	(31,'New Hampshire','NH',251),
	(32,'New Jersey','NJ',251),
	(33,'New Mexico','NM',251),
	(34,'Nevada','NV',251),
	(35,'New York','NY',251),
	(36,'Ohio','OH',251),
	(37,'Oklahoma','OK',251),
	(38,'Oregon','OR',251),
	(39,'Pennsylvania','PA',251),
	(40,'Rhode Island','RI',251),
	(41,'South Carolina','SC',251),
	(42,'South Dakota','SD',251),
	(43,'Tennessee','TN',251),
	(44,'Texas','TX',251),
	(45,'Utah','UT',251),
	(46,'Virginia','VA',251),
	(47,'Vermont','VT',251),
	(48,'Washington','WA',251),
	(49,'Wisconsin','WI',251),
	(50,'West Virginia','WV',251),
	(51,'Wyoming','WY',251);

/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы trips
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trips`;

CREATE TABLE `trips` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `to_id` int(11) unsigned NOT NULL,
  `from_id` int(11) unsigned NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `purpose_id` int(11) unsigned DEFAULT NULL,
  `visa_id` int(10) unsigned DEFAULT NULL,
  `airport` varchar(250) DEFAULT NULL,
  `state_id` int(11) unsigned DEFAULT NULL,
  `visa_required` tinyint(1) DEFAULT '1',
  `passport_required` tinyint(1) DEFAULT '1',
  `is_current_changed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `transit_country_id` int(10) unsigned DEFAULT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '0',
  `transit_arrival_date` date DEFAULT NULL,
  `transit_departure_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `visa_id` (`visa_id`),
  KEY `trips_to_id_fk` (`to_id`),
  KEY `trips_from_id_fk` (`from_id`),
  KEY `trips_purpose_id_fk` (`purpose_id`),
  KEY `trips_state_id_fk` (`state_id`),
  KEY `index_trips_on_transit_country_id` (`transit_country_id`),
  CONSTRAINT `trip_country_transit_country_fk` FOREIGN KEY (`transit_country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `trips_from_id_fk` FOREIGN KEY (`from_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `trips_purpose_id_fk` FOREIGN KEY (`purpose_id`) REFERENCES `purposes` (`id`),
  CONSTRAINT `trips_state_id_fk` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `trips_to_id_fk` FOREIGN KEY (`to_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `trips_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `trips_visa_id_fk` FOREIGN KEY (`visa_id`) REFERENCES `visas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;

INSERT INTO `trips` (`id`, `user_id`, `to_id`, `from_id`, `province`, `purpose_id`, `visa_id`, `airport`, `state_id`, `visa_required`, `passport_required`, `is_current_changed`, `created_at`, `updated_at`, `date_from`, `date_to`, `transit_country_id`, `is_current`, `transit_arrival_date`, `transit_departure_date`)
VALUES
	(31,11,17,251,'',1,NULL,'Bush International',NULL,1,1,0,'2014-07-04 13:37:30','2015-02-02 21:57:40','2014-10-31','2014-12-24',NULL,1,'2015-02-02','2015-02-02'),
	(33,11,10,251,'',1,NULL,'Bush International',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:35','2015-05-28','2015-07-01',NULL,0,NULL,NULL),
	(38,11,32,251,'',4,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:35','2015-08-01','2015-09-01',NULL,0,NULL,NULL),
	(39,11,32,251,'',4,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:35','2015-09-02','2015-10-31',NULL,0,NULL,NULL),
	(53,11,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:35','2013-05-16','2013-06-04',NULL,0,NULL,NULL),
	(55,11,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:35','2013-07-01','2013-07-17',NULL,0,NULL,NULL),
	(61,11,32,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:35','2013-08-25','2013-08-28',NULL,0,NULL,NULL),
	(73,9,10,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-04-10','2013-04-20',NULL,0,NULL,NULL),
	(74,9,32,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-05-01','2013-05-08',NULL,0,NULL,NULL),
	(75,9,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-07-01','2013-07-03',NULL,0,NULL,NULL),
	(76,9,4,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-08-14','2013-08-28',NULL,0,NULL,NULL),
	(78,9,32,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-09-22','2013-09-27',NULL,0,NULL,NULL),
	(79,9,35,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-10-01','2013-10-05',NULL,0,NULL,NULL),
	(94,11,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2015-12-01','2015-12-31',NULL,0,NULL,NULL),
	(105,7,48,220,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-05-03','2013-05-13',NULL,0,NULL,NULL),
	(107,9,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-05-29','2013-05-31',NULL,0,NULL,NULL),
	(111,83,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-05-14','2013-05-24',NULL,0,NULL,NULL),
	(115,7,11,195,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-06-27','2013-07-07',NULL,0,NULL,NULL),
	(154,7,48,220,'test',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-07-18','2013-07-28',NULL,0,NULL,NULL),
	(159,60,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-07-25','2013-08-31',NULL,0,NULL,NULL),
	(160,60,112,251,'',1,131,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-09-01','2013-09-30',NULL,0,NULL,NULL),
	(165,111,48,112,'shanghai',1,NULL,'shanghai pudong',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-08-19','2013-08-26',NULL,0,NULL,NULL),
	(166,60,3,251,'',1,132,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2014-07-01','2014-07-24',NULL,0,NULL,NULL),
	(168,9,3,251,'',1,NULL,'TPA',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-11-02','2013-11-02',NULL,0,NULL,NULL),
	(169,142,48,251,'shanghai',1,NULL,'Tampa',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-11-05','2013-11-19',NULL,0,NULL,NULL),
	(170,142,220,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2014-03-03','2014-03-18',NULL,0,NULL,NULL),
	(171,60,48,251,'',1,126,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-11-21','2013-11-30',NULL,0,NULL,NULL),
	(172,60,112,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-12-06','2013-12-12',NULL,0,NULL,NULL),
	(177,9,48,251,'',1,134,'',NULL,1,1,0,'2014-07-04 13:37:30','2014-07-04 13:37:36','2013-12-17','2013-12-21',NULL,0,NULL,NULL),
	(191,60,48,251,'',1,126,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-12-01','2013-12-02',NULL,0,NULL,NULL),
	(193,79,48,251,'AP',1,NULL,'BWI',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-22','2013-11-20',NULL,0,NULL,NULL),
	(194,79,32,251,'Rio',4,NULL,'BWI',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-12-11','2014-12-31',NULL,0,NULL,NULL),
	(195,9,83,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-12-15','2013-12-29',NULL,0,NULL,NULL),
	(196,9,83,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-01','2014-01-14',NULL,0,NULL,NULL),
	(197,9,112,251,'',1,159,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-02-01','2014-02-14',NULL,0,NULL,NULL),
	(215,168,48,251,'',1,143,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-01','2013-10-11',NULL,0,NULL,NULL),
	(217,60,83,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-02','2013-10-12',NULL,0,NULL,NULL),
	(218,169,83,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-02','2013-10-16',NULL,0,NULL,NULL),
	(219,169,112,251,'',4,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-11-01','2013-11-30',NULL,0,NULL,NULL),
	(222,60,83,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-11-07','2013-11-08',NULL,0,NULL,NULL),
	(224,171,83,251,'',1,NULL,'',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-13','2013-10-27',NULL,0,NULL,NULL),
	(227,173,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-11-15','2013-11-22',NULL,0,NULL,NULL),
	(228,168,32,248,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-11-15','2013-11-27',NULL,0,NULL,NULL),
	(229,111,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-30','2013-11-02',NULL,0,NULL,NULL),
	(230,111,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-11-30','2014-11-04',NULL,0,NULL,NULL),
	(234,168,48,251,'',1,143,'San Francisco ',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-10-24','2013-11-03',NULL,0,NULL,NULL),
	(236,168,163,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-12-06','2013-12-18',NULL,0,NULL,NULL),
	(237,168,12,42,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-11-30','2013-12-04',NULL,0,NULL,NULL),
	(241,78,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2013-12-04','2013-12-04',NULL,0,NULL,NULL),
	(246,189,48,251,'',1,153,'TPA',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-15','2014-01-29',NULL,0,NULL,NULL),
	(247,9,196,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-03-01','2014-03-08',NULL,0,NULL,NULL),
	(248,209,57,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-02-01','2014-03-07',NULL,0,NULL,NULL),
	(249,212,57,251,'',1,170,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-08','2014-06-30',NULL,0,NULL,NULL),
	(250,210,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-23','2014-02-12',NULL,0,NULL,NULL),
	(251,210,57,251,'',1,169,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-22','2014-05-31',NULL,0,NULL,NULL),
	(252,206,57,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-09','2014-03-19',NULL,0,NULL,NULL),
	(256,207,48,251,'',1,NULL,'TPA',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-24','2014-01-31',NULL,0,NULL,NULL),
	(257,208,32,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-22','2014-01-31',NULL,0,NULL,NULL),
	(258,212,32,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-01-27','2014-01-31',NULL,0,NULL,NULL),
	(259,213,251,220,NULL,1,176,'Johannesburg',10,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-02-23','2014-02-28',NULL,0,NULL,NULL),
	(274,203,48,110,'',1,NULL,'budapedt',NULL,0,0,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-02-21','2014-02-28',NULL,0,NULL,NULL),
	(280,9,112,251,'',1,NULL,'',NULL,0,0,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-01','2014-05-08',NULL,0,NULL,NULL),
	(281,210,90,251,'',1,NULL,'',NULL,0,0,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-08-01','2014-08-08',NULL,0,NULL,NULL),
	(282,210,48,251,'',1,NULL,'',NULL,0,0,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-02-26','2014-02-28',NULL,0,NULL,NULL),
	(285,11,48,251,'',4,NULL,'',NULL,0,0,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2021-02-01','2021-02-28',NULL,0,NULL,NULL),
	(289,9,32,251,'',1,NULL,'TPA',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-03-17','2014-03-21',NULL,0,NULL,NULL),
	(290,209,48,251,'',1,NULL,'Tampa International Airport',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-03-17','2014-03-21',NULL,0,NULL,NULL),
	(297,228,32,250,'',4,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-04-01','2014-04-11',NULL,0,NULL,NULL),
	(298,228,48,251,'',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-04-25','2014-04-30',NULL,0,NULL,NULL),
	(299,238,48,251,'',1,NULL,'TPA',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-27','2014-05-31',NULL,0,NULL,NULL),
	(300,9,48,251,'',1,134,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-09','2014-05-19',NULL,0,NULL,NULL),
	(301,226,32,251,'TX',1,NULL,'',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-14','2014-05-24',NULL,0,NULL,NULL),
	(302,226,163,251,'',1,NULL,'IAH',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-05-30','2014-06-30',NULL,0,NULL,NULL),
	(303,226,32,251,'',1,NULL,'IAH',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-08-14','2014-08-30',NULL,0,NULL,NULL),
	(304,226,4,251,'',1,NULL,'IAH',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-09-01','2014-09-30',NULL,0,NULL,NULL),
	(305,226,52,251,'',1,NULL,'IAH',NULL,0,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-10-01','2014-10-30',NULL,0,NULL,NULL),
	(306,226,48,251,'',1,NULL,'iah',NULL,1,1,0,'2014-07-04 13:37:31','2014-07-04 13:37:36','2014-11-01','2014-11-30',NULL,0,NULL,NULL),
	(309,256,32,251,'',1,NULL,'',NULL,1,1,0,'2014-10-01 21:31:28','2014-10-01 21:31:28','2014-10-09','2014-11-20',NULL,0,'2014-10-01','2014-10-01'),
	(311,256,48,251,'',4,NULL,'',NULL,1,1,0,'2014-10-01 21:38:05','2014-10-01 21:38:05','2014-09-01','2014-09-25',NULL,0,'2014-10-01','2014-10-01'),
	(325,255,32,251,'',1,NULL,'',NULL,1,0,0,'2014-10-03 13:05:48','2014-10-03 13:06:04','2014-10-03','2014-10-03',NULL,1,'2014-10-03','2014-10-03'),
	(327,244,4,251,'',1,188,'rochester NY - ROC',NULL,1,1,0,'2014-10-22 14:10:17','2014-10-22 14:10:17','2014-10-24','2014-10-25',83,0,'2014-10-25','2014-10-25'),
	(328,11,48,251,'',2,NULL,'',NULL,1,1,0,'2014-11-11 16:57:47','2015-01-14 19:16:58','2015-01-01','2015-01-30',11,1,'2014-01-01','2015-01-03'),
	(329,11,48,251,'',3,NULL,'',NULL,1,1,0,'2014-11-11 17:44:30','2014-11-11 17:44:30','2015-02-13','2015-02-20',NULL,0,'2014-11-11','2014-11-11'),
	(330,11,32,251,'',4,NULL,'',NULL,1,0,0,'2015-01-14 19:19:03','2015-01-14 19:19:03','2015-02-03','2015-02-08',NULL,0,'2015-01-14','2015-01-14'),
	(331,11,48,251,'',3,NULL,'',NULL,1,1,0,'2015-03-27 15:06:48','2015-03-27 15:06:48','2015-07-02','2015-07-18',NULL,0,'2015-03-27','2015-03-27'),
	(332,11,48,251,'',1,NULL,'',NULL,1,1,0,'2015-03-27 15:30:13','2015-03-27 15:30:13','2016-03-28','2016-08-31',250,0,'2016-04-05','2016-04-06');

/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы user_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_profiles`;

CREATE TABLE `user_profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `dob` datetime DEFAULT '1980-08-12 17:56:31',
  `mobile_phone_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hr_manager` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hr_manager_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) unsigned DEFAULT NULL,
  `nationality_id` int(11) unsigned DEFAULT NULL,
  `job_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `second_nationality_id` int(11) unsigned DEFAULT NULL,
  `state_id` int(11) unsigned DEFAULT NULL,
  `address_country_id` int(11) unsigned DEFAULT NULL,
  `address_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_address_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_address_line_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_postal_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_state_id` int(11) unsigned DEFAULT NULL,
  `home_country_id` int(11) unsigned DEFAULT NULL,
  `home_address_line_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_address_line_1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `third_nationality_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `has_more_nationality` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_profiles_country_id_fk` (`country_id`),
  KEY `user_profiles_nationality_id_fk` (`nationality_id`),
  KEY `user_profiles_second_nationality_id_fk` (`second_nationality_id`),
  KEY `user_profiles_third_nationality_id_fk` (`third_nationality_id`),
  KEY `user_profiles_address_country_id_fk` (`address_country_id`),
  KEY `user_profiles_home_country_id_fk` (`home_country_id`),
  KEY `user_profiles_home_state_id_fk` (`home_state_id`),
  KEY `user_profiles_state_id_fk` (`state_id`),
  CONSTRAINT `user_profiles_address_country_id_fk` FOREIGN KEY (`address_country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `user_profiles_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `user_profiles_home_country_id_fk` FOREIGN KEY (`home_country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `user_profiles_home_state_id_fk` FOREIGN KEY (`home_state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `user_profiles_nationality_id_fk` FOREIGN KEY (`nationality_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `user_profiles_second_nationality_id_fk` FOREIGN KEY (`second_nationality_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `user_profiles_state_id_fk` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `user_profiles_third_nationality_id_fk` FOREIGN KEY (`third_nationality_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `user_profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;

INSERT INTO `user_profiles` (`id`, `user_id`, `dob`, `mobile_phone_number`, `company`, `hr_manager`, `hr_manager_email`, `gender`, `country_id`, `nationality_id`, `job_title`, `second_nationality_id`, `state_id`, `address_country_id`, `address_province`, `address_city`, `work_address_line_2`, `work_address_line_1`, `home_city`, `home_postal_code`, `postal_code`, `home_address_province`, `home_state_id`, `home_country_id`, `home_address_line_2`, `home_address_line_1`, `secondary_email`, `third_nationality_id`, `created_at`, `updated_at`, `has_more_nationality`)
VALUES
	(7,7,'1977-08-12 08:35:59','+1 123-456-7890','1 Durban Street','','marc.fregona@pro-linkglobal.com','male',220,220,'IT',NULL,NULL,251,NULL,'Bradenton','','1813 Manatee Avenue West','Bradenton','34205','34209','',10,251,'','1813 Manatee Avenue West','marc.fregona@pro-linkglobal.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(9,9,'1977-11-07 10:41:20','+1-941-962-6482','Global Visa Services','Joann Wright','joann.wright@pro-linkglobal.com','female',251,251,'Manager, Business Resources',NULL,14,251,'',NULL,'','12345 Street Rd','Bradenton','34205','34208','',14,251,'','1813 Manatee Ave W','test@email.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(11,11,'1995-04-01 00:00:00','123456','test Co','Brad Button','Brad.button@pro-linkglobal.com','female',251,251,'Database Management Specialist',2,2,251,'','','','100 Polly Bird','Bradenton','0','0','',2,251,'123','1813 Manatee Ave','',2,'2014-07-04 13:37:32','2014-11-11 17:49:49',0),
	(49,48,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(59,58,'1980-08-12 13:09:59','12234555','','','','female',220,220,'',NULL,NULL,NULL,'','','','','Sandton','4325','','Gauteng',NULL,220,'','123 Smart St','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(61,60,'1980-03-15 10:00:47','1231231234','Acme Inc.','','plgapptest@gmail.com','male',251,251,'Plant Manager',NULL,NULL,NULL,NULL,'','','','test','75737','',NULL,2,251,'','123 main','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(79,78,'1972-09-20 04:08:08','941-962-6462','Pro-Link Global','','','male',251,251,'Vice President',220,2,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Bradenton','34209','34205',NULL,10,251,'','1719 91st street NW','Lance.d.elliott@pro-linkglobal.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(80,79,'1973-04-25 20:47:56','941-744-7195','Pro-Link GLOBAL','','','female',251,251,'Global Immigration Counsel',3,2,NULL,NULL,'Columbia','Suite 400','10480 Little Patuxent Parkway','Harrogate','3166-2','21044','North Yorkshire',NULL,250,'','123 Rutledge Lane','jillmbussey@gmail.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(81,80,'1988-11-18 10:52:04','941-730-1942','Pro-Link Global','','','female',251,3,'Coordinator, Knowledge Management',NULL,2,NULL,NULL,'Minneapolis','','2932 Park Ave S','Minneapolis','55407','55407',NULL,24,251,'','2932 Park Ave. S','soosmit88@gmail.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(84,83,'1979-07-21 08:44:45','+48784389209','Pro-link global inc',NULL,NULL,NULL,251,NULL,'GIG manager',NULL,2,NULL,NULL,'Bradenton','','1813 manatee ave w','Rudna wielka','36-054','34205','',NULL,190,'','Rudna wielka 121b','Beata.firosz@yahoo.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(94,93,'1980-08-12 07:31:12','9888916532','','','','male',NULL,3,'',NULL,NULL,NULL,'','','','','dgfhdfgh','123123','','',NULL,196,'','bmv','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(112,111,'1980-08-12 00:00:00','+1 123 456 7891','A Tech Company','','','female',112,251,'Software Analyst 3',90,1,2,'','Bangalore','','Technology Park','Lahore','12345','2453','',1,181,'near Plot 2','House 35','andrea.elliott@pro-linkglobal.com',2,'2014-07-04 13:37:32','2014-11-18 20:28:10',1),
	(114,113,'1976-07-06 10:22:07','2019881273',NULL,'','','male',NULL,NULL,'',NULL,NULL,NULL,'','','','','Atlanta','30329','',NULL,2,251,'#1612','1520 Avenue Place','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:51',0),
	(135,134,'0000-00-00 00:00:00','+19417301745','Pro-Link Global',NULL,NULL,NULL,251,NULL,'CFO',NULL,10,NULL,NULL,'BRADENTON','Manatee Ave West','1813','BRADENTON','34209','34205',NULL,10,251,'4th Ave West','7908','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(137,136,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(143,142,'0000-00-00 00:00:00','9419628486','Pro-Link Global','','','female',NULL,169,'',220,NULL,NULL,'','','','','Bradenton','34209','',NULL,2,251,'','7908 4th Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(148,147,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(167,166,'0000-00-00 00:00:00','+1.817.559.1204','FlightSafety International','','','male',251,3,'International Generalist',NULL,2,NULL,NULL,'Ft Worth ','','4660 Diplomacy Rd','Richardson','75080','76155',NULL,44,251,'','202 S Weatherred','zbindch@yahoo.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(169,168,'1980-08-12 17:03:12','+1 941 555 6666','','','jane.public@company.com','male',251,251,'CEO',NULL,10,251,NULL,'Bradenton','','1813 Manatee Ave W','Bradenton','34205','34205',NULL,10,251,'','1813 Manatee Ave W','brad.button@pro-linkglobal.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(170,169,'1980-08-12 09:13:22','1-234-456-7890','Boeing','','','male',251,3,'Manager, Business Resources',NULL,2,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Houston','77573','34205',NULL,2,251,'','123 main street','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(171,170,'1980-08-12 17:56:31','1-234-456-7890',NULL,'','','female',NULL,251,'',NULL,NULL,NULL,'','','','','Phoenix','85041','',NULL,4,251,'','3932 Main Street','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(172,171,'1980-08-12 13:07:28','9419626482','Boeing','','','',251,NULL,'Manager, Business Resources',NULL,2,NULL,NULL,'Chicago','','100 NOrth Riverside','Bradenton','34205','60606',NULL,2,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(173,172,'1980-08-12 17:56:31','',NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','','','',NULL,NULL,'','','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(174,173,'1980-08-12 13:38:46','941954854','Seagate','','','female',251,NULL,'',NULL,2,NULL,NULL,'Cupertino','','','Bradenton','34205','',NULL,2,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(177,176,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(185,184,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(187,186,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(188,187,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(189,188,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(190,189,'1980-08-12 13:36:37','387-383-0919','McDonalds','','','female',251,251,'Manager',NULL,2,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Houston','77698','34205',NULL,2,251,'','123 Main St','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(192,191,'0000-00-00 00:00:00','+1 623-866-3273','Pro-Link Global',NULL,NULL,NULL,NULL,NULL,'Client Services Manager',NULL,NULL,NULL,'','','','','Dublin','43016','',NULL,36,251,'','5367 Paddock Falls Drive','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(204,203,'1979-03-14 12:30:53','+36203833207','plg','','','female',110,110,'gGCM',NULL,NULL,NULL,'','budapes','','pozsonyi ut 15','budapest','1137','1136','',NULL,110,'','pozsonyi ut 15','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(205,204,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(207,206,'1980-08-12 11:14:03','+1 941 555-5555','Test Co','Jane Citizen','','male',251,251,'CEO',NULL,10,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Bradenton','34205','34205',NULL,10,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(208,207,'1980-08-12 10:24:22','9419626482','Anadarko','Jane Citizen','jane.citizent99@gmail.com','male',251,251,'Manager, Business Dev',NULL,2,NULL,NULL,'Houston ','','','Bradenton ','34205','',NULL,2,251,'','100 10th St W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(209,208,'1980-08-12 10:45:19','123-234-5687','','Jane Citizen','jane.citizent99@gmail.com','male',NULL,251,'Manager, Business Dev',NULL,NULL,NULL,'','','','','Bradenton','34205','','FL ',NULL,NULL,'','100 10th St W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(210,209,'1980-08-12 09:58:38','+1 941 555-5555','Test Co','Jane Citizen','jane.citizent99@gmail.com','female',251,251,'Manager, Remote Systems',NULL,10,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Bradenton','34205','34205',NULL,10,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(211,210,'1980-03-11 10:35:26','+1 941 555-5555','Test Co','Jane Citizen','jane.citizent99@gmail.com','female',251,251,'HR Manager',NULL,10,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Bradenton','34205','34205',NULL,10,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(213,212,'1980-08-12 10:31:30','+1 941 555-5555','Test Co','Jane Citizen','jane.citizent99@gmail.com','female',251,251,'Manager, Plant Operations',NULL,2,NULL,NULL,'Bradenton','','1813 Manatee Ave W','Bradenton','34205','34205',NULL,10,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(214,213,'1986-10-22 01:02:10','+27780231155','Pro-linkglobal',NULL,NULL,NULL,220,NULL,'Client Services Coordinator ( PLG | EMEA )',NULL,NULL,NULL,'Kwazulu Natal','Durban','Westville','17 B Prince Charles Road','Durban','3629','3629','Kwazulu Natal',NULL,220,'Westville','17 B Prince Charles Road','danielc022@gmail.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(221,220,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(224,223,'1980-08-12 17:56:31','',NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','','','',NULL,NULL,'','','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(226,225,'1980-08-12 11:18:23','9419629000','Pro-Link GLOBAL, Inc.','','','',251,NULL,'',NULL,2,NULL,NULL,'Bradenton','','1813 Manatee Ave West','Bradenton','34205','34205',NULL,10,251,'','1813 Manatee Ave West','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(227,226,'0000-00-00 00:00:00','9366612775','Anadarko Petroleum Corp','','','',251,NULL,'Global Travel Services Manager',NULL,2,NULL,NULL,'The Woodlands','','1201 Lake Robbins DR','Bedias','77831','77380',NULL,2,251,'','24248 County Road 115','wolf3x56@gmail.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(228,227,'1980-08-12 11:35:16','1234','','','','',NULL,NULL,'',NULL,NULL,NULL,'','','','','phoenix','77573','',NULL,2,251,'','123 main st','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(229,228,'1980-08-12 06:21:30','123-456-7890','companie\'s name here','','','',NULL,NULL,'',NULL,NULL,NULL,'','','','','Phoenix','77573','','',NULL,42,'','342 main st','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(232,231,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(233,232,'1987-12-07 16:42:59','7134463585','Anadarko','','','female',251,251,'Security Analyst',NULL,44,NULL,NULL,'The Woodlands','','1201 Lake Robbins Drive','Montgomery','77356','77380',NULL,44,251,'','12937 Victoria Regina','melissa.rizzuto@hotmail.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(235,234,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(236,235,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(237,236,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(238,237,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(239,238,'1980-08-12 08:51:34','9419626482','Pro-Link GLOBAL ','','','',251,NULL,'',NULL,2,NULL,NULL,'Bradenton','','1813 Manatee Ave West','Bradenton','34205','34205',NULL,2,251,'','1813 Manatee Ave W','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(240,239,'1980-08-12 17:56:31','',NULL,'','','',NULL,NULL,'',NULL,NULL,NULL,'','','','','','','','',NULL,NULL,'','','',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:52',0),
	(241,240,'1980-08-12 09:09:43','281-389-2914','',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'','','','','spring ','77379','',NULL,2,251,'','20914 Auburn Ridge Ln','abolton@carlsonwagonlit.com',NULL,'2014-07-04 13:37:32','2014-07-04 13:37:32',0),
	(242,241,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-08-26 13:19:46','2014-08-26 13:19:46',0),
	(243,242,'1985-08-12 00:00:00','123-456-7890','TEST',NULL,NULL,NULL,NULL,NULL,'',NULL,1,2,'','','','','Tempe','85041','','',44,251,'','210 West St. Anne','',NULL,'2014-08-26 14:28:57','2014-08-26 14:32:58',0),
	(244,243,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-09-29 15:48:09','2014-09-29 15:48:09',0),
	(245,244,'1965-08-06 00:00:00','585-766-7898','Harris Corporation','Esther Lumague','elumague@harris.com','male',251,251,'Manufacturing Engineer',2,35,251,'New York','Rochester','','1680 University Ave','Rochester','14612','14612','',35,251,'','582 Bridgewood Drive','',2,'2014-09-29 15:51:18','2014-10-01 17:22:33',0),
	(246,245,'1973-10-06 00:00:00','585-766-7294','Harris Corporation',NULL,NULL,NULL,NULL,NULL,'Technician',NULL,35,251,'','Rochester','','1350 Jefferson Road','Lima','14485','14623','',35,251,'','PO Box 63  ','',NULL,'2014-09-29 15:51:58','2014-10-03 10:20:37',0),
	(247,246,'1966-07-05 00:00:00','5852000296','Harris RF Communications',NULL,NULL,NULL,NULL,NULL,'Electrical Engineer',NULL,1,251,'New York','Rochester','','1350 Jefferson Road','East Rochester','14445','14623','New York',1,251,'','139 West Chestnut St','dsmith14469@gmail.com',NULL,'2014-09-29 15:52:39','2014-09-30 13:52:50',0),
	(248,247,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-09-29 15:53:23','2014-09-29 15:53:23',0),
	(250,249,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-09-29 15:54:40','2014-09-29 15:54:40',0),
	(251,250,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-09-29 15:55:18','2014-09-29 15:55:18',0),
	(252,251,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-09-29 15:56:02','2014-09-29 15:56:02',0),
	(253,252,'1980-08-12 00:00:00','7169832158','',NULL,NULL,NULL,NULL,NULL,'',NULL,1,2,'','','','','Depew','14043','','',35,251,'','78 Eastwood Pkwy','',NULL,'2014-09-29 15:56:41','2014-12-22 21:21:07',0),
	(254,253,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-09-29 15:57:16','2014-09-29 15:57:16',0),
	(255,254,'1964-10-31 00:00:00','(585) 766-7453','Harris Corporation',NULL,NULL,NULL,NULL,NULL,'Engineering Technician',NULL,35,251,'','Rochester','','1680 University Ave.','Scottsville','14546','14610','',35,251,'','219 Humphrey Rd.','cdavis1@rochester.rr.com',NULL,'2014-10-01 19:52:48','2014-10-01 19:57:31',0),
	(256,255,'1980-08-12 00:00:00','123456789','Testing Co',NULL,NULL,NULL,NULL,NULL,'',NULL,1,251,'Tx','San Jose','','100 Polly Bird','Friendswood','85041','99578','',1,251,'','1234 Hello World','',NULL,'2014-10-01 20:38:57','2014-10-01 20:43:08',0),
	(257,256,'1980-08-12 00:00:00','15615','',NULL,NULL,NULL,NULL,NULL,'',NULL,1,2,'','','','','tempe','16412','','',1,251,'','25','',NULL,'2014-10-01 20:56:16','2014-10-01 20:57:13',0),
	(258,257,'1985-11-22 00:00:00','+1.941.462.2569','Pro-Link GLOBAL',NULL,NULL,NULL,NULL,NULL,'Manager, Client Services',NULL,10,251,'','','','','Long Beach','90808','','CA',1,251,'','5860 E Adderley Dr','',NULL,'2014-11-11 18:11:29','2015-03-05 17:49:21',0),
	(259,258,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-11-11 18:12:13','2014-11-11 18:12:13',0),
	(260,259,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2014-11-14 16:25:34','2014-11-14 16:25:34',0),
	(261,260,'1980-08-12 17:56:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2015-03-27 12:37:23','2015-03-27 12:37:23',0);

/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `access_token` varchar(100) DEFAULT NULL,
  `was_sent_invite_letter` tinyint(1) DEFAULT '0',
  `step` varchar(50) DEFAULT 'license',
  `is_agreed_terms` tinyint(1) NOT NULL DEFAULT '0',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(10) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'User',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `vaccination_certificate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_email` (`email`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `access_token`, `was_sent_invite_letter`, `step`, `is_agreed_terms`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `type`, `is_admin`, `created_at`, `updated_at`, `first_name`, `last_name`, `middle_name`, `avatar`, `vaccination_certificate`)
VALUES
	(7,'marc.fregona@pro-linkglobal.com','nnrOZZDAsAreIGDmNkh9womDdwADYuOFOO6',1,'active',1,'$2a$10$ArjWFowqZJ/M9ss.ERtKh.MBPnP.l3Ad1/PtjSSRV6mVW5pF/wa4G','q46HBsddqJNEJfEmuzxg',NULL,NULL,1,'2015-03-26 13:38:46','2015-03-26 13:38:46','24.73.205.86','24.73.205.86','Manager',1,'2014-07-04 13:37:33','2015-03-26 13:38:46','Marc','Fregona','',NULL,NULL),
	(9,'christen.gause@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$cpkMjpW3U7fHcXCCkq2.M.B2M/HI4kHS4mqA.WwJ5ciwOHUfBrEgi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:05','Christen','Gause','Rae',NULL,NULL),
	(11,'emily.rubio@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$lYvBjv/ML3ZTvEIigENVVOvVobjOZ1OJnGi5o8ULjT.fgsZORnHpe','J8-DkK96sX1vyGKS5jEr',NULL,NULL,15,'2015-03-27 15:11:46','2015-03-26 20:01:35','98.167.150.223','184.218.6.190','Manager',1,'2014-07-04 13:37:33','2015-03-27 15:11:46','Emily','Rubio','','Egnyte_Syncing_Pic.jpg',NULL),
	(48,'cassandra.spalding@pro-linkglobal.com','G49lXhhcRdPVQfD6mrRO7MvAhRx6Fyw3AzA',1,'change_password',1,'$2a$10$6ZG29dYdF.1AfLa/uwSMuej1NCjqGKBteZZHXVfbmEppwNZN2eM9i',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:05','Cassandra','Spalding',NULL,NULL,NULL),
	(58,'ingeandrea.elliott@gmail.com','s0GBbLQxmslZsKmFeqb0mwgQ2BkcfAW8eYk',1,'active',1,'$2a$10$KQ0Plzei6CjncVChv3XHseDuzCKkH6flbYFWzjk7SrP8.UN3MkkS6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:05','Andrea','Elliot','',NULL,NULL),
	(60,'brad.button@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$u1HbJJI.kgqLRPPYHrW6kuXumVG0O6FqWAvPue7hT2jqPtMQJLuxm','XgtxtdTvrz2Jsi_tFgkK',NULL,NULL,4,'2015-03-26 14:16:44','2015-02-16 01:01:36','24.73.205.86','65.35.123.125','Manager',1,'2014-07-04 13:37:33','2015-03-26 14:16:44','Brad','Button','R',NULL,NULL),
	(78,'lance.elliott@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$BvKGY12nagVxnY4kN7Lt5OrdPQzvjrqaWg/Eb3ih0r6IgtuxGc02G',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:05','Lance','Elliott','Darrel',NULL,NULL),
	(79,'jill.bussey@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$B/MxSl6ztglGZq7DBZGIw.FvRJSxTYhCXrsKud3VtX6x3Pc.trhMu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:05','Jill','Bussey','Marie',NULL,NULL),
	(80,'soohyung.smit@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$7DBZFM6Beifzltaz/CC.G.PXUufu4BoKhXRY/.1skwT6Ps4vj6fSu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:05','SooHyung','Smit','',NULL,NULL),
	(83,'beata.firosz@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$tU2b3vUjOFccCNTEWszRAu5BcBVivOAwRa7ohdFoKFbNdweBnHVHC','d9459cf6e6d0586adfe5c271baa1d65b1fa34839610059a9de19f856ec20a59c','2015-03-26 14:31:18',NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2015-03-26 14:31:18','Beata ','Firosz',NULL,NULL,NULL),
	(93,'web.alex.leontev@gmail.com',NULL,1,'active',1,'$2a$10$REhr3ukZwgYspAdoXJNWs.VG/MW8ga5bU3myXjM409GqtsZvKCFby','YSx-kj5ydHjLsE2ExYEa',NULL,NULL,8,'2015-03-28 19:02:15','2015-03-28 14:23:07','213.138.82.49','213.138.82.49','User',1,'2014-07-04 13:37:33','2015-03-28 19:02:15','Alex','Yu','Leontev',NULL,NULL),
	(111,'andrea.elliott@pro-linkglobal.com','yioGRFTN0FP7NDtWVxOvIkI3GJfuNexc1eU',1,'active',1,'$2a$10$Qusjp0cGs6xyKQGt4sf3.ulmbfagQVpXyo50NoNXeRJBUQDo68P0S','k4NeRn4DJaYDxjWghLUT',NULL,NULL,1,'2014-11-18 20:23:09','2014-11-18 20:23:09','12.130.116.210','12.130.116.210','User',1,'2014-07-04 13:37:33','2014-11-18 20:27:08','Andrea','Elliott','','image.jpg','image.jpg'),
	(113,'jason.rogers@pro-linkglobal.com','bHxyMOxlCLCdxfMeUIWYHzKSJYaVqEZe5iE',1,'active',1,'$2a$10$lqPXy6cn7Van3anaVkibF.z5tHhM9xo0IIDWgeg7AAZG6aW13uM06',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Jason','Rogers','Larry',NULL,NULL),
	(134,'ian.juul@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$y62OUzkxVanwFjC767CpHO2SPLuuCAZ5SoVpvC94gdPW5hdwGYxzy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Ian','Juul',NULL,NULL,NULL),
	(136,'lavinia.pascariu@pro-linkglobal.com',NULL,1,'change_password',0,'$2a$10$cJ9L/NlZpDPIHttPAh2jGOeLMIjwI48WsK3qO9qC1nGnXRSCOIpEa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Lavinia','Pascariu',NULL,NULL,NULL),
	(142,'michelle.juul@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$tKx0fdg0NOpO3OGGMqb4f.ijk/OD2F4HGOiZvSM04i2729.MfGhB6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Michelle','Juul','',NULL,NULL),
	(147,'fabiano.bittencourt@pro-linkglobal.com',NULL,1,'change_password',0,'$2a$10$ZSEHlTdKNRqBTn/X3Y7yOu6SrndHHz8Utv4p5eSr.xF1v7FtNwZPS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Fabiano','Bittencourt',NULL,NULL,NULL),
	(166,'chris.zbinden@flightsafety.com',NULL,1,'active',1,'$2a$10$WO/aj6oypaAbWCT/mGd.rO/I0VeLVf2iE.nUPn0Ej3YEicFyXahGi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Chris','Zbinden','',NULL,NULL),
	(168,'demo.usert99@gmail.com',NULL,1,'active',1,'$2a$10$9s62/jYDrQ/ErVSnrFHJmeUlUXPGizUU1cb/NgrN6qSGBDUpY3DhG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Demo','Customer','ERC',NULL,NULL),
	(169,'johnny.smith@test.com',NULL,1,'active',1,'$2a$10$.zm6Btk5AshORAfE2NA0YuCluQEK9fVb3/XPK9qeJW5CO5zGG3Aqu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Johnny','Smith','',NULL,NULL),
	(170,'jennie.white@test.com',NULL,1,'change_password',0,'$2a$10$e9n6tPhd.luf7WMRf8XUxe..izUo05F4Z5DOh7YmkHPxWrwcCS96S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Jennie','White','',NULL,NULL),
	(171,'peter.smith@test.com',NULL,1,'active',1,'$2a$10$tBibw/T1Tap4XF2a6ZQ.n.nvtKSF0CC5VlihEW6dKRWQaeIji3rIK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Peter','Smith',NULL,NULL,NULL),
	(172,'leslie.rodriguez@test.com',NULL,1,'change_password',0,'$2a$10$NX/PcBdPgfMFPWy64JKp1.H7AXxqJAL.Rit01HdYeh3wrSxCxni.W',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Leslie','Rodriguez','',NULL,NULL),
	(173,'stephanie.miller@test.com',NULL,1,'active',1,'$2a$10$UkprInUlZ5AHccKuOKV4HeUa6NXwCGhXkD.g07fAVd6Ud.9quIZRW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Stephanie','Miller','',NULL,NULL),
	(176,'joe.crumly@anadarko.com',NULL,1,'change_password',0,'$2a$10$QvrSV1vwcfEvY9YKklsNV.GYHZpwRI2H7nP3xkYlPdXtkkDT8eneO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Joe','Crumly',NULL,NULL,NULL),
	(184,'plg.multimedia@gmail.com',NULL,1,'change_password',0,'$2a$10$LNBVbxv4MRN0havxiT53me7jIHjtsuEWH2zYIzuuGOMJUr.kZ4uoW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','asdfaszdf','zxczxc',NULL,NULL,NULL),
	(186,'testemail@gqmail.com',NULL,1,'change_password',0,'$2a$10$pXl57XT1VK/Jr1OyRmiioeCyKWDdYt3bS3THyzJV9hPP7QMxqT2xO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','qweqwe','qweqwe',NULL,NULL,NULL),
	(187,'sfsdfsdf@testmail.com',NULL,1,'change_password',0,'$2a$10$0osLe9Q/fnIABYn.rrnBr.CIr0LtbJpjlR80Lgca.ySI6VAxrIQoa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','sdfsf','sdfsdf',NULL,NULL,NULL),
	(188,'avonsmith@gmail.com',NULL,1,'change_password',0,'$2a$10$jMpE5Q7EsTOxbu02yAIJa.Nq9kI/ddvHT4doNnAtAJsZYykN.Pt6q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Avon','Smith',NULL,NULL,NULL),
	(189,'jmiller@test.com',NULL,1,'active',1,'$2a$10$K2oKZNTkcVKX.KEBsKS5nuBCKGnnqKP379uFRXcMuP25kz/sN9NbO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Jennifer','Miller','',NULL,NULL),
	(191,'joel.spokas@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$agafbj9iLM5kEL2ZpFgNB.AeHJr3JoZfmJoutC.B9XrF5d1WaWNcC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Joel','Spokas',NULL,NULL,NULL),
	(203,'aniko.lichtenberger@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$7BO8VmFYQ8Zebhby9sg6due.inY0ZBHhx6jdOr5Enma1br7GgpirS','8f172540315383966ec5c30d7ba22a474a1a9c57e0734e8575423dfcf8c401fd','2015-03-27 15:13:16',NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2015-03-27 15:13:16','Aniko','Lichtenberger','',NULL,NULL),
	(204,'susanne.turner@pro-linkglobal.com','1wWFd8RpnPLxWXQS1NHT09dyqBOGO5oWmfK',1,'change_password',0,'$2a$10$UJs/ch54B5ZajehR14ho2.rACPcBT/Y4UOz7dGu4NsJK5sI6p62om',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Susanne','Turner',NULL,NULL,NULL),
	(206,'travel.linkt1@gmail.com',NULL,1,'active',1,'$2a$10$T6IdsWhrcgClQ13rUSWVFe6aiPvpIeSswylb6J7fPze1Zlk8zgxTe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','John','Citizen1','Q',NULL,NULL),
	(207,'travel.linkt2@gmail.com',NULL,1,'active',1,'$2a$10$9ZI.CcFhZ7ZfXQMu3D7ps.dorCa0q8ggY72KXhXcc76WEx9d88COG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Bob','Citizen2','A',NULL,NULL),
	(208,'travel.linkt3@gmail.com',NULL,1,'active',1,'$2a$10$2rHRRPS2dqQfuLU2P8swp.hdABxTKHKA5g6qMRJoaIHgSlaOO81yy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33',NULL,NULL,NULL,NULL,NULL),
	(209,'travel.linkt4@gmail.com',NULL,1,'active',1,'$2a$10$iY.J1Jx./M7v/xoC7qPjxOMLvPNC.7dVxV6CjhcdyNkTtcwg.3Atq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Jennifer','Citizen3','R',NULL,NULL),
	(210,'jane.citizent99@gmail.com',NULL,1,'active',1,'$2a$10$sVMi9O67ap4kRlS5WactAeEolXlRVKkfIEHYoxh4UUlpaKLYEwIvy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Jane','Citizen','',NULL,NULL),
	(212,'travel.linkt6@gmail.com',NULL,1,'active',1,'$2a$10$k3anW9hX0Fbz.KGqdpGt0ebjJapvbKr.BTEjTI2RMFEvRVHMw06Ku',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Lisa','Citizen6','',NULL,NULL),
	(213,'daniel.coetzee@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$2XCBxWq575Sdvg52OqRHluH6WYUbuxvxV.6wznzn7OCIUaZFE4aAm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Daniel ','Coetzee',NULL,NULL,NULL),
	(220,'lrogers@eagle.org',NULL,1,'change_password',0,'$2a$10$Z6sQOvH5AUsB4IzyDkl.VuL6paEYwIYuWZI91UGau4mHISzH9c30y',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Lew','Rogers',NULL,NULL,NULL),
	(223,'kimcottone@yahoo.com',NULL,1,'change_password',0,'$2a$10$8qQFseJ9eDL7cu5Rsczf0uQglpc/fSUTPP9bbopWxb2fJY/37.nAO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Kim','Cottone','',NULL,NULL),
	(225,'johnqpublic@yahoo.com',NULL,1,'active',1,'$2a$10$2/8rCtCya9VzqWmcScmPr.E6M89a./JyysuS7RZEJEbJVUk2DPFGu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','John','Public',NULL,NULL,NULL),
	(226,'tania.wolf@anadarko.com',NULL,1,'active',1,'$2a$10$HMjYtacdT2qnjZVmsWfRmu/vcSQh8IuG.JtSd3qD3b/4refsKiB1.',NULL,NULL,NULL,4,'2014-08-07 14:09:38','2014-07-10 06:07:26','95.174.101.58','95.174.101.58','Manager',1,'2014-07-04 13:37:33','2014-08-07 14:09:38','Tania','Wolf',NULL,NULL,NULL),
	(227,'johnny.smith@pro-linkglobal.com',NULL,1,'active',1,'$2a$10$LDofaIo/2j29R7IDMwcuquCQpX5wfxUxShM.RHjjO2K783MD6OVGO',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Johnny','Smith',NULL,NULL,NULL),
	(228,'emilyrubio.plg@gmail.com',NULL,1,'active',1,'$2a$10$S4OusCXObtybR0LJi6ju/uBoG2e0it53MZFnqHLSll/Jufd0y66pC',NULL,NULL,NULL,1,'2014-08-22 19:21:46','2014-08-22 19:21:46','50.175.91.216','50.175.91.216','User',1,'2014-07-04 13:37:33','2014-08-22 19:21:46','emily','testing',NULL,NULL,NULL),
	(231,'aleksey6689@gmail.com',NULL,1,'change_password',0,'$2a$10$zdMaYN0OWeW3nexmv2qSzeTa4J7Hi2Sx1yKQBPZyDhWC2iDvdTfq6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Test','Wizard',NULL,NULL,NULL),
	(232,'melissa.rizzuto@anadarko.com',NULL,1,'active',1,'$2a$10$UhucYMTUhWVZqPZxg3N5/eUT9TbfSMIGzlQHjhGeyHuC/aA5yeXr.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Melissa','Rizzuto','',NULL,NULL),
	(234,'von.salmans@anadarko.com',NULL,1,'change_password',0,'$2a$10$DdiYUmH7yfSkxhmoLksu2.BGbDX6MKtwmZa.PyNFexlUY4BhOwOzy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Von','Salmans',NULL,NULL,NULL),
	(235,'fred.hales@anadarko.com','C0pDHJvdI4jFMZRMlIJAcs76pwsOJfxOgxN',1,'change_password',0,'$2a$10$wMTjUPPlqOBN0sDO9fyu2eoBXAJFv4U9rlOVbdJO087zy6Nl6/MSy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Fred','Hales',NULL,NULL,NULL),
	(236,'jennifer.collins@anadarko.com',NULL,1,'change_password',0,'$2a$10$sdrYnJlwdLvASDeid8BDr.8JYxRMzc4jorLC81Ukpp9SFTiDBBNUC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Jennifer','Collins',NULL,NULL,NULL),
	(237,'kathy.leibold@anadarko.com','f9oEU50hauMvF2W6do1Mlq97Sc0bZRVoNr1',1,'change_password',0,'$2a$10$YUiuG133Teeh81y9SZqIUuTFUlW1/oQyG5i8VkXLl3uhfj3wcFj1m',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Kathy','Leibold',NULL,NULL,NULL),
	(238,'jackie.smith@test.com',NULL,1,'active',1,'$2a$10$53o8o0WqzJCi8E1MQPEpku9f8vWEtJ5jE7Z.uBJBxcstXUJTMM.dy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Jackie','Smith',NULL,NULL,NULL),
	(239,'rebecca.jones@test.com',NULL,1,'change_password',0,'$2a$10$LK5Fk87d09VEMAg7iAl20.qQBp/jowE.veB9NsoXO54EPY7kvtFL2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Manager',1,'2014-07-04 13:37:33','2014-07-04 13:38:06','Rebecca','Jones','',NULL,NULL),
	(240,'angela.bolton@anadarko.com',NULL,1,'active',1,'$2a$10$Vb/N6dl1xm6ZouiyfIlDU.6tacVe9oaAPKKCsLdL9iq7j/RvUFWfq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'User',1,'2014-07-04 13:37:33','2014-07-04 13:37:33','Angela','Bolton',NULL,NULL,NULL),
	(241,'merrilee.bratt@pentair.com','',0,'license',0,'$2a$10$4PFm49PaEuJ22KZf.QfJReSb/KbVuT7wn1tojYaUbbG6MuUjM4duu',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-08-26 13:19:46','2014-08-26 13:19:46','Merrilee','Bratt','',NULL,NULL),
	(242,'test@pro-linkglobal.com','',0,'active',1,'$2a$10$Y74coTu5fwwhaHtkOXe5xOXEpo0s6uYvPDQVHVoFciXBXTm2Eu7Uy',NULL,NULL,NULL,6,'2015-03-27 15:10:32','2015-03-26 19:58:14','98.167.150.223','184.218.6.190','Manager',0,'2014-08-26 14:28:57','2015-03-27 15:10:32','Test','Manager','',NULL,NULL),
	(243,'plgbbutton@gmail.com','',0,'license',0,'$2a$10$V2GWfhPxlYu8w8Ar4nUzvOTejVZi7CgZkqyeFbTURLlPwAAQjHMC.',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-09-29 15:48:09','2014-09-29 15:48:09','Test','Email','',NULL,NULL),
	(244,'tcaracci@harris.com','',0,'active',1,'$2a$10$rJqlT3LUlDhY82A/hB72jOED69C/Pg8CNDGMEoYL5HF0Z9cv9b5GG',NULL,NULL,NULL,3,'2014-11-12 18:35:42','2014-10-22 14:01:55','198.99.128.100','198.99.128.100','User',0,'2014-09-29 15:51:18','2014-11-12 18:35:42','Todd        ','Caracci            ','Michael',NULL,NULL),
	(245,'remeri02@harris.com','',0,'active',1,'$2a$10$m..4mpidWnhxSgsOFJ8vdebi9lrCZFszUR9sJ.229069pA1CeiKPy',NULL,NULL,NULL,1,'2014-10-03 10:17:34','2014-10-03 10:17:34','198.99.128.101','','User',0,'2014-09-29 15:51:58','2014-10-03 10:20:37','Robert      ','Emerick         ','',NULL,NULL),
	(246,'dsmith87@harris.com','',0,'active',1,'$2a$10$rJp97U4Q/z.v6e15AVQahu0FwCvblfmAhF.952r2WWTdYWvOr0Joa',NULL,NULL,NULL,2,'2014-09-30 13:53:23','2014-09-30 13:50:13','198.99.128.102','198.99.128.102','User',0,'2014-09-29 15:52:39','2014-09-30 13:56:18','Dean','Smith','',NULL,NULL),
	(247,'sweeks@harris.com','',0,'license',0,'$2a$10$2NldpU3UfdZ0rPlIsCPc8e/lcWe2fIyJPeOUdUdftPNBFiYPre7j.',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-09-29 15:53:23','2014-09-29 15:53:23','Shaun','Weeks','',NULL,NULL),
	(249,'nmcclure@harris.com','',0,'license',0,'$2a$10$.PLdVQtdIqfIrZZ9h9hA0eBFB8SEQy/gE5066hamE.8eZZ1tQ2bwW',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-09-29 15:54:40','2014-09-29 15:54:40','Nathan','McClure','',NULL,NULL),
	(250,'mmellors@harris.com','',0,'license',0,'$2a$10$BYjfAP/RRwKamXktQjc3guOOZGVNjmnwhDDU0BnwtEVWmef6TGNpm',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-09-29 15:55:18','2014-09-29 15:55:18','Michael','Mellors','',NULL,NULL),
	(251,'sremp@harris.com','',0,'license',0,'$2a$10$N78afCdqnYH/V.jaYmjTd.nSLeRcQbVb6PDkfKRrQxZojxB7Y9wSe',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-09-29 15:56:02','2014-09-29 15:56:02','Samuel','Remp','',NULL,NULL),
	(252,'acamm@harris.com','',0,'active',1,'$2a$10$bgT7hbMOd8neVsXk6WIAWetpBgvYzcLo/KHqEhsBNLVtu/uJSxHxC',NULL,NULL,NULL,2,'2014-12-22 21:20:16','2014-10-14 15:23:04','198.99.128.100','198.99.128.102','User',0,'2014-09-29 15:56:41','2014-12-22 21:21:07','Andrew','Camm','',NULL,NULL),
	(253,'jgrigoni@harris.com','',0,'license',0,'$2a$10$0LAZKCyD//zI5j6wSHYNA.numSKYwjHbUjkheHWOWgInLHB4TMVmW',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-09-29 15:57:16','2014-09-29 15:57:16','Justin','Grigonis','',NULL,NULL),
	(254,'cdavis07@harris.com','',0,'active',1,'$2a$10$ZCqr2oWun.Fdv53lAlSBbu7CXmUr.cbNy1GsLFii8ZB4KRhrvrnKG',NULL,NULL,NULL,1,'2014-10-01 19:53:49','2014-10-01 19:53:49','198.99.128.100','','User',0,'2014-10-01 19:52:48','2014-10-01 19:57:32','Charles','Davis','H.',NULL,NULL),
	(255,'emymeagan@gmail.com','',0,'active',1,'$2a$10$qRti2NK0DWyR9PAD5a9Ti.0jX9fyiURXysLwcBP1N/bT8eSkYJz2i',NULL,NULL,NULL,15,'2015-03-26 20:22:09','2015-03-26 18:10:08','213.138.82.49','213.138.82.49','Manager',0,'2014-10-01 20:38:57','2015-03-26 20:22:09','emily','rubio','',NULL,NULL),
	(256,'aerubio7@gmail.com','',0,'active',1,'$2a$10$i/6NZcwRXZeRM4cjE6bgjOOHyF126F0yp3KG2.qnw3PJIYiTlTWWi',NULL,NULL,NULL,1,'2014-10-01 20:56:33','2014-10-01 20:56:33','50.175.91.216','','User',0,'2014-10-01 20:56:16','2014-10-01 20:57:14','em','rubio','',NULL,NULL),
	(257,'bodil.walker@pro-linkglobal.com','',0,'active',1,'$2a$10$.fmADAXXByRRruD6hoUYP.1DwJ6ggnpvWl9iFng9OE3mMbAxgHPky','VgX2XvK5T6CDSDbmQ9rM',NULL,NULL,1,'2015-03-05 17:30:41','2015-03-05 17:30:41','199.59.81.228','','User',0,'2014-11-11 18:11:29','2015-03-05 17:49:21','Bodil','Walker','',NULL,NULL),
	(258,'kirsten.berlan@pro-linkglobal.com','',0,'license',0,'$2a$10$SKr92.xe9fG14ntrvfRIMO8XPx8jHNtXQBjFme2nPdgtExyrvqIjW',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2014-11-11 18:12:13','2014-11-11 18:12:13','Kirsten','Berlan','',NULL,NULL),
	(259,'carrie.getsinger@passporthealthusa.com','',0,'license',0,'$2a$10$RM6TGWybB.XcKeHlZ0b10OoeKbEBgkgD5fH40ah2nRICK.z6jy03q',NULL,NULL,NULL,1,'2014-12-02 15:10:33','2014-12-02 15:10:33','50.175.91.216','','Manager',0,'2014-11-14 16:25:34','2014-12-02 15:10:34','Carrie','Getsinger','',NULL,NULL),
	(260,'g2.xeno@gmail.com','',0,'license',0,'$2a$10$xqpFFXVAUnDiMby85oINyuAZxfVnTaT5cnX9vseQEM7GuagFLhn5u',NULL,NULL,NULL,0,NULL,NULL,'','','User',0,'2015-03-27 12:37:23','2015-03-27 12:37:23','Test ','Account','',NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `versions`;

CREATE TABLE `versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL,
  `event` varchar(255) NOT NULL,
  `whodunnit` varchar(255) DEFAULT NULL,
  `object` text,
  `created_at` datetime DEFAULT NULL,
  `object_changes` text,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Дамп таблицы visa_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visa_entries`;

CREATE TABLE `visa_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) DEFAULT NULL,
  `entry_count` int(4) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `visa_entries` WRITE;
/*!40000 ALTER TABLE `visa_entries` DISABLE KEYS */;

INSERT INTO `visa_entries` (`id`, `name_en`, `entry_count`, `code`)
VALUES
	(1,'Single',1,'single'),
	(2,'Double',2,'double'),
	(3,'Multiple',NULL,'multiple');

/*!40000 ALTER TABLE `visa_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы visas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visas`;

CREATE TABLE `visas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `country_id` int(11) unsigned DEFAULT NULL,
  `purpose_id` int(11) unsigned DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `scan` varchar(100) DEFAULT NULL,
  `visa_entry_id` int(11) unsigned DEFAULT NULL,
  `is_certified` tinyint(1) DEFAULT '0',
  `verified_admin_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `expires_on` date DEFAULT NULL,
  `verified_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_fk` (`user_id`),
  KEY `visa_types_fk` (`purpose_id`),
  KEY `visas_verified_admin_id_fk` (`verified_admin_id`),
  KEY `visas_country_id_fk` (`country_id`),
  KEY `visas_visa_entry_id_fk` (`visa_entry_id`),
  CONSTRAINT `visas_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `visas_purpose_id_fk` FOREIGN KEY (`purpose_id`) REFERENCES `purposes` (`id`),
  CONSTRAINT `visas_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `visas_verified_admin_id_fk` FOREIGN KEY (`verified_admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `visas_visa_entry_id_fk` FOREIGN KEY (`visa_entry_id`) REFERENCES `visa_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `visas` WRITE;
/*!40000 ALTER TABLE `visas` DISABLE KEYS */;

INSERT INTO `visas` (`id`, `user_id`, `country_id`, `purpose_id`, `number`, `scan`, `visa_entry_id`, `is_certified`, `verified_admin_id`, `created_at`, `updated_at`, `valid_from`, `expires_on`, `verified_date`)
VALUES
	(81,7,251,2,'56346675687568gfxch','',1,1,60,'2014-07-04 13:37:33','2014-07-04 13:37:38','2013-04-04','2013-04-14','2013-09-18'),
	(126,60,48,1,'Abcd55373hjhT57690j','',3,1,60,'2014-07-04 13:37:33','2014-07-04 13:37:38','2013-07-02','2013-12-25','2013-07-11'),
	(129,7,250,1,'5463467436346346','',1,1,11,'2014-07-04 13:37:33','2014-07-04 13:37:38','2013-07-18','2013-07-28','2013-11-06'),
	(131,60,112,1,'sfsd8f76sd8f6s78d6f7s65f','',1,1,NULL,'2014-07-04 13:37:33','2014-07-04 13:37:38','2013-07-23','2013-12-31','1970-01-01'),
	(132,60,3,1,'dxfgdxsfxsdcvx','',1,1,60,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-07-01','2014-09-17','2013-08-22'),
	(134,9,48,1,'123456789','',3,1,9,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-08-07','2014-08-06','2013-08-29'),
	(143,168,48,1,'78654765400989877867656','',3,1,60,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-08-01','2013-12-31','2013-10-01'),
	(144,169,48,1,'sdlfjkhasdfiuyh34','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-10-02','2014-10-02','1970-01-01'),
	(148,171,259,1,'sjkdhfsdkjhfsdjfkhs','1380737844_1ZBjYO4a.jpg',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-09-01','2014-10-01','1970-01-01'),
	(149,189,112,1,'fkfaskljhfsfsf','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-12','2014-12-12','1970-01-01'),
	(150,189,112,1,'A56983434','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-12','2014-12-12','1970-01-01'),
	(151,189,112,1,'1235466841','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-12','2014-12-12','1970-01-01'),
	(152,189,112,1,'123456564','',1,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-10','2014-12-12','1970-01-01'),
	(153,189,48,1,'1236547','',1,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-10','2014-12-12','1970-01-01'),
	(154,189,32,1,'918488','',1,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-01','2013-12-22','1970-01-01'),
	(155,189,32,1,'V/918488','',1,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-01','2013-12-22','1970-01-01'),
	(159,9,112,1,'7345809345345','',1,1,9,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-12-17','2014-12-17','2014-02-11'),
	(169,210,57,1,'dgdsfgdfgdfgdfgdfgdfg','',3,1,60,'2014-07-04 13:37:34','2014-07-04 13:37:38','2013-01-31','2014-12-24','2014-01-08'),
	(170,212,57,1,'sdfsdfsdfs44f44f4f4f4f4f','',1,1,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-01-01','2014-08-31','1970-01-01'),
	(173,208,3,1,'FNEI4798804354','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-01-09','2015-01-09','1970-01-01'),
	(174,208,48,1,'984752352343','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-01-09','2015-01-09','1970-01-01'),
	(175,212,48,1,'123456784','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-01-14','2015-01-14','1970-01-01'),
	(176,213,251,1,'20122192440006','1389770393_9ydrYRFo.jpg',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2012-08-07','2022-08-05','1970-01-01'),
	(184,11,70,4,'fhy5','1391210323_um8syT48.jpg',2,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-01-17','2014-02-10','1970-01-01'),
	(187,209,32,1,'1136457','',3,0,NULL,'2014-07-04 13:37:34','2014-07-04 13:37:38','2014-02-21','2014-03-03','1970-01-01'),
	(188,244,4,1,'01556/2014',NULL,3,0,NULL,'2014-10-01 17:24:25','2014-10-01 17:24:25','2014-10-01','2015-01-01',NULL),
	(189,256,32,1,'213215132','Lenovo_Jetpack_-_Original.jpg',2,0,NULL,'2014-10-01 21:32:23','2014-10-01 21:32:23','2014-10-01','2014-11-28',NULL),
	(190,256,32,1,'564612','Lenovo_Jetpack_-_Original.jpg',3,0,NULL,'2014-10-01 21:33:50','2014-10-01 21:33:50','2014-10-01','2014-11-29',NULL),
	(191,256,224,4,'3240923dlskd','Lenovo_Jetpack_Free_Form_Snip.jpg',3,0,NULL,'2014-10-01 21:47:13','2014-10-01 21:48:40','2014-11-07','2015-03-27',NULL),
	(192,11,10,4,'fsdfsdfsdf','Egnyte_Syncing_Pic.jpg',3,1,NULL,'2014-11-11 17:19:37','2014-11-11 17:21:14','2014-11-11','2014-11-14',NULL),
	(193,11,11,3,'234635432',NULL,1,0,NULL,'2014-11-11 17:49:07','2014-11-11 17:49:07','2014-11-11','2016-11-10',NULL);

/*!40000 ALTER TABLE `visas` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
