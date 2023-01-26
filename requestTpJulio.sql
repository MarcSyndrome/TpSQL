CREATE DATABASE videotheque CHARACTER SET utf8 COLLATE utf8_general_ci;

USE videotheque;

CREATE USER `marcAdmin`;

GRANT ALL PRIVILEGES ON videotheque.* TO `marcAdmin`;

CREATE TABLE realisateur (
id INT PRIMARY KEY AUTO_INCREMENT,
nomRealisateur VARCHAR(100) NOT NULL,
dateNaissanceRealisateur DATE NOT NULL,
nationalite VARCHAR(100) NOT NULL,
profession VARCHAR(200) NOT NULL,
filmographie VARCHAR(200) NOT NULL,
imageRealisateur VARCHAR(1000) NOT NULL
)engine = InnoDB;

CREATE TABLE film (
id INT PRIMARY KEY AUTO_INCREMENT,
titreFilm VARCHAR(150) NOT NULL,
imageFilm VARCHAR(1000) NOT NULL,
synopsisFilm VARCHAR(255) NOT NULL,
anneeSortieFilm DATE NOT NULL
)engine = InnoDB;

CREATE TABLE serie(
id INT PRIMARY KEY AUTO_INCREMENT,
titreSerie VARCHAR(150) NOT NULL,
imageSerie VARCHAR(1000) NOT NULL,
synopsisSerie VARCHAR(300) NOT NULL,
anneeSortieSerie DATE NOT NULL
)engine = InnoDB;

CREATE TABLE filmRealisateur (
id INT PRIMARY KEY AUTO_INCREMENT,
realisateur_id INT NOT NULL,
film_id INT NOT NULL,
FOREIGN KEY (realisateur_id) REFERENCES realisateur(id),
FOREIGN KEY (film_id) REFERENCES film(id)
)engine = InnoDB;

CREATE TABLE serieRealisateur (
id INT PRIMARY KEY AUTO_INCREMENT,
realisateur_id INT NOT NULL,
serie_id INT NOT NULL,
FOREIGN KEY (realisateur_id) REFERENCES realisateur(id),
FOREIGN KEY (serie_id) REFERENCES serie(id)
)engine = InnoDB;

CREATE TABLE saison (
id INT PRIMARY KEY AUTO_INCREMENT,
indiceSaison INT NOT NULL,
serie_id INT,
FOREIGN KEY (serie_id) REFERENCES serie(id)
)engine = InnoDB;

CREATE TABLE episode (
id INT PRIMARY KEY AUTO_INCREMENT,
indiceEpisode INT NOT NULL,
titreEpisode VARCHAR(255) NOT NULL,
idSaison INT
)engine = InnoDB;

CREATE TABLE genre (
id INT PRIMARY KEY AUTO_INCREMENT,
nomGenre VARCHAR(255) NOT NULL
)engine = InnoDB;

CREATE TABLE genreFilm (
    id INT PRIMARY KEY AUTO_INCREMENT,
    genre_id INT NOT NULL,
    film_id INT NOT NULL,
   FOREIGN KEY (genre_id) REFERENCES genre(id),
   FOREIGN KEY (film_id) REFERENCES film(id)
    )engine = InnoDB;

CREATE TABLE genreSerie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    genre_id INT NOT NULL,
    serie_id INT NOT NULL,
   FOREIGN KEY (genre_id) REFERENCES genre(id),
   FOREIGN KEY (serie_id) REFERENCES serie(id)
    )engine = InnoDB; 


