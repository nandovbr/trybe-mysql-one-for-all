DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(255),
    plan_value DEC(5 , 2 )
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255),
    user_date_signature DATE,
    user_age INT,
    plan_id INT,
    FOREIGN KEY (plan_id)
        REFERENCES plans (plan_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255),
    album_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(255),
    album_id INT,
    seconds INT,
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.historic (
    user_id INT,
    song_id INT,
    reproduction_date DATETIME,
    CONSTRAINT PK_history PRIMARY KEY (user_id , song_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id)
)  ENGINE=INNODB;

CREATE TABLE SpotifyClone.following_artists(
    user_id INT,
    artist_id INT,
    CONSTRAINT PRIMARY KEY (user_id , artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.plans (plan_id, plan_name, plan_value) VALUES
(1, 'gratuito', 0.00),
(2, 'familiar', 7.99),
(3, 'pessoal', 6.99),
(4, 'universitario', 5.99);

INSERT INTO SpotifyClone.users (user_id, user_name, user_date_signature, user_age, plan_id) VALUES
(1, 'Thati', '2019-10-20', 23, 1), 
(2, 'Cintia', '2017-12-30', 35, 2), 
(3, 'Bill', '2019-06-05', 20, 4), 
(4, 'Roger', '2020-05-13', 45, 3),
(5, 'Norman', '2017-02-17', 58, 3),
(6, 'Patrick', '2017-01-06', 33, 2),
(7, 'Vivian', '2018-01-05', 26, 4),
(8, 'Carol', '2018-02-14', 19, 4),
(9, 'Angelina', '2018-04-29', 42, 2),
(10, 'Paul', '2017-01-17', 46, 2);

INSERT INTO SpotifyClone.artist (artist_id, artist_name) VALUES
(1, 'Walter Phoenix'), 
(2, 'Peter Strong'), 
(3, 'Lance Day'), 
(4, 'Freedie Shannon'),
(5, 'Tyler Isle'),
(6, 'Fog');

INSERT INTO SpotifyClone.albums(album_id, album_name, artist_id, album_year) VALUES 
(1, 'Envious', 1, 1990),
(2, 'Exuberant', 1, 1993),
(3, 'Hallowed Steam', 2, 1995),
(4, 'Incandescent', 3, 1998),
(5, 'Temporary Culture', 4, 2001),
(6, 'Library of liberty', 4, 2003),
(7, 'Chained Down', 5, 2007),
(8, 'Cabinet of fools', 5, 2012),
(9, 'No guarantees', 5, 2015),
(10, 'Apparatus', 6, 2015);

/*Alguns tem áspas duplas porque o nome da música possui uma áspa simples.*/
INSERT INTO SpotifyClone.songs(song_id, song_name, album_id, seconds) VALUES
(1, 'Soul For Us', 1, 200),
(2, 'Reflections Of Magic', 1, 163),
(3, 'Dance With Her Own', 1, 116),
(4, 'Troubles Of My Inner Fire', 2, 203),
(5, 'Time Fireworks', 2, 152),
(6, 'Magic Circus', 3, 105),
(7, 'Honey, So Do I', 3, 207),
(8, "Sweetie, Let's Go Wild", 3, 139),
(9, 'She Knows', 3, 244),
(10, 'Fantasy For Me', 4, 100),
(11, 'Celebration Of More', 4, 146),
(12, 'Rock His Everything', 4, 223),
(13, 'Home Forever', 4, 231),
(14, 'Diamond Power', 4, 241),
(15, "Let's Be Silly", 4, 132),
(16, 'Thang Of Thunder', 5, 240),
(17, 'Words Of Her Life', 5, 185),
(18, 'Without My Streets', 5, 176),
(19, 'Need Of The Evening', 6, 190),
(20, 'History Of My Roses', 6, 222),
(21, 'Without My Love', 6, 111),
(22, 'Walking And Game', 6, 123),
(23, 'Young And Father', 6, 197),
(24, 'Finding My Traditions', 7, 179),
(25, 'Walking And Man', 7, 229),
(26, 'Hard And Time', 7, 135),
(27, "Honey. I'm A Lone Wolf", 7, 150),
(28, 'She Thinks I Wint Stay Toninght', 8, 166),
(29, 'He Heard Youre Bad For Me', 8, 154),
(30, 'He Hopes We Cant Stay', 8, 210),
(31, 'I Know I Know', 8, 117),
(32, 'Hes Walking Away', 9, 159),
(33, 'Hes Troube', 9, 138),
(34, 'I Heard I Want To Bo Alone', 9, 120),
(35, 'I Ride Alone', 9, 151),
(36, 'Honey', 10, 79),
(37, 'You Cheated On Me', 10, 95),
(38, 'Wouldnt It Be Nice', 10, 213),
(39, 'Baby', 10, 136),
(40, 'You Make Me Feel So..', 10, 83);

INSERT INTO SpotifyClone.historic(user_id, song_id, reproduction_date) VALUES
(1, 36, '2020-02-28 10:45:55'),
(1, 25, '2020-05-02 05:30:35'),
(1, 23, '2020-03-06 11:22:33'),
(1, 14, '2020-08-05 08:05:17'),
(1, 15, '2020-09-14 16:32:22'),
(2, 34, '2020-01-02 07:40:33'),
(2, 24, '2020-05-16 06:16:22'),
(2, 21, '2020-10-09 12:27:48'),
(2, 39, '2020-09-21 13:14:46'),
(3, 6, '2020-11-13 16:55:13'),
(3, 3, '2020-12-05 18:38:30'),
(3, 26, '2020-07-30 10:00:00'),
(4, 2, '2021-08-15 17:10:10'),
(4, 35, '2021-07-10 15:20:30'),
(4, 27, '2021-01-09 01:44:33'),
(5, 7, '2020-07-03 19:33:28'),
(5, 12, '2017-02-24 21:14:22'),
(5, 14, '2020-08-06 15:23:43'),
(5, 1, '2020-11-10 13:52:27'),
(6, 38, '2019-02-07 20:33:48'),
(6, 29, '2017-01-24 00:31:17'),
(6, 30, '2017-10-12 12:35:20'),
(6, 22, '2018-05-29 14:56:41'),
(7, 5, '2018-05-09 22:30:49'),
(7, 4, '2020-07-27 12:52:58'),
(7, 11, '2018-01-16 18:40:43'),
(8, 39, '2018-03-21 16:56:40'),
(8, 40, '2020-10-18 13:38:05'),
(8, 32, '2019-05-25 08:14:03'),
(8, 33, '2021-08-15 21:37:09'),
(9, 16, '2021-05-24 17:23:45'),
(9, 17, '2018-12-07 22:48:52'),
(9, 8, '2021-03-14 06:14:26'),
(9, 9, '2020-04-01 03:36:00'),
(10, 20, '2017-02-06 08:21:34'),
(10, 21, '2017-12-04 05:33:43'),
(10, 12, '2017-07-27 05:24:49'),
(10, 13, '2017-12-25 01:03:57');

INSERT INTO SpotifyClone.following_artists(user_id, artist_id) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 3),
(6, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 5),
(9, 6),
(9, 4),
(9, 3),
(10, 2),
(10, 6);
