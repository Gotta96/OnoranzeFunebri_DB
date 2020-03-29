-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2018 at 12:28 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OnoranzeFunebri`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `funeraliresponsabile` (`CodDip` VARCHAR(16)) RETURNS INT(11) NO SQL
BEGIN
DECLARE nfunerali int;
SELECT COUNT(CodFunerale) INTO nfunerali
FROM ordinefunerale JOIN dipendente ON CodRespFun=CodDipendente
WHERE DataOrdine <= CURRENT_DATE AND DataOraSvolgimento >= CURRENT_DATE AND CodDip=CfRespFun;
RETURN nfunerali;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `totlordomese` (`DataOrdineIns` DATE) RETURNS INT(11) NO SQL
BEGIN
DECLARE totmese int;
SELECT SUM(PrezzoFinale) INTO totmese
FROM ordinefunerale
WHERE DataOrdine>=DataOrdineIns AND DataOrdine<=DATE_ADD(DataOrdineIns,INTERVAL 1 MONTH );
RETURN totmese;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

CREATE TABLE `auto` (
  `CodAuto` int(11) NOT NULL,
  `CasaCostrutt` varchar(20) NOT NULL,
  `Modello` varchar(20) NOT NULL,
  `Prezzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto`
--

INSERT INTO `auto` (`CodAuto`, `CasaCostrutt`, `Modello`, `Prezzo`) VALUES
(1, 'Maserati', 'Ghibli 3.0D - Vekal', 60),
(2, 'Jaguar', 'XJ 2.0D - Revenge', 50),
(3, 'Mercedes', 'ClasseE2.0D - BRETIL', 50),
(4, 'Rolls Royce', 'B12 Phantomhearse 6D', 70);

-- --------------------------------------------------------

--
-- Table structure for table `bara`
--

CREATE TABLE `bara` (
  `CodBara` int(11) NOT NULL,
  `NomeBara` varchar(20) NOT NULL,
  `Materiale` varchar(30) NOT NULL,
  `Prezzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bara`
--

INSERT INTO `bara` (`CodBara`, `NomeBara`, `Materiale`, `Prezzo`) VALUES
(1, 'Becco di civetta', 'abete', 150),
(2, 'America spalla', 'Larice', 200),
(3, 'America Retta', 'Larice', 220),
(4, 'Giovanni paolo II', 'Mogano', 275),
(5, 'Lombardo', 'Noce', 250),
(6, 'Messalina intagli', 'Rovere', 300),
(7, 'Madonna', 'Rovere', 290),
(8, 'Calvario', 'Abete', 180),
(9, 'Filo oro tre filetti', 'Mogano', 350);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `CfCliente` varchar(16) NOT NULL,
  `NomeCliente` text NOT NULL,
  `CognomeCliente` text NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `Paese` varchar(20) NOT NULL,
  `Provincia` text NOT NULL,
  `Telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`CfCliente`, `NomeCliente`, `CognomeCliente`, `Indirizzo`, `Paese`, `Provincia`, `Telefono`) VALUES
('BLLMRK85A56L736G', 'Mirka', 'Bellini', 'Via Leopardi 10/A', 'S.Giorgio di Livenza', 'VE', '0498164729'),
('CRCNNL82D27F241C', 'Antonello', 'Croce', 'Via Levante 4', 'Mirano', 'VE', '0493446218'),
('GBBMRA43P61H620E', 'Mario', 'Gabbato', 'Via suor Angela Frasson 31/B', 'Rovigo', 'RO', '0499463589'),
('LCNLBN76H15B563B', 'Albino', 'Lucon', 'Via Roma 4', 'Arsego', 'PD', '0494143657'),
('LRNGLN68A57F904P', 'Giuliana', 'Lorenzi', 'Via cavalieri di Vittorio veneto 78', 'Cappella', 'VE', '3445397816'),
('VRTMRN66L12B563C', 'Marino', 'Veritti', 'Via Anconetta 12', 'Borgoricco', 'PD', '3465148957'),
('ZLTLRA55T65L781Y', 'Laura', 'Ziletti', 'Via Sole 49', 'Verona', 'VR', '3350124387');

