-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2022 at 07:11 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BloodBank_Management`
--

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Bank`
--

CREATE TABLE `Blood_Bank` (
  `bb_id` int(4) NOT NULL,
  `bb_name` varchar(30) NOT NULL,
  `bb_street` varchar(50) NOT NULL,
  `bb_building_no` int(4) NOT NULL,
  `bb_locality` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Blood_Bank`
--

INSERT INTO `Blood_Bank` (`bb_id`, `bb_name`, `bb_street`, `bb_building_no`, `bb_locality`) VALUES
(1000, 'Red Cross Blood Bank', 'MG Road', 121, 'Central Bangalore'),
(1001, 'Rotary Blood Bank', 'Brigade Road', 201, 'North Bangalore'),
(1002, 'Lion\'s Blood Bank', 'Turahalli Road', 324, 'South Bangalore'),
(1003, 'Minerva Blood Bank', 'ECC Road', 444, 'East Banagalore');

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Patient`
--

CREATE TABLE `Blood_Patient` (
  `bu_id` varchar(4) NOT NULL,
  `patient_id` varchar(5) NOT NULL,
  `blood_group` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Blood_Patient`
--

INSERT INTO `Blood_Patient` (`bu_id`, `patient_id`, `blood_group`) VALUES
('120', 'P0010', 'AB+'),
('120', 'P0014', 'O+'),
('117', 'P0016', 'O-'),
('111', 'P0024', 'A+'),
('120', 'P0024', 'O+'),
('119', 'P0020', 'AB+'),
('118', 'P0018', 'O-'),
('116', 'P0019', 'B-');

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Units`
--

CREATE TABLE `Blood_Units` (
  `bu_id` varchar(4) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `bb_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Blood_Units`
--

INSERT INTO `Blood_Units` (`bu_id`, `blood_group`, `bb_id`) VALUES
('111', 'A+', 1000),
('112', 'A-', 1000),
('113', 'B+', 1000),
('114', 'AB+', 1000),
('115', 'A+', 1001),
('116', 'B-', 1001),
('117', 'AB-', 1001),
('118', '0-', 1002),
('119', 'AB+', 1002),
('120', '0+', 1003),
('121', 'B-', 1003);

-- --------------------------------------------------------

--
-- Table structure for table `Donor`
--

CREATE TABLE `Donor` (
  `d_id` varchar(6) NOT NULL,
  `d_name` varchar(30) NOT NULL,
  `d_surname` varchar(30) NOT NULL,
  `d_gender` varchar(3) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `d_street` varchar(30) NOT NULL,
  `d_house_number` int(4) NOT NULL,
  `d_locality` varchar(20) NOT NULL,
  `d_age` int(2) NOT NULL,
  `d_disease` varchar(10) NOT NULL,
  `id_blood` int(4) NOT NULL,
  `bloodGroup_Blood` varchar(4) NOT NULL,
  `id_rt` int(4) NOT NULL,
  `date_register` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Donor`
--

INSERT INTO `Donor` (`d_id`, `d_name`, `d_surname`, `d_gender`, `blood_group`, `contact_no`, `d_street`, `d_house_number`, `d_locality`, `d_age`, `d_disease`, `id_blood`, `bloodGroup_Blood`, `id_rt`, `date_register`) VALUES
('D0020', 'Vishnu', 'Mustaine', 'M', 'A+', '1112222333', 'MG road', 512, 'Lady Hill', 21, 'NIL', 6022, 'AB+', 711, '2022-11-01'),
('D0021', 'Sheeba', 'Lee Roth', 'F', 'AB+', '2223333444', 'JC road', 513, 'Bavate Gudde', 22, 'NIL', 6023, 'AB+', 712, '2022-11-02'),
('D0022', 'Allina', 'Van Halen', 'F', 'A+', '3334445555', 'KK Road', 514, 'Hat Hill', 23, 'Diabetes', 6024, 'A+', 713, '2022-11-03'),
('D0023', 'Abhibav', 'Medidi', 'M', 'A-', '4445555666', 'BEML Road', 515, 'Bendoor', 24, 'BP', 6025, 'B+', 714, '2022-11-04'),
('D0024', 'Aaron', 'Chapman', 'M', 'AB+', '5555666777', 'ECC Road', 516, 'Mallikatta', 25, 'NIL', 6026, 'B+', 715, '2022-11-05'),
('D0025', 'Anirudh', 'Michael', 'M', 'O+', '6667778888', 'End Point Road', 517, 'Kadri', 26, 'NIL', 6027, 'AB+', 716, '2022-11-06'),
('D0026', 'Dev', 'Daniel', 'M', 'O+', '7778889999', 'St. Mary\'s Road', 518, 'Nanthoor', 27, 'Diabetes', 6028, 'A+', 711, '2022-11-07'),
('D0027', 'Nisar', 'Mayer', 'M', 'AB-', '9999000111', 'Abbey Road', 519, 'Majestic ', 28, 'Anemia', 6029, 'B-', 712, '2022-11-08'),
('D0028', 'Joshua', 'Hudson', 'M', 'O-', '1110002222', 'BM Road', 520, 'Mysore', 29, 'Nil', 6030, 'AB-', 713, '2022-11-09'),
('D0029', 'Shrey', 'Rose', 'M', 'A-', '1110003333', 'Mall Road', 521, 'RT Nagar', 30, 'Nil', 6031, '0-', 714, '2022-11-10'),
('D0030', 'Varad', 'Ulrich', 'M', 'B-', '1110004444', 'Park Street', 522, 'Banashankari', 31, 'Nil', 6032, 'AB+', 715, '2022-11-11'),
('D0031', 'Shashank', 'Hamett', 'M', 'AB+', '1110005555', 'Rajpath', 523, 'Basavanagudi', 32, 'Nil', 6033, '0+', 716, '2022-11-12'),
('D0032', 'Nevil', 'Sheeran', 'M', 'O+', '1110006666', 'Kingsway Road', 524, 'Bada Bangadda', 33, 'Nil', 6034, 'B-', 711, '2022-11-13'),
('D0033', 'Nishok', 'Jackson', 'M', 'AB+', '1110007777', 'Janpath', 525, 'Chotta Bangadda', 34, 'Nil', 6035, 'O-', 712, '2022-11-14'),
('D0034', 'Aditi', 'Wonder', 'F', 'B+', '1110008888', 'Railway Station Road', 526, 'Hapankatta', 35, 'Nil', 6036, 'B-', 713, '2022-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `Hospital`
--

CREATE TABLE `Hospital` (
  `hospital_id` varchar(4) NOT NULL,
  `h_name` varchar(20) NOT NULL,
  `h_street` varchar(20) NOT NULL,
  `h_building_no` int(3) NOT NULL,
  `h_locality` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Hospital`
--

INSERT INTO `Hospital` (`hospital_id`, `h_name`, `h_street`, `h_building_no`, `h_locality`) VALUES
('H030', 'Sri Sankara', 'Varthur Road', 123, 'KundanaHalli'),
('H031', 'RxDx', 'OR Road', 234, 'Benniganahalli'),
('H032', 'Apollo', 'MayFlower Avenue', 567, 'Jayanagar'),
('H033', 'Sakra', 'Banyan Avenue', 666, 'HAL');

-- --------------------------------------------------------

--
-- Table structure for table `Hospital_Request`
--

CREATE TABLE `Hospital_Request` (
  `request_id` int(4) NOT NULL,
  `hospital_id` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Hospital_Request`
--

INSERT INTO `Hospital_Request` (`request_id`, `hospital_id`) VALUES
(2, 'H030'),
(4, 'H031'),
(6, 'H032'),
(8, 'H033'),
(10, 'H033'),
(12, 'H033'),
(14, 'H031'),
(16, 'H030'),
(18, 'H032');

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `patient_id` varchar(5) NOT NULL,
  `patient_name` varchar(30) NOT NULL,
  `patient_surname` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `street` varchar(20) NOT NULL,
  `house_number` varchar(5) NOT NULL,
  `locality` varchar(20) NOT NULL,
  `rt_id` int(4) NOT NULL,
  `date_registration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`patient_id`, `patient_name`, `patient_surname`, `gender`, `blood_group`, `contact`, `street`, `house_number`, `locality`, `rt_id`, `date_registration`) VALUES
('P0010', 'Kavya ', 'Gandhi', 'F', 'AB+', '1122334455', 'MG road', '10', 'Majestic ', 440, '2022-11-01'),
('P0011', 'Anushree', 'Shetty', 'F', 'A+', '2233445566', 'JC road', '20', 'Mysore', 441, '2022-11-02'),
('P0012', 'Sweety', 'Sen', 'F', 'A-', '3344556677', 'KK Road', '30', 'RT Nagar', 441, '2022-11-03'),
('P0013', 'Rupa', 'Ganguli', 'F', 'AB+', '4455667788', 'BEML Road', '40', 'Banashankari', 442, '2022-11-04'),
('P0014', 'Sudarshana', 'Dhar', 'F', 'O+', '5566778899', 'ECC Road', '50', 'Basavanagudi', 443, '2022-11-05'),
('P0015', 'Tirthankar', 'Bhattacharyya', 'M', 'O+', '6677889900', 'End Point Road', '60', 'Bada Bangadda', 444, '2022-11-06'),
('P0016', 'Naina ', 'Saini', 'F', 'AB-', '7788990011', 'St. Mary\'s Road', '70', 'Chotta Bangadda', 443, '2022-11-07'),
('P0017', 'Susheel', 'Sharma', 'M', 'O-', '8899001122', 'Abbey Road', '80', 'Hapankatta', 441, '2022-11-08'),
('P0018', 'Pakhi', 'Shah', 'F', 'A-', '9900112233', 'BM Road', '90', 'Lady Hill', 440, '2022-11-09'),
('P0019', 'Virat', 'Modi', 'M', 'B-', '1100223344', 'Mall Road', '11', 'Bavate Gudde', 442, '2022-11-10'),
('P0020', 'Vishal', 'Sharma', 'M', 'AB+', '2200113344', 'Park Street', '21', 'Hat Hill', 440, '2022-11-11'),
('P0021', 'Samar', 'Sen', 'M', 'O+', '1234512345', 'Rajpath', '31', 'Bendoor', 441, '2022-11-12'),
('P0022', 'Barkha', 'Dutt', 'F', 'AB+', '2345623456', 'Kingsway Road', '41', 'Mallikatta', 442, '2022-11-13'),
('P0023', 'Savi', 'Rao', 'F', 'B+', '4567845678', 'Janpath', '51', 'Kadri', 442, '2022-11-14'),
('P0024', 'Vinayak', 'Joshi', 'M', 'A+', '8899005566', 'Railway Station Road', '61', 'Nanthoor', 444, '2022-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `Patient_Request`
--

CREATE TABLE `Patient_Request` (
  `patient_id` varchar(5) NOT NULL,
  `request_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Patient_Request`
--

INSERT INTO `Patient_Request` (`patient_id`, `request_id`) VALUES
('P0010', 1),
('P0010', 15),
('P0010', 17),
('P0011', 11),
('P0015', 3),
('P0016', 13),
('P0017', 5),
('P0020', 7),
('P0020', 19),
('P0024', 9);

-- --------------------------------------------------------

--
-- Table structure for table `Registration_Team`
--

CREATE TABLE `Registration_Team` (
  `rt_member_id` int(4) NOT NULL,
  `rt_member_name` varchar(30) NOT NULL,
  `rt_member_surname` varchar(30) NOT NULL,
  `bb_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Registration_Team`
--

INSERT INTO `Registration_Team` (`rt_member_id`, `rt_member_name`, `rt_member_surname`, `bb_id`) VALUES
(440, 'Frieda', 'Slaves', 1000),
(441, 'Aravind', 'Govan', 1001),
(442, 'Vinod', 'Adesh', 1000),
(443, 'Arjun', 'Chand', 1001),
(444, 'Aarya', 'Chouhan', 1002),
(716, 'Ananya', 'Sequiera', 1003);

-- --------------------------------------------------------

--
-- Table structure for table `Requests`
--

CREATE TABLE `Requests` (
  `request_id` int(4) NOT NULL,
  `blood_group` varchar(4) NOT NULL,
  `units_of_blood` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Requests`
--

INSERT INTO `Requests` (`request_id`, `blood_group`, `units_of_blood`) VALUES
(1, 'A', 1),
(2, 'AB+', 2),
(3, 'A+', 3),
(4, 'A-', 4),
(5, 'AB+', 2),
(6, 'O+', 1),
(7, 'O+', 2),
(8, 'AB-', 1),
(9, 'O-', 1),
(10, 'O+', 2),
(11, 'O+', 1),
(12, 'AB-', 1),
(13, 'O-', 1),
(14, 'A-', 6),
(15, 'B-', 1),
(16, 'AB+', 1),
(17, 'O+', 1),
(18, 'AB+', 1),
(19, 'A+', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Technical_Analyst`
--

CREATE TABLE `Technical_Analyst` (
  `ta_id` int(4) NOT NULL,
  `ta_name` varchar(30) NOT NULL,
  `ta_surname` varchar(30) NOT NULL,
  `bb_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Technical_Analyst`
--

INSERT INTO `Technical_Analyst` (`ta_id`, `ta_name`, `ta_surname`, `bb_id`) VALUES
(113, 'Vaidehi', 'Rogan', 1003),
(911, 'Varun', 'Vai', 1000),
(912, 'Sanjeeth', 'Gilbert', 1001),
(913, 'Sathish', 'Petrucci', 1002),
(914, 'Dev', 'Mustaine', 1003),
(915, 'Varshini', 'Friedman', 1002);

-- --------------------------------------------------------

--
-- Table structure for table `Technical_Analyst_Blood`
--

CREATE TABLE `Technical_Analyst_Blood` (
  `ta_id` int(4) NOT NULL,
  `bu_id` varchar(10) NOT NULL,
  `blood_group` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Technical_Analyst_Blood`
--

INSERT INTO `Technical_Analyst_Blood` (`ta_id`, `bu_id`, `blood_group`) VALUES
(113, '112', 'A-'),
(911, '113', 'B+'),
(912, '114', 'AB+'),
(913, '115', 'A+'),
(913, '116', 'B-'),
(912, '117', 'AB-'),
(914, '118', '0-'),
(915, '119', 'AB+'),
(113, '120', '0+'),
(911, '121', 'B-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blood_Bank`
--
ALTER TABLE `Blood_Bank`
  ADD PRIMARY KEY (`bb_id`);

--
-- Indexes for table `Blood_Patient`
--
ALTER TABLE `Blood_Patient`
  ADD KEY `bu_id` (`bu_id`);

--
-- Indexes for table `Blood_Units`
--
ALTER TABLE `Blood_Units`
  ADD PRIMARY KEY (`bu_id`),
  ADD KEY `bb_id` (`bb_id`);

--
-- Indexes for table `Donor`
--
ALTER TABLE `Donor`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `Hospital`
--
ALTER TABLE `Hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `Hospital_Request`
--
ALTER TABLE `Hospital_Request`
  ADD PRIMARY KEY (`request_id`,`hospital_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `rt_id` (`rt_id`);

--
-- Indexes for table `Patient_Request`
--
ALTER TABLE `Patient_Request`
  ADD PRIMARY KEY (`patient_id`,`request_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `Registration_Team`
--
ALTER TABLE `Registration_Team`
  ADD PRIMARY KEY (`rt_member_id`),
  ADD KEY `fk_bb_rt` (`bb_id`);

--
-- Indexes for table `Requests`
--
ALTER TABLE `Requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `Technical_Analyst`
--
ALTER TABLE `Technical_Analyst`
  ADD PRIMARY KEY (`ta_id`),
  ADD KEY `fk_bb_ta` (`bb_id`);

--
-- Indexes for table `Technical_Analyst_Blood`
--
ALTER TABLE `Technical_Analyst_Blood`
  ADD KEY `bu_id` (`bu_id`),
  ADD KEY `ta_id` (`ta_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Blood_Patient`
--
ALTER TABLE `Blood_Patient`
  ADD CONSTRAINT `blood_patient_ibfk_1` FOREIGN KEY (`bu_id`) REFERENCES `Blood_Units` (`bu_id`);

--
-- Constraints for table `Blood_Units`
--
ALTER TABLE `Blood_Units`
  ADD CONSTRAINT `blood_units_ibfk_1` FOREIGN KEY (`bb_id`) REFERENCES `Blood_Bank` (`bb_id`);

--
-- Constraints for table `Hospital_Request`
--
ALTER TABLE `Hospital_Request`
  ADD CONSTRAINT `hospital_request_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `Hospital` (`hospital_id`),
  ADD CONSTRAINT `hospital_request_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `Requests` (`request_id`);

--
-- Constraints for table `Patient`
--
ALTER TABLE `Patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`rt_id`) REFERENCES `Registration_Team` (`rt_member_id`);

--
-- Constraints for table `Patient_Request`
--
ALTER TABLE `Patient_Request`
  ADD CONSTRAINT `patient_request_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `Requests` (`request_id`),
  ADD CONSTRAINT `patient_request_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`),
  ADD CONSTRAINT `patient_request_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`);

--
-- Constraints for table `Registration_Team`
--
ALTER TABLE `Registration_Team`
  ADD CONSTRAINT `fk_bb_rt` FOREIGN KEY (`bb_id`) REFERENCES `Blood_Bank` (`bb_id`);

--
-- Constraints for table `Technical_Analyst`
--
ALTER TABLE `Technical_Analyst`
  ADD CONSTRAINT `fk_bb_ta` FOREIGN KEY (`bb_id`) REFERENCES `Blood_Bank` (`bb_id`);

--
-- Constraints for table `Technical_Analyst_Blood`
--
ALTER TABLE `Technical_Analyst_Blood`
  ADD CONSTRAINT `technical_analyst_blood_ibfk_1` FOREIGN KEY (`bu_id`) REFERENCES `Blood_Units` (`bu_id`),
  ADD CONSTRAINT `technical_analyst_blood_ibfk_2` FOREIGN KEY (`ta_id`) REFERENCES `Technical_Analyst` (`ta_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