INSERT INTO realisateur (nomRealisateur, dateNaissanceRealisateur, nationalite, profession, filmographie, imageRealisateur) VALUES 
('Rob S. Bowman', '1960-05-15', 'Américaine','Réalisateur, producteur', 'The X-Files: le film , Le Règne du feu', 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQQ5IuQ6FpgZYVk4ft7hiP4b_b04kDvj7PkWg2jYr2i7qZVezncwlRu8UOhnXPZoOYW'),
('Joseph Hill Whedon', '1964-06-23', 'Italien', 'Réalisateur, scénariste, producteur', 'Serenity, Avengers, Beaucoup de bruit pour rien, Avengers : L\'Ère d\'Ultron', 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Joss_Whedon_at_Nerd-HQ_2015.jpg'),
('Marco Brambilla', '1960-09-25', 'Américaine', 'Réalisateur, photographe, Artiste vidéo', 'Demolition Man, Excess Baggage', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Marco_Brambilla.jpg/260px-Marco_Brambilla.jpg'),
('Tom Shadyac', '1958-12-11', 'Américaine', 'Réalisateur, scénariste, producteur de cinéma, écrivain, acteur', '2000 : La Famille Foldingue, 2003 : Bruce tout-puissant, 2007 : Quand Chuck rencontre Larry', 
'https://images.mubicdn.net/images/cast_member/31143/cache-63658-1343152647/image-w856.jpg?size=800x'),
('Anthony David Leighton Scott', '1944-06-21', 'Tynemouth, England', 'Réalisateur, producteur', '1986 Top Gun, 1987 Le flic de Beverly Hills, 2001 Spy Game, 2004 Man on Fire, 2005 Domino', 'https://cinepassion34.fr/wp-content/uploads/2020/01/Tony-Scott-cinepassion34.jpg'),
('Mel Gibson', '1956-01-03', 'Peekskill (État de New York) (États-Unis)', 'Acteur, réalisateur, scénariste, producteur', '1995 : Braveheart, 2004 : La Passion du Christ (The Passion of the Christ), 2006 : Apocalypto',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Mel_Gibson_Cannes_2016.jpg/260px-Mel_Gibson_Cannes_2016.jpg'),
('Steven Spielberg', '1946-12-18', 'Américaine', 'Réalisateur, producteur, scénariste', 'Jurassic Park, E.T. l''extra-terrestre, Indiana Jones, Les dents de la mer, La Liste de Schindler, Les aventuriers de l''arche perdue', 
'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Steven_Spielberg_Masterclass_Cin%C3%A9math%C3%A8que_Fran%C3%A7aise_2_cropped.jpg/260px-Steven_Spielberg_Masterclass_Cin%C3%A9math%C3%A8que_Fran%C3%A7aise_2_cropped.jpg'),
('Chuck Lorre', '1952-10-18', 'Américaine', 'Dramaturge de production, scénariste, producteur de cinéma, réalisateur, directeur de production, compositeur, réalisateur de télévision, producteur de télévision, show runner',
'MASK', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Chuck_Lorre_at_PaleyFest_2013.jpg/260px-Chuck_Lorre_at_PaleyFest_2013.jpg'),
('Jon Bokenkamp', '1974-09-09', 'Américaine', 'Scénariste et Producteur', 'Aucun film a ce jour', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Jon_Bokenkamp_2013_%28cropped%29.jpg/220px-Jon_Bokenkamp_2013_%28cropped%29.jpg'),
('Trop de Réalisateurs', '2020-01-01', 'Multiple', 'Court Métrage', 'Diverses', 'https://upload.wikimedia.org/wikipedia/fr/thumb/0/0d/Love_Death%2BRobots_%28s%C3%A9rie%29_Logo.jpg/220px-Love_Death%2BRobots_%28s%C3%A9rie%29_Logo.jpg'),
('Gregory Nicotero', '1963-03-15', 'Américaine', 'Maquilleur, producteur de cinéma, ingénieur, scénariste, acteur, réalisateur', '1996 : Scream', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Greg_Nicotero_by_Gage_Skidmore_2.jpg/260px-Greg_Nicotero_by_Gage_Skidmore_2.jpg');


INSERT INTO film (titreFilm, imageFilm, synopsisFilm, anneeSortieFilm) VALUES 
('Demolition man', 'https://imgsrc.cineserie.com/2016/11/284625.jpg?ver=1', 'Film d''action de science-fiction', '1993-10-08'),
('Le dernier samaritain','https://fr.web.img4.acsta.net/pictures/22/06/01/14/25/0574663.jpg', 'Film d''action et de drame', '2008-02-14'),
('Jurassic Park', 'https://upload.wikimedia.org/wikipedia/fr/thumb/6/6a/Jurassic_Park_logo.svg/langfr-220px-Jurassic_Park_logo.svg.png', 'Film d''aventure et de science-fiction', '1993-06-11'),
('Braveheart', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Braveheart.svg/langfr-220px-Braveheart.svg.png', 'Film historique écossais', '1995-05-24'),
('Ace Ventura en Afrique', 'https://upload.wikimedia.org/wikipedia/fr/thumb/5/59/Ace_Ventura_en_Afrique.png/220px-Ace_Ventura_en_Afrique.png', 'Film d''aventure comique', '1995-02-10');


INSERT INTO serie (titreSerie, anneeSortieSerie, synopsisSerie, imageSerie)
VALUES ('Le Caméléon', '1996-09-16', 'Tu as pas de personnalité ?, voles en une', 'https://upload.wikimedia.org/wikipedia/fr/thumb/4/4c/Logo_cameleon.jpg/220px-Logo_cameleon.jpg'),
('X Files', '1993-09-10', "Il y a des petits bonhommes vert dedans .... je crois ", 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/The_X-Files_logo.svg/langfr-220px-The_X-Files_logo.svg.png'),
('The Walking Dead','2010-10-31', 'GROOOOAARRRRR', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/The_Walking_Dead_2010_logo.svg/langfr-260px-The_Walking_Dead_2010_logo.svg.png'),
('BlackList', '2013-09-23', "L\'art de retourner les cerveaux, tout en étant criminel", 'https://upload.wikimedia.org/wikipedia/fr/thumb/b/bf/The-Blacklist-logo.png/220px-The-Blacklist-logo.png'),
('Love Death and Robots','2019-03-15' , '..... WTF BRUUUH', 'https://upload.wikimedia.org/wikipedia/fr/thumb/0/0d/Love_Death%2BRobots_%28s%C3%A9rie%29_Logo.jpg/220px-Love_Death%2BRobots_%28s%C3%A9rie%29_Logo.jpg'),
('BigBang Theorie','2007-09-24' , "Il y\'a une vraie fille ici ?", 'https://upload.wikimedia.org/wikipedia/fr/thumb/6/69/BigBangTheory_Logo.png/220px-BigBangTheory_Logo.png');

INSERT INTO genre (nomGenre) VALUES ('Fantasy'), ('Science-fiction'), ('Romance'), ('Thriller'), ('Divertissement'), ('Action'), ('Divers');

INSERT INTO filmRealisateur (film_id, realisateur_id) VALUES
  (
    (SELECT id FROM film WHERE titreFilm  = 'Jurassic Park'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Steven Spielberg')
  ),  (
    (SELECT id FROM film WHERE titreFilm  = 'Demolition man'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Marco Brambilla')
  ),  (
    (SELECT id FROM film WHERE titreFilm  = 'Le dernier samaritain'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Anthony David Leighton Scott')
  ),  (
    (SELECT id FROM film WHERE titreFilm  = 'Braveheart'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Mel Gibson')
  ),  (
    (SELECT id FROM film WHERE titreFilm  = 'Ace Ventura en Afrique'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Tom Shadyac')
  );

  

INSERT INTO serieRealisateur (serie_id, realisateur_id) VALUES
  (
    (SELECT id FROM serie WHERE titreSerie  = 'Le Caméléon'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Trop de Réalisateurs')
  ),  (
    (SELECT id FROM serie WHERE titreSerie  = 'X Files'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Rob S. Bowman')
  ),  (
    (SELECT id FROM serie WHERE titreSerie  = 'The Walking Dead'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Trop de Réalisateurs')
  ),  (
    (SELECT id FROM serie WHERE titreSerie  = 'BlackList'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Jon Bokenkamp')
  ),  (
    (SELECT id FROM serie WHERE titreSerie  = 'Love Death and Robots'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Trop de Réalisateurs')
  ), (
    (SELECT id FROM serie WHERE titreSerie  = 'BigBang Theorie'), 
    (SELECT id FROM Realisateur WHERE nomRealisateur = 'Chuck Lorre')
  );

INSERT INTO genreFilm (genre_id, film_id) VALUES
  (
    (SELECT id FROM genre WHERE nomGenre  = 'Fantasy'), 
    (SELECT id FROM film WHERE titreFilm = 'Jurassic Park')
  ),  (
    (SELECT id FROM genre WHERE nomGenre  = 'Thriller'), 
    (SELECT id FROM film WHERE titreFilm = 'Demolition man')
  ),  (
    (SELECT id FROM genre WHERE nomGenre  = 'Thriller'), 
    (SELECT id FROM film WHERE titreFilm = 'Le dernier samaritain')
  ),  (
    (SELECT id FROM genre WHERE nomGenre  = 'Action'), 
    (SELECT id FROM film WHERE titreFilm = 'Braveheart')
  ),  (
    (SELECT id FROM genre WHERE nomGenre  = 'Divertissement'), 
    (SELECT id FROM film WHERE titreFilm = 'Ace Ventura en Afrique')
  );
  

INSERT INTO genreSerie (genre_id, serie_id) VALUES
  (
    (SELECT id FROM genre WHERE nomGenre  = 'Thriller'), 
    (SELECT id FROM serie WHERE titreSerie = 'BlackList')
  ),
  (
    (SELECT id FROM genre WHERE nomGenre  = 'Divers'), 
    (SELECT id FROM serie WHERE titreSerie = 'Love Death and Robots')
  ),
  (
    (SELECT id FROM genre WHERE nomGenre  = 'Fantasy'), 
    (SELECT id FROM serie WHERE titreSerie = 'The Walking Dead')
  ),
  (
    (SELECT id FROM genre WHERE nomGenre  = 'Fantasy'), 
    (SELECT id FROM serie WHERE titreSerie = 'X Files')
  ),
  (
    (SELECT id FROM genre WHERE nomGenre  = 'Divertissement'), 
    (SELECT id FROM serie WHERE titreSerie = 'Le Caméléon')
  ),
 (
    (SELECT id FROM genre WHERE nomGenre  = 'Divertissement'), 
    (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie')
  );

INSERT INTO saison (indiceSaison, serie_id) VALUES
(1, (SELECT id FROM serie WHERE titreSerie = 'Le Caméléon')),
(2, (SELECT id FROM serie WHERE titreSerie = 'Le Caméléon')),
(3, (SELECT id FROM serie WHERE titreSerie = 'Le Caméléon')),
(4, (SELECT id FROM serie WHERE titreSerie = 'Le Caméléon')),
(5, (SELECT id FROM serie WHERE titreSerie = 'X Files')),
(6, (SELECT id FROM serie WHERE titreSerie = 'X Files')),
(7, (SELECT id FROM serie WHERE titreSerie = 'X Files')),
(8, (SELECT id FROM serie WHERE titreSerie = 'X Files')),
(9, (SELECT id FROM serie WHERE titreSerie = 'X Files')),
(10, (SELECT id FROM serie WHERE titreSerie = 'The Walking Dead')),
(11, (SELECT id FROM serie WHERE titreSerie = 'The Walking Dead')),
(12, (SELECT id FROM serie WHERE titreSerie = 'The Walking Dead')),
(13, (SELECT id FROM serie WHERE titreSerie = 'The Walking Dead')),
(14, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(15, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(16, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(17, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(18, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(19, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(20, (SELECT id FROM serie WHERE titreSerie = 'BlackList')),
(21, (SELECT id FROM serie WHERE titreSerie = 'Love Death and Robots')),
(22, (SELECT id FROM serie WHERE titreSerie = 'Love Death and Robots')),
(23, (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie')),
(24, (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie')),
(25, (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie')),
(26, (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie')),
(27, (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie')),
(28, (SELECT id FROM serie WHERE titreSerie = 'BigBang Theorie'));

INSERT INTO episode (indiceEpisode, titreEpisode, idSaison) VALUES
(1, 'Episode 1', (SELECT id FROM saison WHERE indiceSaison = 1)),
(2, 'Episode 2', (SELECT id FROM saison WHERE indiceSaison = 1)),
(3, 'Episode 3', (SELECT id FROM saison WHERE indiceSaison = 1)),
(4, 'Episode 4', (SELECT id FROM saison WHERE indiceSaison = 1)),
(5, 'Episode 5', (SELECT id FROM saison WHERE indiceSaison = 1)),
(6, 'Episode 1', (SELECT id FROM saison WHERE indiceSaison = 2)),
(7, 'Episode 2', (SELECT id FROM saison WHERE indiceSaison = 2)),
(8, 'Episode 3', (SELECT id FROM saison WHERE indiceSaison = 2)),
(9, 'Episode 4', (SELECT id FROM saison WHERE indiceSaison = 2)),
(10, 'Episode 5', (SELECT id FROM saison WHERE indiceSaison = 2)),
(11, 'Episode 1', (SELECT id FROM saison WHERE indiceSaison = 3)),
(12, 'Episode 2', (SELECT id FROM saison WHERE indiceSaison = 3)),
(13, 'Episode 3', (SELECT id FROM saison WHERE indiceSaison = 3)),
(14, 'Episode 4', (SELECT id FROM saison WHERE indiceSaison = 3)),
(15, 'Episode 1', (SELECT id FROM saison WHERE indiceSaison = 4)),
(16, 'Episode 2', (SELECT id FROM saison WHERE indiceSaison = 4)),
(17, 'Episode 3', (SELECT id FROM saison WHERE indiceSaison = 4)),
(18, 'Episode 4', (SELECT id FROM saison WHERE indiceSaison = 4)),
(19, 'Episode 5', (SELECT id FROM saison WHERE indiceSaison = 4)),
(20, 'Episode 1', (SELECT id FROM saison WHERE indiceSaison = 5)),
(21, 'Episode 2', (SELECT id FROM saison WHERE indiceSaison = 5)),
(22, 'Episode 3', (SELECT id FROM saison WHERE indiceSaison = 5)),
(23, 'Episode 4', (SELECT id FROM saison WHERE indiceSaison = 5)),
(24, 'Episode 5', (SELECT id FROM saison WHERE indiceSaison = 5)),
(25, 'Episode 1', (SELECT id FROM saison WHERE indiceSaison = 6)),
(26, 'Episode 2', (SELECT id FROM saison WHERE indiceSaison = 6)),
(27, 'Episode 3', (SELECT id FROM saison WHERE indiceSaison = 6));

SELECT film.*
FROM film
JOIN filmRealisateur ON filmRealisateur.film_id = film.id
JOIN realisateur ON filmRealisateur.realisateur_id = realisateur.id
WHERE realisateur.nomRealisateur LIKE "%Spielberg%";

SELECT r.nomRealisateur, COUNT(fr.realisateur_id) as nombre_de_films
FROM realisateur r
JOIN filmRealisateur fr ON r.id = fr.realisateur_id
GROUP BY fr.realisateur_id;