-- --------------------------------------------------------

--
-- Table structure for table `composizionefloreale`
--

CREATE TABLE `composizionefloreale` (
  `CodCompo` int(11) NOT NULL,
  `NomeCompo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `composizionefloreale`
--

INSERT INTO `composizionefloreale` (`CodCompo`, `NomeCompo`) VALUES
(1, 'Lilium e ciclamino'),
(2, 'Fiori misti'),
(3, 'Ci manchi'),
(4, 'Riflessi bianchi'),
(5, 'Cuscino rosa'),
(6, 'Croce funebre'),
(7, 'Croce floreale'),
(8, 'Dolce addio'),
(9, 'Vicinanza'),
(10, 'Sincero addio'),
(11, 'Raffinato pensiero');

-- --------------------------------------------------------

--
-- Table structure for table `fiore`
--

CREATE TABLE `fiore` (
  `CodFiore` int(11) NOT NULL,
  `NomeFiore` varchar(20) NOT NULL,
  `Periodo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fiore`
--

INSERT INTO `fiore` (`CodFiore`, `NomeFiore`, `Periodo`) VALUES
(1, 'Anemone', 'primaverile estivo'),
(2, 'Tulipano', 'estivo'),
(3, 'Gardenia', 'primaverile estivo'),
(4, 'Girasole', 'estivo'),
(5, 'Margherita comune', ''),
(6, 'Rosa rossa', 'estivo autunnale'),
(7, 'Rosa bianca', 'estivo autunnale'),
(8, 'Rosa gialla', 'estivo autunnale'),
(9, 'Rosa blu', 'estivo autunnale'),
(10, 'Crisantemo', 'primaverile estivo autunnale'),
(11, 'Viola', 'primaverile'),
(12, 'Papavero', 'estivo'),
(13, 'Ciclamino', 'invernale estivo'),
(14, 'Lilium', 'estivo'),
(15, 'Orchidea', 'primaverile estivo'),
(16, 'Calla', 'estivo'),
(17, 'Anthurium', 'estivo autunnale');

-- --------------------------------------------------------

--
-- Stand-in structure for view `fiorimagg9`
--
CREATE TABLE `fiorimagg9` (
`CodCliente` varchar(16)
,`NumeroComposizioniAcquistate` bigint(21)
,`NumeroMazziAcquistati` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `lapide`
--

CREATE TABLE `lapide` (
  `CodLapide` int(11) NOT NULL,
  `NomeLapide` varchar(20) NOT NULL,
  `Prezzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lapide`
--

INSERT INTO `lapide` (`CodLapide`, `NomeLapide`, `Prezzo`) VALUES
(1, 'Travertina foto', 150),
(2, 'Marmorizzata foto', 200),
(3, 'Rosa portogallo foto', 160),
(4, 'Marmo Carrara foto', 250),
(5, 'Marmo carrara', 220),
(6, 'Botticino', 175),
(7, 'Rosa greca', 200);

-- --------------------------------------------------------

--
-- Table structure for table `luogorito`
--

CREATE TABLE `luogorito` (
  `CodRito` int(11) NOT NULL,
  `NomeLRito` text NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `Paese` varchar(20) NOT NULL,
  `Provincia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `luogorito`
--

INSERT INTO `luogorito` (`CodRito`, `NomeLRito`, `Indirizzo`, `Paese`, `Provincia`) VALUES
(1, 'Chiesa di Mirano', 'Piazzale Pio XII 10', 'Mirano', 'VE'),
(2, 'Chiesa di Borgoricco', 'Viale Europa 18', 'Borgoricco', 'PD'),
(3, 'Chiesa di Cappella', 'Via Moglianese Scorzè 47', 'Cappella', 'VE'),
(4, 'San Bartolomeo Apostolo Rovigo', 'Piazza S. Bartolomeo 17', 'Rovigo', 'RV'),
(5, 'Chiesa Rettorale Santa Maria Antica Verona', 'Via Arche Scagliere 3', 'Verona', 'VR'),
(6, 'Chiesa di San Giorgio Martire Livenza', 'Strada San Giorgio 8', 'S.Giorgio di Livenza', 'VE'),
(7, 'Chiesa di Arsego', 'Via Roma 303', 'Arsego', 'PD');

-- --------------------------------------------------------

--
-- Table structure for table `luogosepoltura`
--

CREATE TABLE `luogosepoltura` (
  `CodSep` int(11) NOT NULL,
  `NomeLSep` text NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `Paese` varchar(20) NOT NULL,
  `Provincia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `luogosepoltura`
--

INSERT INTO `luogosepoltura` (`CodSep`, `NomeLSep`, `Indirizzo`, `Paese`, `Provincia`) VALUES
(1, 'Cimitero di Mestre', 'Via Santa Maria dei Beati 1/E', 'Mestre', 'VE'),
(2, 'Cimitero monumentale di Verona', 'Piazzale del cmitero', 'Verona', 'VR'),
(3, 'Cimitero di Reschigliano', 'Via Marconi 22', 'Reschigliano', 'PD'),
(4, 'Cimitero comunale Salute Livenza', 'Via T. Tasso', 'La salute di Livenza', 'VE'),
(5, 'Cimitero Rovigo', 'Via Antonio Oroboni 28', 'Rovigo', 'RO'),
(6, 'Cimitero di san Michele in Isola', 'Isola San Michele', 'Venezia', 'VE');

-- --------------------------------------------------------

--
-- Table structure for table `ordinefiori`
--

CREATE TABLE `ordinefiori` (
  `CodOrdFiori` int(11) NOT NULL,
  `CodCompFiori` int(11) NOT NULL,
  `NumMazzi` int(11) NOT NULL,
  `PrezzoMazzi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordinefiori`
--

INSERT INTO `ordinefiori` (`CodOrdFiori`, `CodCompFiori`, `NumMazzi`, `PrezzoMazzi`) VALUES
(1, 2, 2, 251),
(6, 4, 3, 147),
(6, 5, 1, 249),
(5, 6, 2, 421),
(5, 8, 1, 157),
(6, 8, 5, 524),
(1, 9, 11, 650),
(5, 9, 4, 200),
(2, 10, 1, 107),
(5, 10, 2, 186);

--
-- Triggers `ordinefiori`
--
DELIMITER $$
CREATE TRIGGER `prezzofiori` BEFORE INSERT ON `ordinefiori` FOR EACH ROW UPDATE ordinefunerale
SET PrezzoFinale=PrezzoFinale+new.PrezzoMazzi
WHERE (new.CodOrdFiori=CodFunerale)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ordinefunerale`
--

CREATE TABLE `ordinefunerale` (
  `CodFunerale` int(11) NOT NULL,
  `CodCliente` varchar(16) NOT NULL,
  `CodRespFun` int(11) NOT NULL,
  `CodRespCerim` int(11) NOT NULL,
  `CodLuogRito` int(11) NOT NULL,
  `CodLuogSep` int(11) NOT NULL,
  `DataOraSvolgim` datetime NOT NULL,
  `DataOrdine` date NOT NULL,
  `CodOrdineBara` int(11) DEFAULT NULL,
  `CodOrdineUrna` int(11) DEFAULT NULL,
  `CodOrdineLapide` int(11) NOT NULL,
  `CodOrdineAuto` int(11) NOT NULL,
  `PrezzoFinale` int(11) NOT NULL,
  `NomeDefunto` text NOT NULL,
  `CognomeDefunto` text NOT NULL,
  `DataNascita` date NOT NULL,
  `DataDecesso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordinefunerale`
--

INSERT INTO `ordinefunerale` (`CodFunerale`, `CodCliente`, `CodRespFun`, `CodRespCerim`, `CodLuogRito`, `CodLuogSep`, `DataOraSvolgim`, `DataOrdine`, `CodOrdineBara`, `CodOrdineUrna`, `CodOrdineLapide`, `CodOrdineAuto`, `PrezzoFinale`, `NomeDefunto`, `CognomeDefunto`, `DataNascita`, `DataDecesso`) VALUES
(1, 'BLLMRK85A56L736G', 1, 1, 1, 1, '2018-04-19 10:00:00', '2018-04-17', 1, NULL, 1, 1, 2401, 'Mario', 'Bellini', '1924-05-05', '2018-04-17'),
(2, 'CRCNNL82D27F241C', 1, 1, 1, 1, '2018-03-21 15:00:00', '2018-03-20', 7, 7, 3, 3, 2107, 'Luigino', 'Croce', '1956-11-17', '2018-03-19'),
(3, 'VRTMRN66L12B563C', 3, 2, 2, 3, '2018-03-11 15:00:00', '2018-03-09', NULL, 5, 4, 2, 1700, 'Gianluca', 'Veritti', '1944-02-28', '2018-03-08'),
(4, 'VRTMRN66L12B563C', 2, 2, 2, 3, '2018-08-09 15:00:00', '2018-08-07', 5, 2, 5, 2, 2000, 'Gina', 'Giuletti', '1946-10-14', '2018-08-06'),
(5, 'LCNLBN76H15B563B', 3, 3, 7, 6, '2017-11-14 10:00:00', '2017-11-12', 4, 5, 2, 2, 3464, 'Mario', 'Lucon', '1934-04-26', '2017-11-11'),
(6, 'LCNLBN76H15B563B', 3, 3, 7, 6, '2017-09-20 10:30:00', '2017-09-18', 2, 5, 2, 2, 3420, 'Rosa', 'Boscolo', '1935-07-22', '2017-09-17');

--
-- Triggers `ordinefunerale`
--
DELIMITER $$
CREATE TRIGGER `controlloordine` BEFORE INSERT ON `ordinefunerale` FOR EACH ROW BEGIN
IF(EXISTS(SELECT * FROM ordinefunerale WHERE CodOrdineAuto=new.CodOrdineAuto AND DataOraSvolgim=new.DataOraSvolgim))
THEN SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001,
MESSAGE_TEXT='Impossibile. Auto gia impegnata. Selezionare auto diversa';
END IF;

IF(new.CodOrdineBara IS NULL and new.CodOrdineUrna IS NULL)
THEN SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001,
 MESSAGE_TEXT='Impossibile. Selezionare almeno una delle due opzioni.';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `responsabilecerimonia`
--

CREATE TABLE `responsabilecerimonia` (
  `CodRespCer` int(11) NOT NULL,
  `CfRespCer` varchar(16) NOT NULL,
  `NomeRespCer` text NOT NULL,
  `CognomeRespCer` text NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `Paese` varchar(20) NOT NULL,
  `Provincia` text NOT NULL,
  `Telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `responsabilecerimonia`
--

INSERT INTO `responsabilecerimonia` (`CodRespCer`, `CfRespCer`, `NomeRespCer`, `CognomeRespCer`, `Indirizzo`, `Paese`, `Provincia`, `Telefono`) VALUES
(1, 'PRZMTT80D15F205V', 'Matteo', 'Perazzi', 'Via punara 14', 'S.Gio delle Pertiche', 'PD', '0495141265'),
(2, 'FRSFNC69E31F241P', 'Francesco', 'Fraschi', 'Via roma 66/A', 'Mirano', 'VE', '3652148659'),
(3, 'VNLLGN68S20L736U', 'Licigno', 'Vianello', 'Calle Rossa 5', 'Venezia', 'VE', '3449181756');

-- --------------------------------------------------------

--
-- Table structure for table `responsabilefunerale`
--

CREATE TABLE `responsabilefunerale` (
  `CodDipendente` int(11) NOT NULL,
  `CfRespFun` varchar(16) NOT NULL,
  `NomeRespFun` text NOT NULL,
  `CognomeRespFun` text NOT NULL,
  `DataNascita` date NOT NULL,
  `LuogoNascita` varchar(50) NOT NULL,
  `Mansione` varchar(30) NOT NULL,
  `DataAssunzione` date NOT NULL,
  `Stipendio` int(11) NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `Paese` varchar(20) NOT NULL,
  `Provincia` text NOT NULL,
  `Telefono` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `responsabilefunerale`
--

INSERT INTO `responsabilefunerale` (`CodDipendente`, `CfRespFun`, `NomeRespFun`, `CognomeRespFun`, `DataNascita`, `LuogoNascita`, `Mansione`, `DataAssunzione`, `Stipendio`, `Indirizzo`, `Paese`, `Provincia`, `Telefono`) VALUES
(1, 'TRTTMS96S27B563D', 'Tommaso', 'Turato', '1996-11-27', 'Camposampiero', 'Addetto alla cura delle salme', '2017-01-20', 2200, 'Via Zuanon 14', 'S.Gio delle Pertiche', 'PD', '3451204862'),
(2, 'BRGLSS96M08G224D', 'Alessio', 'Bergamasco', '1996-08-08', 'Padova', 'Autista', '2017-01-28', 2000, 'Via Praarie 85', 'Saletto', 'PD', '3468249532'),
(3, 'FNTJMS96T27B563Q', 'James', 'Fontana', '1996-12-27', 'Camposampiero', 'Autista', '2017-05-22', 1700, 'Via del quadrante', 'Borghetto', 'PD', '3339647518'),
(4, 'PNTMRC96L24G224M', 'Marco', 'Pinton', '1996-07-24', 'Padova', 'Impiegato', '2017-02-10', 2100, 'Via Garibaldi 23', 'Saletto', 'PD', '3452010896');

-- --------------------------------------------------------

--
-- Table structure for table `rigacomposizione`
--

CREATE TABLE `rigacomposizione` (
  `CodComposiz` int(11) NOT NULL,
  `CodFioreRiga` int(11) NOT NULL,
  `NumPezzi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rigacomposizione`
--

INSERT INTO `rigacomposizione` (`CodComposiz`, `CodFioreRiga`, `NumPezzi`) VALUES
(1, 13, 12),
(1, 14, 7),
(2, 1, 5),
(2, 6, 5),
(2, 7, 5),
(2, 14, 5),
(3, 6, 8),
(3, 15, 10),
(4, 5, 15),
(4, 7, 5),
(4, 16, 6),
(5, 5, 15),
(5, 17, 10),
(6, 8, 20),
(7, 8, 10),
(7, 17, 3),
(8, 6, 7),
(8, 16, 9),
(9, 6, 5),
(9, 8, 15),
(10, 3, 5),
(10, 10, 5),
(10, 13, 8),
(11, 4, 3),
(11, 16, 8);

-- --------------------------------------------------------

--
-- Table structure for table `urna`
--

CREATE TABLE `urna` (
  `CodUrna` int(11) NOT NULL,
  `NomeUrna` varchar(20) NOT NULL,
  `Materiale` varchar(30) NOT NULL,
  `Prezzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `urna`
--

INSERT INTO `urna` (`CodUrna`, `NomeUrna`, `Materiale`, `Prezzo`) VALUES
(1, 'E.M. C-101', 'legno multilaminare piallato', 80),
(2, 'E.M. C-232', 'Tranciato di betulla', 85),
(3, 'E.M. C-221', 'Tranciato di tay', 85),
(4, 'E.M. C-552', 'Tranciato di acero', 90),
(5, 'E.M. C-332', 'Legno massello multilaminare', 80),
(6, 'E.M. C-653', 'Legno massello Tanganika frise', 110),
(7, 'E.M. C-655', 'Legno massello Makore frise', 115);

-- --------------------------------------------------------

--
-- Structure for view `fiorimagg9`
--
DROP TABLE IF EXISTS `fiorimagg9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fiorimagg9`  AS  select `ordinefunerale`.`CodCliente` AS `CodCliente`,count(`ordinefiori`.`CodCompFiori`) AS `NumeroComposizioniAcquistate`,sum(`ordinefiori`.`NumMazzi`) AS `NumeroMazziAcquistati` from (`ordinefunerale` join `ordinefiori` on((`ordinefunerale`.`CodFunerale` = `ordinefiori`.`CodOrdFiori`))) group by `ordinefunerale`.`CodCliente` having (`NumeroMazziAcquistati` >= 9) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`CodAuto`);

--
-- Indexes for table `bara`
--
ALTER TABLE `bara`
  ADD PRIMARY KEY (`CodBara`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CfCliente`);

--
-- Indexes for table `composizionefloreale`
--
ALTER TABLE `composizionefloreale`
  ADD PRIMARY KEY (`CodCompo`);

--
-- Indexes for table `fiore`
--
ALTER TABLE `fiore`
  ADD PRIMARY KEY (`CodFiore`);

--
-- Indexes for table `lapide`
--
ALTER TABLE `lapide`
  ADD PRIMARY KEY (`CodLapide`);

--
-- Indexes for table `luogorito`
--
ALTER TABLE `luogorito`
  ADD PRIMARY KEY (`CodRito`);

--
-- Indexes for table `luogosepoltura`
--
ALTER TABLE `luogosepoltura`
  ADD PRIMARY KEY (`CodSep`);

--
-- Indexes for table `ordinefiori`
--
ALTER TABLE `ordinefiori`
  ADD PRIMARY KEY (`CodCompFiori`,`CodOrdFiori`);

--
-- Indexes for table `ordinefunerale`
--
ALTER TABLE `ordinefunerale`
  ADD PRIMARY KEY (`CodFunerale`);

--
-- Indexes for table `responsabilecerimonia`
--
ALTER TABLE `responsabilecerimonia`
  ADD PRIMARY KEY (`CodRespCer`);

--
-- Indexes for table `responsabilefunerale`
--
ALTER TABLE `responsabilefunerale`
  ADD PRIMARY KEY (`CodDipendente`);

--
-- Indexes for table `rigacomposizione`
--
ALTER TABLE `rigacomposizione`
  ADD PRIMARY KEY (`CodComposiz`,`CodFioreRiga`);

--
-- Indexes for table `urna`
--
ALTER TABLE `urna`
  ADD PRIMARY KEY (`CodUrna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto`
--
ALTER TABLE `auto`
  MODIFY `CodAuto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bara`
--
ALTER TABLE `bara`
  MODIFY `CodBara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `composizionefloreale`
--
ALTER TABLE `composizionefloreale`
  MODIFY `CodCompo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `fiore`
--
ALTER TABLE `fiore`
  MODIFY `CodFiore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `lapide`
--
ALTER TABLE `lapide`
  MODIFY `CodLapide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `luogorito`
--
ALTER TABLE `luogorito`
  MODIFY `CodRito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `luogosepoltura`
--
ALTER TABLE `luogosepoltura`
  MODIFY `CodSep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ordinefunerale`
--
ALTER TABLE `ordinefunerale`
  MODIFY `CodFunerale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `responsabilecerimonia`
--
ALTER TABLE `responsabilecerimonia`
  MODIFY `CodRespCer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `responsabilefunerale`
--
ALTER TABLE `responsabilefunerale`
  MODIFY `CodDipendente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `urna`
--
ALTER TABLE `urna`
  MODIFY `CodUrna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
