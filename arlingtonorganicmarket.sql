-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2025 at 08:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arlingtonorganicmarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cId` int(11) NOT NULL,
  `Cname` varchar(50) DEFAULT NULL,
  `LoyaltyScore` int(11) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cId`, `Cname`, `LoyaltyScore`, `Street`, `City`, `StateAb`, `ZipCode`) VALUES
(1, 'Crystal Gonzalez', 3, '2300 Green Oaks Blvd', 'Fort Worth', 'TX', '76015'),
(2, 'John Gutierrez', 2, '3900 S Bowen Rd', 'Bedford', 'TX', '76011'),
(3, 'Kimberly Forbes', 0, '2300 Green Oaks Blvd', 'Grand Prairie', 'TX', '76013'),
(4, 'Melody Schultz', 2, '3100 E Pioneer Pkwy', 'Bedford', 'TX', '76015'),
(5, 'Jenny Stewart', 3, '2500 E Abram St', 'Grand Prairie', 'TX', '76014'),
(6, 'Ronald Greer', 2, '3100 E Pioneer Pkwy', 'Grand Prairie', 'TX', '76002'),
(7, 'Timothy Underwood', 0, '900 N Watson Rd', 'Irving', 'TX', '76010'),
(8, 'Matthew Lindsey', 4, '1501 N Collins St', 'Hurst', 'TX', '76012'),
(9, 'Lori Johnson', 1, '1501 N Collins St', 'Grand Prairie', 'TX', '76015'),
(10, 'Jennifer Singleton', 2, '1501 N Collins St', 'Arlington', 'TX', '76013'),
(11, 'Maria Chavez', 3, '700 W Randol Mill Rd', 'Fort Worth', 'TX', '76017'),
(12, 'Gary Mitchell', 5, '4500 Matlock Rd', 'Irving', 'TX', '76014'),
(13, 'Stephanie Sanchez', 2, '1200 S Fielder Rd', 'Bedford', 'TX', '76016'),
(14, 'Kimberly Lewis', 3, '2800 W Park Row Dr', 'Bedford', 'TX', '76001'),
(15, 'Benjamin Vargas', 0, '2800 W Park Row Dr', 'Irving', 'TX', '76013'),
(16, 'Elizabeth Drake MD', 1, '2800 W Park Row Dr', 'Bedford', 'TX', '76006'),
(17, 'Nancy Smith', 3, '1200 S Fielder Rd', 'Hurst', 'TX', '76013'),
(18, 'Kara Armstrong', 3, '2800 W Park Row Dr', 'Euless', 'TX', '76013'),
(19, 'Susan Martin', 5, '2800 W Park Row Dr', 'Hurst', 'TX', '76015'),
(20, 'Kristen Gutierrez', 1, '4500 Matlock Rd', 'Irving', 'TX', '76014'),
(21, 'Jessica Hull', 5, '3900 S Bowen Rd', 'Grand Prairie', 'TX', '76002'),
(22, 'Brittany Ross', 1, '1200 S Fielder Rd', 'Irving', 'TX', '76010'),
(23, 'Sheila Davis', 1, '900 N Watson Rd', 'Euless', 'TX', '76010'),
(24, 'Kelsey Kelly', 2, '3100 E Pioneer Pkwy', 'Grand Prairie', 'TX', '76017'),
(25, 'David Baker', 1, '900 N Watson Rd', 'Bedford', 'TX', '76015'),
(26, 'Amanda Bell', 0, '4500 Matlock Rd', 'Mansfield', 'TX', '76014'),
(27, 'Allison Franklin', 3, '3100 E Pioneer Pkwy', 'Mansfield', 'TX', '76010'),
(28, 'Katelyn Lewis', 3, '3100 E Pioneer Pkwy', 'Bedford', 'TX', '76011'),
(29, 'Veronica Taylor', 0, '1200 S Fielder Rd', 'Hurst', 'TX', '76015'),
(30, 'John Huang', 1, '2500 E Abram St', 'Grand Prairie', 'TX', '76013'),
(31, 'Jose Stewart', 1, '900 N Watson Rd', 'Mansfield', 'TX', '76013'),
(32, 'Rebecca Smith', 1, '1501 N Collins St', 'Hurst', 'TX', '76015'),
(33, 'Jason Ochoa', 2, '3900 S Bowen Rd', 'Hurst', 'TX', '76002'),
(34, 'Miranda Hicks', 1, '700 W Randol Mill Rd', 'Bedford', 'TX', '76010'),
(35, 'James Griffin', 1, '700 W Randol Mill Rd', 'Mansfield', 'TX', '76012'),
(36, 'David Mendez', 1, '2300 Green Oaks Blvd', 'Grand Prairie', 'TX', '76011'),
(37, 'David Mcmahon', 4, '1501 N Collins St', 'Euless', 'TX', '76002'),
(38, 'Joseph Ryan', 3, '900 N Watson Rd', 'Grand Prairie', 'TX', '76016'),
(39, 'Kathryn Espinoza', 2, '1501 N Collins St', 'Fort Worth', 'TX', '76001'),
(40, 'Barbara Ray', 2, '4500 Matlock Rd', 'Grand Prairie', 'TX', '76015'),
(41, 'Kristen Evans', 0, '2300 Green Oaks Blvd', 'Arlington', 'TX', '76006'),
(42, 'Lori Dixon', 5, '2300 Green Oaks Blvd', 'Hurst', 'TX', '76012'),
(43, 'Nicholas Gonzalez', 1, '900 N Watson Rd', 'Arlington', 'TX', '76010'),
(44, 'Tammy Clarke', 1, '3100 E Pioneer Pkwy', 'Grand Prairie', 'TX', '76013'),
(45, 'Eric Garcia', 2, '1501 N Collins St', 'Euless', 'TX', '76012'),
(46, 'Leonard Lopez', 4, '4500 Matlock Rd', 'Hurst', 'TX', '76001'),
(47, 'Crystal Turner', 1, '1200 S Fielder Rd', 'Grand Prairie', 'TX', '76014'),
(48, 'Leslie Jones', 1, '700 W Randol Mill Rd', 'Fort Worth', 'TX', '76010'),
(49, 'Isaiah Fernandez', 2, '1501 N Collins St', 'Grand Prairie', 'TX', '76014'),
(50, 'Leroy Neal', 3, '4500 Matlock Rd', 'Arlington', 'TX', '76001');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` char(11) NOT NULL,
  `sId` int(11) DEFAULT NULL,
  `Ename` varchar(50) DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Edate` date DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `Etype` varchar(9) DEFAULT NULL,
  `Level` varchar(6) DEFAULT NULL,
  `Asalary` decimal(20,2) DEFAULT NULL,
  `Hsalary` decimal(20,2) DEFAULT NULL,
  `Agency` varchar(50) DEFAULT NULL,
  `Institute` varchar(50) DEFAULT NULL,
  `Itype` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `sId`, `Ename`, `Sdate`, `Edate`, `Bdate`, `Street`, `City`, `StateAb`, `ZipCode`, `Etype`, `Level`, `Asalary`, `Hsalary`, `Agency`, `Institute`, `Itype`) VALUES
