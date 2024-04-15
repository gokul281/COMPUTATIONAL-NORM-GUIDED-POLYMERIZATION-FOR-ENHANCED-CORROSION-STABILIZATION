-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.45-community - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for antcor
CREATE DATABASE IF NOT EXISTS `antcor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `antcor`;

-- Dumping structure for table antcor.client
CREATE TABLE IF NOT EXISTS `client` (
  `Client_ID` varchar(50) DEFAULT NULL,
  `Order_ID` varchar(50) DEFAULT NULL,
  `SD` varchar(50) DEFAULT NULL,
  `CD` varchar(50) DEFAULT NULL,
  `PD` varchar(50) DEFAULT NULL,
  `ID` varchar(50) DEFAULT NULL,
  `CR` varchar(50) DEFAULT NULL,
  `TS` varchar(50) DEFAULT NULL,
  `EB` varchar(50) DEFAULT NULL,
  `TR` varchar(50) DEFAULT NULL,
  `pay_amount` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.coat_anti
CREATE TABLE IF NOT EXISTS `coat_anti` (
  `Material_Type` varchar(50) DEFAULT NULL,
  `Environment` varchar(50) DEFAULT NULL,
  `Exposure_Time` varchar(50) DEFAULT NULL,
  `Temperature` varchar(50) DEFAULT NULL,
  `Relative_Humidity` varchar(50) DEFAULT NULL,
  `pH` varchar(50) DEFAULT NULL,
  `Corrosion_Rate` varchar(50) DEFAULT NULL,
  `Recommended_Coating_Material` varchar(50) DEFAULT NULL,
  `Coating_Level` varchar(50) DEFAULT NULL,
  `Environmental_Factors` varchar(50) DEFAULT NULL,
  `Polymer_Volume` varchar(50) DEFAULT NULL,
  `Coating_Thickness` varchar(50) DEFAULT NULL,
  `Surface_Area` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.coat_rep
CREATE TABLE IF NOT EXISTS `coat_rep` (
  `Material_Type` varchar(255) DEFAULT NULL,
  `Environment` varchar(255) DEFAULT NULL,
  `Exposure_Time` varchar(50) DEFAULT NULL,
  `Temperature` varchar(50) DEFAULT NULL,
  `Relative_Humidity` varchar(50) DEFAULT NULL,
  `pH` varchar(50) DEFAULT NULL,
  `Corrosion_Rate` varchar(50) DEFAULT NULL,
  `Recommended_Coating_Material` varchar(255) DEFAULT NULL,
  `Coating_Level` varchar(255) DEFAULT NULL,
  `Environmental_Factors` varchar(50) DEFAULT NULL,
  `Surface_Area` varchar(50) DEFAULT NULL,
  `Polymer_Volume` varchar(50) DEFAULT NULL,
  `Coating_Thickness` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.env_anti
CREATE TABLE IF NOT EXISTS `env_anti` (
  `Location` varchar(50) DEFAULT NULL,
  `Exposure_Time` varchar(50) DEFAULT NULL,
  `Temperature` varchar(50) DEFAULT NULL,
  `Relative_Humidity` varchar(50) DEFAULT NULL,
  `pH` varchar(50) DEFAULT NULL,
  `Corrosion_Rate` varchar(50) DEFAULT NULL,
  `Environmental_Factors` varchar(50) DEFAULT NULL,
  `Recommended_Polymer_Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.env_rep
