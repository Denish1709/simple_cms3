-- Adminer 4.8.0 MySQL 5.5.5-10.5.17-MariaDB-1:10.5.17+maria~ubu2004 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comments` (`id`, `comments`, `created_at`, `post_id`, `user_id`) VALUES
(1,	'123',	'2023-06-13 01:59:21',	10,	2),
(2,	'hi',	'2023-06-13 02:02:51',	5,	2),
(3,	'stupid',	'2023-06-13 02:03:19',	6,	2),
(4,	'awertg',	'2023-06-13 02:24:42',	10,	2),
(5,	'wertfrf',	'2023-06-13 02:25:50',	10,	4);

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `user_2` (`user`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `posts` (`id`, `title`, `content`, `status`, `created_at`, `user`) VALUES
(5,	'tareef iman',	'halal f\r\nfwefwe\r\nefefwef\r\nfgwfwyedjgeyurf',	'publish',	'2023-05-31 04:05:49',	2),
(6,	'alvin ',	'ertrfgfgvfbfvdvdv',	'publish',	'2023-05-31 01:43:04',	2),
(10,	'good morning',	'ms alvin',	'publish',	'2023-05-31 02:21:42',	2),
(13,	'stupid alvin',	'always stupid\r\n\r\nneed more brain cell\r\nand milk',	'pending',	'2023-05-31 05:31:18',	2),
(15,	'stupid alvin',	'alvin and shawn',	'pending',	'2023-05-31 05:31:22',	2);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `role` text NOT NULL DEFAULT 'user',
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `added_on`) VALUES
(2,	'pig',	'pig@gmail.com',	'$2y$10$nmBbBvHy0YlhNBlJGOKKYeFP8C9dAJO8NQ3oQd6zFICQGY5OkJB9m',	'admin',	'2023-06-12 04:01:34'),
(4,	'dato lee',	'lee@gmail.com',	'$2y$10$cKmrxZqVdaBuDtfcsW6eYeZHGGPafi9.CpFfuWnXFvBHWhvSOXaX2',	'user',	'2023-05-25 06:50:27'),
(7,	'fok',	'fok@gmail.com',	'$2y$10$tCvQykrLJ9.dLHjIuowFBeNpR.gPEg3KUlIfe3eps.hobntbJU0kW',	'user',	'2023-05-31 05:32:31'),
(15,	'piggy',	'piggy@gmail.com',	'$2y$10$1Syjb14l.ltovn1oJnN.WeS.98U7/GI76F8kddZ1ziAwoqBo1B3Eu',	'user',	'2023-06-13 02:04:41');

-- 2023-06-13 14:53:09