('006-75-4120', 1, 'Kristina Grant', '2022-02-09', NULL, '1972-01-19', '344 John Ramp Apt. 238', 'Fort Worth', 'TX', '76011', 'Fulltime', 'Junior', 85197.92, 0.00, '', '', ''),
('015-85-3394', 1, 'Alexis Rodriguez', '2022-03-14', '2022-08-14', '1969-10-12', '906 Jessica Hill', 'Arlington', 'TX', '76006', 'Intern', '', 0.00, 0.00, '', 'Brown, Young and White', 'School'),
('084-52-8509', 1, 'James Gonzalez', '2023-02-15', NULL, '1979-06-18', '155 Tracey Square Apt. 325', 'Mansfield', 'TX', '76012', 'Fulltime', 'Junior', 71733.97, 0.00, '', '', ''),
('143-88-5170', 1, 'Wendy Perez', '2023-08-10', '2025-05-10', '1979-06-21', '489 Davis Hollow', 'Mansfield', 'TX', '76015', 'Temporary', '', 0.00, 49.23, 'Fletcher LLC', '', ''),
('155-39-6650', 1, 'Matthew Contreras', '2023-11-25', '2027-06-25', '1992-12-21', '245 Heather Cape', 'Hurst', 'TX', '76011', 'Temporary', '', 0.00, 22.54, 'Thompson-Horton', '', ''),
('172-23-6405', 1, 'Garrett Anderson', '2023-09-30', NULL, '1996-04-10', '134 Gonzalez Stravenue', 'Bedford', 'TX', '76013', 'Fulltime', 'Senior', 67114.66, 0.00, '', '', ''),
('177-52-5682', 1, 'Dennis Holland', '2023-05-21', NULL, '1999-07-16', '198 Mcdonald Springs Apt. 883', 'Hurst', 'TX', '76010', 'Fulltime', 'Senior', 69819.85, 0.00, '', '', ''),
('215-62-6178', 1, 'Martin Mills', '2023-04-14', '2025-04-14', '1964-02-10', '4420 Ellison Stream Suite 904', 'Hurst', 'TX', '76012', 'Intern', '', 0.00, 0.00, '', 'University of texas at Arlington', 'University'),
('311-08-5461', 1, 'Laura Bailey', '2023-10-17', '2025-04-17', '1995-01-31', '92698 Connie Rapids', 'Fort Worth', 'TX', '76012', 'Intern', '', 0.00, 0.00, '', 'Hall, Freeman and Phillips', 'School'),
('365-60-3855', 1, 'Maria Johnson', '2023-01-19', NULL, '1989-03-24', '963 Sarah Flats Suite 288', 'Fort Worth', 'TX', '76011', 'Fulltime', 'Senior', 85554.32, 0.00, '', '', ''),
('394-54-5633', 1, 'Rebecca Garza', '2023-05-25', NULL, '1982-09-27', '9738 Patterson Station', 'Irving', 'TX', '76017', 'Fulltime', 'Senior', 66254.87, 0.00, '', '', ''),
('421-96-9653', 1, 'Ian Ellis', '2022-08-19', NULL, '1972-11-07', '660 Christopher Prairie', 'Irving', 'TX', '76002', 'Fulltime', 'Senior', 99561.36, 0.00, '', '', ''),
('532-58-8449', 1, 'Regina Hopkins', '2023-12-13', '2025-11-13', '1969-10-02', '56604 Johnson Shore Apt. 876', 'Bedford', 'TX', '76006', 'Intern', '', 0.00, 0.00, '', 'University of texas at Arlington', 'University'),
('594-63-1355', 1, 'Tracy Jimenez', '2022-12-27', '2023-10-27', '2000-09-08', '0393 Adam Village', 'Hurst', 'TX', '76001', 'Intern', '', 0.00, 0.00, '', 'University of texas at Arlington', 'University'),
('627-97-6201', 1, 'John Martin', '2023-01-27', '2024-11-27', '1966-10-21', '08606 Lopez Springs Apt. 293', 'Grand Prairie', 'TX', '76015', 'Intern', '', 0.00, 0.00, '', 'Hall, Freeman and Phillips', 'School'),
('706-05-0756', 1, 'Donna Davis', '2022-07-16', '2024-03-16', '1966-03-19', '05244 Lisa Drive Suite 481', 'Hurst', 'TX', '76011', 'Intern', '', 0.00, 0.00, '', 'University of texas at Arlington', 'University'),
('708-50-0584', 1, 'Alice Brown', '2023-09-25', '2025-04-25', '1981-03-07', '302 Melissa Locks', 'Bedford', 'TX', '76001', 'Intern', '', 0.00, 0.00, '', 'Brown, Young and White', 'School'),
('729-45-0286', 1, 'Daniel Acosta', '2023-05-12', '2024-08-12', '1998-07-15', '763 Robertson Walks Apt. 655', 'Hurst', 'TX', '76006', 'Temporary', '', 0.00, 16.29, 'Norton Group', '', ''),
('732-54-9036', 1, 'Elizabeth Hansen', '2022-12-31', '2025-07-31', '1978-01-28', '7295 Charlotte Fork Suite 338', 'Mansfield', 'TX', '76011', 'Intern', '', 0.00, 0.00, '', 'Hall, Freeman and Phillips', 'School'),
('775-07-5021', 1, 'Teresa Robles', '2023-02-25', NULL, '1991-06-14', '2472 Valenzuela Locks', 'Arlington', 'TX', '76012', 'Fulltime', 'Senior', 99820.23, 0.00, '', '', ''),
('782-46-3486', 1, 'Laura Becker', '2022-03-29', '2023-08-29', '1995-01-02', '05608 Thomas Mountain', 'Euless', 'TX', '76001', 'Temporary', '', 0.00, 39.73, 'Anthony Ltd', '', ''),
('783-58-1349', 1, 'Amanda Ramirez', '2022-12-29', '2024-05-29', '1992-11-05', '66854 Victoria Island', 'Arlington', 'TX', '76002', 'Intern', '', 0.00, 0.00, '', 'Brown, Young and White', 'School'),
('789-51-1421', 1, 'Erik Romero', '2023-12-24', '2025-04-24', '1982-02-05', '013 Mary Locks Apt. 097', 'Mansfield', 'TX', '76013', 'Temporary', '', 0.00, 16.97, 'Johnston-Osborne', '', ''),
('840-67-4948', 1, 'Cynthia Mendoza', '2022-02-19', NULL, '1972-03-27', '2004 Thompson Row Apt. 728', 'Irving', 'TX', '76014', 'Fulltime', 'Junior', 93556.24, 0.00, '', '', ''),
('877-14-1786', 1, 'Lisa Reynolds', '2022-09-26', '2023-11-26', '1971-06-07', '7165 Hall River Suite 156', 'Mansfield', 'TX', '76011', 'Intern', '', 0.00, 0.00, '', 'Brown, Young and White', 'School');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `iId` int(11) NOT NULL,
  `Iname` varchar(50) DEFAULT NULL,
  `Sprice` decimal(20,2) DEFAULT NULL,
  `Category` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`iId`, `Iname`, `Sprice`, `Category`) VALUES