CREATE TABLE IF NOT EXISTS `env_rep` (
  `Location` varchar(255) DEFAULT NULL,
  `Exposure_Time` varchar(255) DEFAULT NULL,
  `Temperature` varchar(255) DEFAULT NULL,
  `Relative_Humidity` varchar(255) DEFAULT NULL,
  `pH` varchar(255) DEFAULT NULL,
  `Corrosion_Rate` varchar(255) DEFAULT NULL,
  `Environmental_Factors` varchar(255) DEFAULT NULL,
  `Recommended_Polymer_Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.login
CREATE TABLE IF NOT EXISTS `login` (
  `name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `ConName` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `Indus` varchar(50) DEFAULT NULL,
  `ClientID` varchar(50) DEFAULT NULL,
  `comurl` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.main_insp
CREATE TABLE IF NOT EXISTS `main_insp` (
  `Polymer_Type` varchar(50) DEFAULT NULL,
  `Material_Composition` varchar(50) DEFAULT NULL,
  `Density` varchar(50) DEFAULT NULL,
  `Tensile_Strength` varchar(50) DEFAULT NULL,
  `Elongation_at_Break` varchar(50) DEFAULT NULL,
  `Hardness` varchar(50) DEFAULT NULL,
  `Corrosion_Resistance` varchar(50) DEFAULT NULL,
  `Corrosion_Rate` varchar(50) DEFAULT NULL,
  `Corrosion_Test_Results` varchar(50) DEFAULT NULL,
  `Humidity` varchar(50) DEFAULT NULL,
  `Temperature` varchar(50) DEFAULT NULL,
  `Inspection_Method` varchar(50) DEFAULT NULL,
  `Inspection_Results` varchar(50) DEFAULT NULL,
  `Maintenance_Actions` varchar(50) DEFAULT NULL,
  `Service_Life_Years` varchar(50) DEFAULT NULL,
  `Exposure_to_Chemicals` varchar(50) DEFAULT NULL,
  `Safety_Ratings` varchar(50) DEFAULT NULL,
  `Type_of_Damage` varchar(50) DEFAULT NULL,
  `Extent_of_Damage` varchar(50) DEFAULT NULL,
  `Coating_Type` varchar(50) DEFAULT NULL,
  `Coating_Thickness` varchar(50) DEFAULT NULL,
  `Coating_Condition` varchar(50) DEFAULT NULL,
  `Environmental_Regulations` varchar(50) DEFAULT NULL,
  `Im_sug` varchar(50) DEFAULT NULL,
  `Sustainability_Metrics` varchar(50) DEFAULT NULL,
  `Inhibitor_Type` varchar(50) DEFAULT NULL,
  `Inhibitor_Concen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.main_rep
CREATE TABLE IF NOT EXISTS `main_rep` (
  `Polymer_Type` varchar(255) DEFAULT NULL,
  `Material_Composition` varchar(255) DEFAULT NULL,
  `Density` varchar(255) DEFAULT NULL,
  `Tensile_Strength` varchar(255) DEFAULT NULL,
  `Elongation_at_Break` varchar(255) DEFAULT NULL,
  `Hardness` varchar(255) DEFAULT NULL,
  `Corrosion_Resistance` varchar(255) DEFAULT NULL,
  `Corrosion_Rate` varchar(50) DEFAULT NULL,
  `Corrosion_Test_Results` varchar(255) DEFAULT NULL,
  `Temperature` varchar(255) DEFAULT NULL,
  `Humidity` varchar(255) DEFAULT NULL,
  `Inspection_Method` varchar(255) DEFAULT NULL,
  `Inspection_Results` varchar(255) DEFAULT NULL,
  `Maintenance_Actions` varchar(255) DEFAULT NULL,
  `Safety_Ratings` varchar(255) DEFAULT NULL,
  `Service_Life_Years` varchar(255) DEFAULT NULL,
  `Exposure_to_Chemicals` varchar(255) DEFAULT NULL,
  `Type_of_Damage` varchar(255) DEFAULT NULL,
  `Extent_of_Damage` varchar(255) DEFAULT NULL,
  `Coating_Type` varchar(255) DEFAULT NULL,
  `Coating_Thickness` varchar(255) DEFAULT NULL,
  `Coating_Condition` varchar(255) DEFAULT NULL,
  `Enviromental_Regulation` varchar(255) DEFAULT NULL,
  `Improvement_Suggestions` varchar(255) DEFAULT NULL,
  `Sustainability_Metrics` varchar(255) DEFAULT NULL,
  `Inhibitor_Type` varchar(255) DEFAULT NULL,
  `Inhibitor_Concentration` varchar(255) DEFAULT NULL,
  `Client_ID` varchar(50) DEFAULT NULL,
  `Order_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table antcor.ord_pay
CREATE TABLE IF NOT EXISTS `ord_pay` (
  `Client_ID` varchar(50) DEFAULT NULL,
  `Order_ID` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `CardName` varchar(50) DEFAULT NULL,
  `CardNum` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `t_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
