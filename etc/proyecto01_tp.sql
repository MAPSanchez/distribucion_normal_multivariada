-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2019 at 11:33 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto01_tp`
--

-- --------------------------------------------------------

--
-- Table structure for table `functions`
--

CREATE TABLE `functions` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `function_name` varchar(128) NOT NULL,
  `inf_limit` double NOT NULL,
  `sup_limit` double NOT NULL,
  `max_n` int(11) NOT NULL,
  `graph_image_url` varchar(128) NOT NULL,
  `expression_image_url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `functions`
--

INSERT INTO `functions` (`id`, `name`, `function_name`, `inf_limit`, `sup_limit`, `max_n`, `graph_image_url`, `expression_image_url`) VALUES
(1, 'De Jong\'s Function', 'dejongs_function', -5.12, 5.12, 0, 'functions_images/dejongs_graph.png', 'functions_images/dejongs_expression.png'),
(2, 'Axis Parallel Function', 'axis_parallel', -5.12, 5.12, 0, 'functions_images/axis_parallell_graph.png', 'functions_images/axis_parallell_expression.png'),
(3, 'Rotated hyper-ellipsoid Function', 'rotated_he_function', -65.536, 65.536, 0, 'functions_images/rotated_he_function_graph.png', 'functions_images/rotated_he_function_expression.png'),
(4, 'Rosenbrock\'s valley function', 'rosenbrock_function', -2.048, 2.048, 0, 'functions_images/rosenbrock_function_graph.png', 'functions_images/rosenbrock_function_expression.png'),
(5, 'Rastrigin\'s function', 'rastrigin_function', -5.12, 5.12, 0, 'functions_images/rastrigin_function_graph.png', 'functions_images/rastrigin_function_expression.png'),
(6, 'Schwefel\'s function', 'schwefel_function', -500, 500, 0, 'functions_images/schwefel_function_graph.png', 'functions_images/schwefel_function_expression.png'),
(7, 'Griewangk\'s function', 'griewangks_function', -600, 600, 0, 'functions_images/griewangks_function_graph.png', 'functions_images/griewangks_function_expression.png'),
(8, 'Sum of different power function ', 'sum_of_different_power_function', -1, 1, 0, 'functions_images/sum_of_different_power_function_graph.png', 'functions_images/sum_of_different_power_function_expression.png'),
(9, 'Ackley\'s function', 'ackleys_function', -32.768, 32.768, 0, 'functions_images/ackleys_function_graph.png', 'functions_images/ackleys_function_expression.png'),
(10, 'Langermann\'s function', 'langermanns_function', 0, 10, 0, 'functions_images/langermanns_function_graph.png', 'functions_images/langermanns_function_expression.png'),
(11, 'Michalewic\'s function', 'michalewiczs_function', 0, 3.141592653589793, 0, 'functions_images/michalewiczs_function_graph.png', 'functions_images/michalewiczs_function_expression.png'),
(12, 'Branin\'s function', 'branins_function', -3.141592653589793, 10, 2, 'functions_images/branins_function_graph.png', 'functions_images/branins_function_expression.png'),
(13, 'Easom\'s function', 'easoms_function', -100, 100, 2, 'functions_images/easoms_function_graph.png', 'functions_images/easoms_function_expression.png'),
(14, 'Goldstein-Price\'s function', 'goldstein_prices_function', -2, 2, 2, 'functions_images/goldstein_prices_function_graph.png', 'functions_images/goldstein_prices_function_expression.png'),
(15, 'Six-hump camel back function', 'six_hump_camel_back_function', -3, 3, 2, 'functions_images/six_hump_camel_back_function_graph.png', 'functions_images/six_hump_camel_back_function_expression.png'),
(16, 'Drop Wave function', 'drop_wave_function', -5.12, 5.12, 2, 'functions_images/drop_wave_function_graph.png', 'functions_images/drop_wave_function_expression.png'),
(17, 'Shubert\'s function', 'shuberts_function', -5.12, 5.12, 2, 'functions_images/shuberts_function_graph.png', 'functions_images/shuberts_function_expression.png'),
(18, 'Schaffer\'s function', 'schaffers_function', -1.7976931348623157e208, 10, 2, 'functions_images/schaffers_function_graph.png', 'functions_images/schaffers_function_expression.png'),
(19, 'McCormick function', 'mccormick_function', -3, 4, 2, 'functions_images/mccormick_function_graph.png', 'functions_images/mccormick_function_expression.png'),
(20, 'Multimod function', 'multimod_function', -10, 10, 0, 'functions_images/multimod_function_graph.png', 'functions_images/multimod_function_expression.png'),
(21, 'Exponential function', 'exponential_function', 0, 20, 0, 'functions_images/exponential_function_graph.png', 'functions_images/exponential_function_expression.png'),
(22, 'Moved axis parallel hyper-ellipsoid function', 'moved_axis_parallel_he_function', -5.12, 5.12, 0, 'functions_images/no-image.png', 'functions_images/moved_axis_parallel_he_function_expression.png'),
(23, 'Hansen Function', 'hansen_function', -1.7976931348623156e200, 10, 2, 'functions_images/hansen_function_graph.png', 'functions_images/hansen_function_expression.png');

-- --------------------------------------------------------

--
-- Table structure for table `heuristics`
--

CREATE TABLE `heuristics` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `function_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `heuristics`
--

INSERT INTO `heuristics` (`id`, `name`, `function_name`) VALUES
(1, 'Random Mutation Hill Climber (RMHC)', 'rmhc'),
(2, 'Ecletic Genetic Algorithm (EGA)', 'ega');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `functions`
--
ALTER TABLE `functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `heuristics`
--
ALTER TABLE `heuristics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `functions`
--
ALTER TABLE `functions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `heuristics`
--
ALTER TABLE `heuristics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