(1, 'Almonds', 12.23, 'Nuts'),
(2, 'Walnuts', 9.03, 'Nuts'),
(3, 'Cashews', 14.77, 'Nuts'),
(4, 'Pistachios', 13.57, 'Nuts'),
(5, 'Peanuts', 11.40, 'Nuts'),
(6, 'Hazelnuts', 13.77, 'Nuts'),
(7, 'Apples', 2.06, 'Fruits'),
(8, 'Bananas', 3.58, 'Fruits'),
(9, 'Blueberries', 6.84, 'Fruits'),
(10, 'Oranges', 6.23, 'Fruits'),
(11, 'Strawberries', 5.00, 'Fruits'),
(12, 'Grapes', 3.09, 'Fruits'),
(13, 'Alfalfa Sprouts', 5.05, 'Sprouts'),
(14, 'Broccoli Sprouts', 7.00, 'Sprouts'),
(15, 'Lentil Sprouts', 8.14, 'Sprouts'),
(16, 'Pea Shoots', 6.43, 'Sprouts');

-- --------------------------------------------------------

--
-- Table structure for table `oldprice`
--

CREATE TABLE `oldprice` (
  `iId` int(11) NOT NULL,
  `oId` int(11) NOT NULL,
  `Sprice` decimal(20,2) DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Edate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oldprice`
--

INSERT INTO `oldprice` (`iId`, `oId`, `Sprice`, `Sdate`, `Edate`) VALUES
(1, 1, 13.06, '2024-06-09', '2024-10-14'),
(1, 2, 12.15, '2024-12-03', '2025-03-01'),
(1, 3, 12.81, '2025-05-20', '2025-10-16'),
(2, 4, 8.10, '2023-04-07', '2023-09-06'),
(2, 5, 7.45, '2023-09-30', '2023-12-10'),
(2, 6, 10.33, '2024-04-05', '2024-07-25'),
(3, 7, 14.11, '2023-08-28', '2024-02-07'),
(3, 8, 15.64, '2023-12-31', '2024-05-30'),
(3, 9, 15.50, '2024-03-31', '2024-05-26'),
(4, 10, 11.81, '2023-08-12', '2023-11-08'),
(4, 11, 14.15, '2024-01-29', '2024-04-08'),
(4, 12, 13.09, '2024-06-09', '2024-10-23'),
(5, 13, 12.36, '2023-04-05', '2023-07-03'),
(5, 14, 12.48, '2023-07-20', '2023-09-03'),
(5, 15, 12.00, '2024-02-22', '2024-07-02'),
(6, 16, 15.26, '2023-07-17', '2023-09-28'),
(6, 17, 15.71, '2024-01-05', '2024-06-12'),
(6, 18, 14.09, '2024-07-13', '2024-09-10'),
(7, 19, 3.17, '2023-04-08', '2023-08-03'),
(7, 20, 2.48, '2023-11-15', '2024-01-19'),
(7, 21, 0.59, '2024-07-03', '2024-10-31'),
(8, 22, 4.56, '2023-08-17', '2023-10-26'),
(8, 23, 3.01, '2023-11-20', '2024-05-05'),
(8, 24, 5.42, '2024-05-20', '2024-07-22'),
(9, 25, 5.56, '2023-12-14', '2024-04-07'),
(9, 26, 8.19, '2024-04-01', '2024-06-23'),
(9, 27, 8.53, '2024-11-02', '2025-01-29'),
(10, 28, 6.10, '2024-03-07', '2024-05-06'),
(10, 29, 6.38, '2024-06-22', '2024-11-19'),
(10, 30, 7.85, '2024-11-30', '2025-03-21'),
(11, 31, 4.94, '2023-01-31', '2023-03-02'),
(11, 32, 5.68, '2023-05-24', '2023-10-08'),
(11, 33, 6.56, '2023-07-26', '2024-01-08'),
(12, 34, 1.72, '2023-08-13', '2024-02-06'),
(12, 35, 3.25, '2024-03-29', '2024-05-05'),
(12, 36, 5.02, '2024-09-30', '2024-11-04'),
(13, 37, 4.19, '2023-04-08', '2023-05-29'),
(13, 38, 6.57, '2023-08-26', '2023-12-15'),
(13, 39, 5.29, '2023-10-28', '2024-03-14'),
(14, 40, 7.24, '2023-08-27', '2023-10-09'),
(14, 41, 8.54, '2024-03-18', '2024-05-11'),
(14, 42, 7.83, '2024-06-22', '2024-10-09'),
(15, 43, 6.21, '2023-08-01', '2023-10-24'),
(15, 44, 9.53, '2024-02-07', '2024-05-20'),
(15, 45, 9.05, '2024-07-05', '2024-11-02'),
(16, 46, 7.69, '2023-03-26', '2023-04-30'),
(16, 47, 6.68, '2023-08-22', '2024-02-16'),
(16, 48, 8.36, '2024-04-06', '2024-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `oId` int(11) NOT NULL,
  `Odate` date DEFAULT NULL,
  `Ddate` date DEFAULT NULL,
  `Amount` decimal(20,2) DEFAULT NULL,
  `cId` int(11) NOT NULL,
  `sId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`oId`, `Odate`, `Ddate`, `Amount`, `cId`, `sId`) VALUES
(1, '2024-05-29', '2024-06-04', 73.85, 12, 1),
(2, '2024-06-13', '2024-06-16', 30.30, 12, 1),
(3, '2024-03-14', '2024-03-19', 62.30, 21, 1),
(4, '2024-08-02', '2024-08-05', 59.08, 1, 1),
(5, '2024-02-16', '2024-02-19', 61.56, 4, 1),
(6, '2024-06-20', '2024-06-26', 15.15, 28, 1),
(7, '2024-07-23', '2024-07-30', 8.14, 1, 1),
(8, '2024-08-27', '2024-09-02', 41.04, 38, 1),
(9, '2025-01-05', '2025-01-10', 54.18, 14, 1),
(10, '2024-02-15', '2024-02-17', 28.64, 19, 1),
(11, '2024-02-08', '2024-02-12', 43.61, 5, 1),
(12, '2024-09-20', '2024-09-24', 12.46, 16, 1),
(13, '2024-02-04', '2024-02-10', 36.12, 19, 1),
(14, '2024-04-30', '2024-05-06', 15.00, 4, 1),
(15, '2024-05-10', '2024-05-12', 12.36, 40, 1),
(16, '2024-09-24', '2024-09-28', 27.09, 11, 1),
(17, '2024-04-04', '2024-04-06', 35.00, 46, 1),
(18, '2024-05-30', '2024-06-05', 21.00, 32, 1),
(19, '2024-11-18', '2024-11-25', 20.52, 8, 1),
(20, '2024-01-24', '2024-01-30', 94.99, 27, 1),
(21, '2024-03-22', '2024-03-25', 13.57, 42, 1),
(22, '2024-11-23', '2024-11-27', 34.20, 5, 1),
(23, '2024-07-30', '2024-08-05', 10.30, 37, 1),
(24, '2024-08-30', '2024-09-05', 25.25, 42, 1),
(25, '2024-10-05', '2024-10-08', 56.98, 6, 1),
(26, '2024-06-18', '2024-06-21', 25.06, 24, 1),
(27, '2024-06-24', '2024-06-29', 35.80, 33, 1),
(28, '2024-10-10', '2024-10-16', 30.00, 22, 1),
(29, '2024-11-19', '2024-11-24', 25.25, 17, 1),
(30, '2024-01-28', '2024-02-04', 35.80, 20, 1),
(31, '2024-04-06', '2024-04-07', 102.60, 50, 1),
(32, '2024-09-18', '2024-09-23', 21.48, 14, 1),
(33, '2024-06-15', '2024-06-18', 73.85, 50, 1),
(34, '2024-07-19', '2024-07-26', 35.00, 44, 1),
(35, '2024-07-24', '2024-07-30', 12.36, 38, 1),
(36, '2024-10-08', '2024-10-12', 25.00, 10, 1),
(37, '2024-06-28', '2024-06-30', 43.61, 42, 1),
(38, '2024-07-10', '2024-07-17', 45.60, 12, 1),
(39, '2024-03-30', '2024-03-31', 2.06, 37, 1),
(40, '2024-11-24', '2024-11-29', 42.00, 8, 1),
(41, '2024-11-03', '2024-11-05', 56.98, 30, 1),
(42, '2024-03-02', '2024-03-04', 63.00, 47, 1),
(43, '2024-07-09', '2024-07-10', 9.27, 6, 1),
(44, '2024-11-08', '2024-11-11', 17.90, 12, 1),
(45, '2024-08-11', '2024-08-16', 5.05, 2, 1),
(46, '2024-02-24', '2024-03-01', 34.20, 28, 1),
(47, '2025-01-10', '2025-01-14', 20.52, 24, 1),
(48, '2024-06-29', '2024-07-05', 35.35, 21, 1),
(49, '2024-07-28', '2024-07-30', 132.93, 18, 1),
(50, '2024-08-07', '2024-08-12', 50.50, 18, 1),
(51, '2024-09-10', '2024-09-12', 34.20, 19, 1),
(52, '2024-02-10', '2024-02-16', 81.27, 43, 1),
(53, '2024-05-08', '2024-05-15', 51.44, 1, 1),
(54, '2024-06-22', '2024-06-25', 8.24, 19, 1),
(55, '2024-06-19', '2024-06-21', 6.43, 37, 1),
(56, '2024-03-22', '2024-03-29', 85.61, 23, 1),
(57, '2024-01-23', '2024-01-25', 50.50, 45, 1),
(58, '2024-12-30', '2025-01-06', 122.13, 42, 1),
(59, '2024-08-30', '2024-09-05', 54.72, 21, 1),
(60, '2024-12-02', '2024-12-04', 10.30, 14, 1),
(61, '2024-09-14', '2024-09-20', 50.50, 35, 1),
(62, '2024-10-27', '2024-11-03', 114.00, 21, 1),
(63, '2024-09-12', '2024-09-13', 54.72, 11, 1),
(64, '2024-02-22', '2024-02-23', 59.08, 2, 1),
(65, '2024-04-20', '2024-04-23', 91.20, 17, 1),
(66, '2024-06-30', '2024-07-06', 13.57, 28, 1),
(67, '2024-08-20', '2024-08-24', 21.63, 48, 1),
(68, '2024-02-22', '2024-02-25', 25.00, 17, 1),
(69, '2024-07-24', '2024-07-26', 21.63, 11, 1),
(70, '2024-06-07', '2024-06-12', 20.00, 9, 1),
(71, '2024-07-07', '2024-07-09', 28.64, 42, 1),
(72, '2025-01-12', '2025-01-19', 40.00, 36, 1),
(73, '2024-07-20', '2024-07-24', 28.00, 49, 1),
(74, '2024-10-24', '2024-10-30', 35.00, 8, 1),
(75, '2024-04-04', '2024-04-05', 3.09, 18, 1),
(76, '2024-07-17', '2024-07-22', 18.06, 45, 1),
(77, '2024-04-30', '2024-05-06', 62.30, 33, 1),
(78, '2024-05-05', '2024-05-09', 56.07, 13, 1),
(79, '2024-09-16', '2024-09-23', 12.36, 31, 1),
(80, '2024-12-24', '2024-12-27', 30.00, 27, 1),
(81, '2024-06-18', '2024-06-25', 35.00, 34, 1),
(82, '2024-12-04', '2024-12-06', 3.58, 5, 1),
(83, '2024-09-21', '2024-09-26', 68.85, 46, 1),
(84, '2024-05-26', '2024-05-27', 9.27, 19, 1),
(85, '2024-02-02', '2024-02-08', 25.06, 46, 1),
(86, '2024-11-01', '2024-11-06', 35.00, 39, 1),
(87, '2024-02-14', '2024-02-21', 103.39, 37, 1),
(88, '2024-10-12', '2024-10-19', 22.80, 40, 1),
(89, '2024-01-21', '2024-01-22', 82.62, 25, 1),
(90, '2024-07-14', '2024-07-17', 24.46, 12, 1),
(91, '2024-10-04', '2024-10-11', 102.60, 39, 1),
(92, '2024-02-16', '2024-02-18', 16.48, 46, 1),
(93, '2024-06-17', '2024-06-20', 36.69, 8, 1),
(94, '2024-03-06', '2024-03-11', 10.30, 13, 1),
(95, '2025-01-03', '2025-01-05', 102.60, 38, 1),
(96, '2024-04-14', '2024-04-17', 81.27, 10, 1),
(97, '2024-04-04', '2024-04-10', 45.00, 27, 1),
(98, '2024-07-29', '2024-08-05', 79.80, 49, 1),
(99, '2024-12-14', '2024-12-15', 108.56, 21, 1),
(100, '2024-04-06', '2024-04-08', 68.40, 50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `oId` int(11) NOT NULL,
  `iId` int(11) NOT NULL,
  `icount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`oId`, `iId`, `icount`) VALUES
(1, 3, 5),
(2, 13, 6),
(3, 10, 10),
(4, 3, 4),
(5, 9, 9),
(6, 13, 3),
(7, 15, 1),
(8, 9, 6),
(9, 2, 6),
(10, 8, 8),
(11, 10, 7),
(12, 10, 2),
(13, 2, 4),
(14, 11, 3),
(15, 12, 4),
(16, 2, 3),
(17, 11, 7),
(18, 14, 3),
(19, 9, 3),
(20, 4, 7),
(21, 4, 1),
(22, 9, 5),
(23, 7, 5),
(24, 13, 5),
(25, 15, 7),
(26, 8, 7),
(27, 8, 10),
(28, 11, 6),
(29, 13, 5),
(30, 8, 10),
(31, 5, 9),
(32, 8, 6),
(33, 3, 5),
(34, 11, 7),
(35, 12, 4),
(36, 11, 5),
(37, 10, 7),
(38, 5, 4),
(39, 7, 1),
(40, 14, 6),
(41, 15, 7),
(42, 14, 9),
(43, 12, 3),
(44, 8, 5),
(45, 13, 1),
(46, 9, 5),
(47, 9, 3),
(48, 13, 7),
(49, 3, 9),
(50, 13, 10),
(51, 9, 5),
(52, 2, 9),
(53, 16, 8),
(54, 7, 4),
(55, 16, 1),
(56, 1, 7),
(57, 13, 10),
(58, 4, 9),
(59, 9, 8),
(60, 7, 5),
(61, 13, 10),
(62, 5, 10),
(63, 9, 8),
(64, 3, 4),
(65, 5, 8),
(66, 4, 1),
(67, 12, 7),
(68, 11, 5),
(69, 12, 7),
(70, 11, 4),
(71, 8, 8),
(72, 11, 8),
(73, 14, 4),
(74, 11, 7),
(75, 12, 1),
(76, 2, 2),
(77, 10, 10),
(78, 10, 9),
(79, 7, 6),
(80, 11, 6),
(81, 11, 7),
(82, 8, 1),
(83, 6, 5),
(84, 12, 3),
(85, 8, 7),
(86, 14, 5),
(87, 3, 7),
(88, 5, 2),
(89, 6, 6),
(90, 1, 2),
(91, 5, 9),
(92, 7, 8),
(93, 1, 3),
(94, 7, 5),
(95, 5, 9),
(96, 2, 9),
(97, 11, 9),
(98, 5, 7),
(99, 4, 8),
(100, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `sId` int(11) NOT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Telno` char(14) DEFAULT NULL,
  `SURL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`sId`, `Sname`, `Street`, `City`, `StateAb`, `ZipCode`, `Sdate`, `Telno`, `SURL`) VALUES
(1, 'Arlington Organic Market', '466 Guerra Estate', 'Arlington', 'TX', '76001', '2022-01-01', '(817) 555-1234', 'www.arlingtonorganic.com');

-- --------------------------------------------------------

--
-- Table structure for table `store_customer`
--

CREATE TABLE `store_customer` (
  `sId` int(11) NOT NULL,
  `cId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_customer`
--

INSERT INTO `store_customer` (`sId`, `cId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `store_item`
--

CREATE TABLE `store_item` (
  `sId` int(11) NOT NULL,
  `iId` int(11) NOT NULL,
  `Scount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_item`
--

INSERT INTO `store_item` (`sId`, `iId`, `Scount`) VALUES
(1, 1, 251),
(1, 2, 209),
(1, 3, 106),
(1, 4, 224),
(1, 5, 200),
(1, 6, 341),
(1, 7, 77),
(1, 8, 431),
(1, 9, 43),
(1, 10, 485),
(1, 11, 416),
(1, 12, 361),
(1, 13, 441),
(1, 14, 190),
(1, 15, 103),
(1, 16, 57);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vId` int(11) NOT NULL,
  `Vname` varchar(50) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vId`, `Vname`, `Street`, `City`, `StateAb`, `ZipCode`) VALUES
(1, 'Fields-Martinez', '4300 Little Rd', 'Irving', 'TX', '76010'),
(2, 'Pace, James and Ramirez', '2600 W Pleasant Ridge Rd', 'Irving', 'TX', '76012'),
(3, 'Olson, Davies and Green', '1500 E Lamar Blvd', 'Bedford', 'TX', '76002'),
(4, 'Brown, Hernandez and Fuller', '2200 New York Ave', 'Bedford', 'TX', '76006'),
(5, 'Miller-Jordan', '2100 Southeast Pkwy', 'Irving', 'TX', '76014'),
(6, 'Patterson-Singleton', '101 E Abram St', 'Bedford', 'TX', '76011'),
(7, 'Marsh-Mendez', '5000 S Cooper St', 'Arlington', 'TX', '76013'),
(8, 'Keller Ltd', '3400 Matlock Rd', 'Grand Prairie', 'TX', '76014'),
(9, 'Buchanan-Gray', '1500 E Lamar Blvd', 'Fort Worth', 'TX', '76012'),
(10, 'Chung, Ryan and Jackson', '2600 W Pleasant Ridge Rd', 'Fort Worth', 'TX', '76015');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_item`
--

CREATE TABLE `vendor_item` (
  `vId` int(11) NOT NULL,
  `iId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_item`
--

INSERT INTO `vendor_item` (`vId`, `iId`) VALUES
(1, 2),
(2, 10),
(3, 3),
(3, 4),
(3, 9),
(3, 12),
(3, 16),
(4, 2),
(6, 6),
(6, 14),
(6, 16),
(7, 7),
(7, 15),
(8, 8),
(9, 5),
(9, 13),
(10, 1),
(10, 2),
(10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_store`
--

CREATE TABLE `vendor_store` (
  `vId` int(11) NOT NULL,
  `sId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_store`
--

INSERT INTO `vendor_store` (`vId`, `sId`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `_order`
--

CREATE TABLE `_order` (
  `oId` int(11) NOT NULL,
  `Odate` date DEFAULT NULL,
  `Ddate` date DEFAULT NULL,
  `Amount` decimal(20,2) DEFAULT NULL,
  `cId` int(11) NOT NULL,
  `sId` int(11) NOT NULL,
  `iId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `sId` (`sId`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`iId`);

--
-- Indexes for table `oldprice`
--
ALTER TABLE `oldprice`
  ADD PRIMARY KEY (`iId`,`oId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`oId`),
  ADD KEY `sId` (`sId`),
  ADD KEY `cId` (`cId`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`oId`,`iId`),
  ADD KEY `iId` (`iId`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `store_customer`
--
ALTER TABLE `store_customer`
  ADD PRIMARY KEY (`sId`,`cId`),
  ADD KEY `cId` (`cId`);

--
-- Indexes for table `store_item`
--
ALTER TABLE `store_item`
  ADD PRIMARY KEY (`sId`,`iId`),
  ADD KEY `iId` (`iId`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vId`);

--
-- Indexes for table `vendor_item`
--
ALTER TABLE `vendor_item`
  ADD PRIMARY KEY (`vId`,`iId`),
  ADD KEY `iId` (`iId`);

--
-- Indexes for table `vendor_store`
--
ALTER TABLE `vendor_store`
  ADD PRIMARY KEY (`vId`,`sId`),
  ADD KEY `sId` (`sId`);

--
-- Indexes for table `_order`
--
ALTER TABLE `_order`
  ADD PRIMARY KEY (`oId`),
  ADD KEY `sId` (`sId`),
  ADD KEY `iId` (`iId`),
  ADD KEY `cId` (`cId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `store` (`sId`);

--
-- Constraints for table `oldprice`
--
ALTER TABLE `oldprice`
  ADD CONSTRAINT `oldprice_ibfk_1` FOREIGN KEY (`iId`) REFERENCES `item` (`iId`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `store` (`sId`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `customer` (`cId`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`oId`) REFERENCES `order` (`oId`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`iId`) REFERENCES `item` (`iId`);

--
-- Constraints for table `store_customer`
--
ALTER TABLE `store_customer`
  ADD CONSTRAINT `store_customer_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `store` (`sId`),
  ADD CONSTRAINT `store_customer_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `customer` (`cId`);

--
-- Constraints for table `store_item`
--
ALTER TABLE `store_item`
  ADD CONSTRAINT `store_item_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `store` (`sId`),
  ADD CONSTRAINT `store_item_ibfk_2` FOREIGN KEY (`iId`) REFERENCES `item` (`iId`);

--
-- Constraints for table `vendor_item`
--
ALTER TABLE `vendor_item`
  ADD CONSTRAINT `vendor_item_ibfk_1` FOREIGN KEY (`vId`) REFERENCES `vendor` (`vId`),
  ADD CONSTRAINT `vendor_item_ibfk_2` FOREIGN KEY (`iId`) REFERENCES `item` (`iId`);

--
-- Constraints for table `vendor_store`
--
ALTER TABLE `vendor_store`
  ADD CONSTRAINT `vendor_store_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `store` (`sId`),
  ADD CONSTRAINT `vendor_store_ibfk_2` FOREIGN KEY (`vId`) REFERENCES `vendor` (`vId`);

--
-- Constraints for table `_order`
--
ALTER TABLE `_order`
  ADD CONSTRAINT `_order_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `store` (`sId`),
  ADD CONSTRAINT `_order_ibfk_2` FOREIGN KEY (`iId`) REFERENCES `item` (`iId`),
  ADD CONSTRAINT `_order_ibfk_3` FOREIGN KEY (`cId`) REFERENCES `customer` (`cId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
