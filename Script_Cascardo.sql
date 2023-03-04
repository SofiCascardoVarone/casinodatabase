-- crear schema llamado casino
create schema casino;


-- usar schema casino
use casino;


-- creación de tablas
CREATE TABLE cashier(
    `id_cashier` INT NOT NULL AUTO_INCREMENT,
    `credit` int DEFAULT NULL,
    `full_name` VARCHAR(120) DEFAULT NULL,
    `email` VARCHAR(200) DEFAULT NULL,
    PRIMARY KEY (`id_cashier`)
);

CREATE TABLE social_apps(
app_id int primary key auto_increment,
app_name varchar(100)
);

CREATE TABLE social_media(
account_id int primary key auto_increment,
account_name varchar(100),
account_app int,
followers int,
manager int,
foreign key (manager) references cashier (id_cashier),
foreign key (account_app) references social_apps (app_id)
);

CREATE TABLE lottery_class (
    id_lottery_class INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    class VARCHAR(30)
);

CREATE TABLE lottery (
    id_lottery INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_user INT,
    id_lottery_class int,
    numbers VARCHAR(40),
    bet_date date
);

CREATE TABLE user (
    id_user INT NOT NULL AUTO_INCREMENT,
    credit int DEFAULT NULL,
    username VARCHAR(40),
    password VARCHAR(50),
    PRIMARY KEY (id_user)
);

CREATE TABLE sport_betting(
    `id_sport` INT NOT NULL AUTO_INCREMENT,
    `class` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id_sport`)
);

CREATE TABLE game_class (
    id_game_class INT AUTO_INCREMENT PRIMARY KEY,
    class VARCHAR(30)
);

CREATE TABLE `bet` (
    `id_bet` INT NOT NULL AUTO_INCREMENT,
    `winner` VARCHAR(30) DEFAULT NULL,
    `loser` VARCHAR(30) DEFAULT NULL,
    `id_sport` INT DEFAULT NULL,
    `id_user` INT DEFAULT NULL,
    `bet_amount` int DEFAULT NULL,
    PRIMARY KEY (`id_bet`),
    KEY `id_sport` (`id_sport`),
    KEY `id_user` (`id_user`),
    CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`id_sport`)
        REFERENCES `sport_betting` (`id_sport`),
    CONSTRAINT `bet_ibfk_2` FOREIGN KEY (`id_user`)
        REFERENCES `user` (`id_user`)
);

CREATE TABLE game (
    id_game INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_game_class INT,
    name VARCHAR(30)
);

CREATE TABLE live_game(
    id_live_game INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_game_class INT,
    name VARCHAR(30)
);

CREATE TABLE payment (
    id_payment INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT DEFAULT NULL,
    card_number INT DEFAULT NULL,
    id_cashier INT DEFAULT NULL,
    credit INT
);

CREATE TABLE comments(
id_comment int primary key auto_increment,
id_game int,
id_user int,
comment varchar(300),
foreign key (id_game) references game (id_game),
foreign key (id_user) references user (id_user)
);

CREATE TABLE record (
    id_record INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    balance int,
    id_user INT DEFAULT NULL,
    id_game INT DEFAULT NULL,
    id_bet INT DEFAULT NULL,
    id_lottery int,
    id_cashier INT DEFAULT NULL,
    record_date DATE,
    total INT,
    movement_class VARCHAR(60)
);


-- agregado de llaves foraneas
alter table payment
add FOREIGN KEY (id_user) REFERENCES user (id_user) on delete cascade,
add FOREIGN KEY (id_cashier) REFERENCES cashier (id_cashier);

alter table game
add FOREIGN KEY (id_game_class) REFERENCES game_class (id_game_class);

alter table live_game
add FOREIGN KEY (id_game_class) REFERENCES game_class (id_game_class);

ALTER TABLE lottery
add foreign key (id_lottery_class) references lottery_class (id_lottery_class),
add foreign key (id_user) references user (id_user) on delete cascade;

alter table record
add FOREIGN KEY (id_user) REFERENCES user (id_user) on delete cascade,
add FOREIGN KEY (id_game) REFERENCES game (id_game),
add FOREIGN KEY (id_bet) REFERENCES bet (id_bet),
add FOREIGN KEY (id_lottery) REFERENCES lottery (id_lottery),
add FOREIGN KEY (id_cashier) REFERENCES cashier (id_cashier);


-- inserción de datos
insert into sport_betting (class) values ("football");
insert into sport_betting (class) values ("tennis");
insert into sport_betting (class) values ("basketball");
insert into sport_betting (class) values ("ice hockey");
insert into sport_betting (class) values ("american football");
insert into sport_betting (class) values ("formula 1");
insert into sport_betting (class) values ("cycling");
insert into sport_betting (class) values ("rugby");
insert into sport_betting (class) values ("boxing");
insert into sport_betting (class) values ("MMA");
insert into sport_betting (class) values ("esports");
INSERT INTO game_class (class) VALUES ("scratch");
INSERT INTO game_class (class) VALUES ("slot");
INSERT INTO game_class (class) VALUES ("ruleta");
INSERT INTO game_class (class) VALUES ("blackjack");
INSERT INTO game_class (class) VALUES ("baccarat");
INSERT INTO game_class (class) VALUES ("poker");
insert into social_apps(app_name) values ("tik tok");
insert into social_apps(app_name) values ("twitch");
insert into social_apps(app_name) values ("instagram");
insert into social_apps(app_name) values ("facebook");
insert into social_apps(app_name) values ("youtube");
insert into social_apps(app_name) values ("livee");
insert into game (id_game_class, name) values (1, "aztec realm scratch");
insert into game (id_game_class, name) values (1, "pandamania scratch");
insert into game (id_game_class, name) values (1, "irish riches scratch");
insert into game (id_game_class, name) values (1, "santa´s super scratch");
insert into game (id_game_class, name) values (1, "pirates millions scratch");
insert into game (id_game_class, name) values (1, "doctor love scratch");
insert into game (id_game_class, name) values (1, "volcano eruption scratch");
insert into game (id_game_class, name) values (2, "buffalo blitz");
insert into game (id_game_class, name) values (2, "chilli heat megaways");
insert into game (id_game_class, name) values (2, "wild west gold");
insert into game (id_game_class, name) values (2, "bigger bass bonanza");
insert into game (id_game_class, name) values (2, "leprechaun´s luck");
insert into game (id_game_class, name) values (2, "diamond blitz");
insert into game (id_game_class, name) values (2, "fruit party");
insert into game (id_game_class, name) values (2, "fruit party 2");
insert into game (id_game_class, name) values (2, "joker king");
insert into game (id_game_class, name) values (2, "age of the gods");
insert into game (id_game_class, name) values (2, "thor´s vengeance");
insert into game (id_game_class, name) values (2, "joker jewels");
insert into game (id_game_class, name) values (2, "mustang gold");
insert into game (id_game_class, name) values (2, "5 gold lions");
insert into game (id_game_class, name) values (2, "hot gems");
insert into game (id_game_class, name) values (2, "age of the gods: god of storms");
insert into game (id_game_class, name) values (2, "age of the gods maze keeper");
insert into game (id_game_class, name) values (3, "age of the gods roulette");
insert into game (id_game_class, name) values (3, "age of the gods spin a win");
insert into game (id_game_class, name) values (3, "european roulette");
insert into game (id_game_class, name) values (3, "blazing 7s roulette");
insert into game (id_game_class, name) values (3, "age of the gods roulette");
insert into game (id_game_class, name) values (3, "100 to 1 roulette");
insert into game (id_game_class, name) values (3, "american roulette");
insert into game (id_game_class, name) values (3, "mega fire blaze roulette");
insert into game (id_game_class, name) values (4, "multihand blackjack");
insert into game (id_game_class, name) values (4, "american blackjack");
insert into game (id_game_class, name) values (4, "quantum blackjack");
insert into game (id_game_class, name) values (4, "low stakes blackjack");
insert into game (id_game_class, name) values (4, "blazing 7s blackjack");
insert into game (id_game_class, name) values (5, "first person baccarat");
insert into game (id_game_class, name) values (5, "dragon bonus baccarat");
insert into game (id_game_class, name) values (6, "three card poker");
insert into game (id_game_class, name) values (6, "let it ride");
insert into game (id_game_class, name) values (6, "four card poker");
insert into game (id_game_class, name) values (6, "casino stud");
insert into game (id_game_class, name) values (6, "crazy4poker");
insert into game (id_game_class, name) values (6, "american stars");
insert into game (id_game_class, name) values (6, "bonus poker");
insert into live_game (id_game_class, name) values (3, "live dream wheeler");
insert into live_game (id_game_class, name) values (4, "live infinite blackjack");
insert into live_game (id_game_class, name) values (6, "ultimate texas holdem");
insert into live_game (id_game_class, name) values (3, "lightining auto roulette");
insert into live_game (id_game_class, name) values (3, "live auto roulette");
insert into live_game (id_game_class, name) values (5, "baccarat esqueeze");
insert into live_game (id_game_class, name) values (4, "all bets blackjack");
insert into live_game (id_game_class, name) values (5, "peek baccarat live");
insert into live_game (id_game_class, name) values (2, "live slots buffalo blitz");
insert into live_game (id_game_class, name) values (5, "baccarat loby");
INSERT INTO cashier (credit, full_name, email) VALUES (456000, "gabriela ramirez", "gabir@hotmail.com");
INSERT INTO cashier (credit, full_name, email) VALUES (8734000, "rolando bibel", "bibelrolando@gmail.com");
INSERT INTO cashier (credit, full_name, email) VALUES (1000000, "sandra esposito", "esposito@gmail.com");
INSERT INTO cashier (credit, full_name, email) VALUES (9805000, "yara maldonado", "yaraceleste@hotmail.com");
INSERT INTO cashier (credit, full_name, email) VALUES (12000000, "marcos salvi", "salvimarcos@hotmail.com");
INSERT INTO social_media(account_name, account_app, followers, manager) values ("casino32premium", 1, 29000, 2);
INSERT INTO social_media(account_name, account_app, followers, manager) values ("casinocasino32", 5, 2000, 4);
INSERT INTO social_media(account_name, account_app, followers, manager) values ("bet32", 4, 59900, 2);
INSERT INTO social_media(account_name, account_app, followers, manager) values ("bettinghighlights", 3, 1000605, 1);
INSERT INTO social_media(account_name, account_app, followers, manager) values ("bet_casino_oficial", 2, 150003, 1);
INSERT INTO social_media(account_name, account_app, followers, manager) values ("365casino", 1, 894213, 5);
insert into user (credit, username, password) values (3000,"clara123", "aaa111");
insert into user (credit, username, password) values (2000,"sukisuki", "876932");
insert into user (credit, username, password) values (3700,"bocajrs","riquelme123");
insert into user (credit, username, password) values (2500,"fran88","88888");
insert into user (credit, username, password) values (12000,"usuario093","12345");
insert into user (credit, username, password) values (70000,"scv123","aaa123");
insert into user (credit, username, password) values (22000,"gary33","904334");
insert into user (credit, username, password) values (15000,"usuario32","casino3232");
INSERT INTO comments(id_game, id_user, comment) values (22, 8, "me encanto!");
INSERT INTO comments(id_game, id_user, comment) values (14, 4, "lo recomiendo, super entretenido");
INSERT INTO comments(id_game, id_user, comment) values (27, 8, "gran juego!");
INSERT INTO comments(id_game, id_user, comment) values (16, 1, "excelente, no puedo parar de jugarlos!");
INSERT INTO comments(id_game, id_user, comment) values (2, 3, "buenos graficos");
INSERT INTO comments(id_game, id_user, comment) values (2, 2, "que genial!");
INSERT INTO comments(id_game, id_user, comment) values (14, 2, "da grandes ganancias, seguire jugandolo");
INSERT INTO comments(id_game, id_user, comment) values (8, 1, "gran juego, muy entretenido");
insert into payment ( id_user, card_number, id_cashier, credit) values (1, 32145874, 1, 1500);
insert into payment ( id_user, card_number, id_cashier, credit) values ( 2, 98678244, 2, 1500);
insert into payment ( id_user, card_number, id_cashier, credit) values (3, 59876872, 4, 3000);
insert into payment ( id_user, card_number, id_cashier, credit) values (4, 98768934, 5, 500);
insert into payment ( id_user, card_number, id_cashier, credit) values ( 5, 57890432, 1, 15000);
insert into payment ( id_user, card_number, id_cashier, credit) values (1, 32145874, 1, 3000);
insert into payment ( id_user, card_number, id_cashier, credit) values ( 6, 32198756, 3, 70000);
insert into payment ( id_user, card_number, id_cashier, credit) values (7, 79789869, 5, 12000);
insert into payment ( id_user, card_number, id_cashier, credit) values (8, 34578933, 2, 15000);
insert into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+1500, 1, 1, "credit charge", "2022-07-13", 1500);
insert into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+1500, 2, 2, "credit charge", "2022-07-13", 1500);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-100, 1, 14, "game loss", "2022-07-13", 1400);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+700, 1, 14, "game win", "2022-07-13", 2100);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-1100, 1, 14, "game loss", "2022-07-13", 1000);
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+3000, 3, 4, "credit charge", "2022-07-23", 3000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-100, 3, 32, "game loss", "2022-07-23", 2900);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+300, 2, 46, "game win", "2022-07-30", 1800);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+700, 2, 45, "game win", "2022-07-30", 2500);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+200, 3, 12, "game win", "2022-08-02", 3100);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-500, 3, 12, "game loss", "2022-08-02", 2600);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+1900, 3, 14, "game win", "2022-08-02", 5000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+4900, 3, 14, "game win", "2022-08-02", 7000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+2900, 3, 15, "game win", "2022-08-02", 9900);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+700, 1, 35, "game win", "2022-08-07", 1700);
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+500, 4, 5, "credit charge", "2022-08-29", 500);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-6000, 3, 17, "game loss", "2022-08-29", 3900); 
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+15000, 5, 1, "credit charge", "2022-09-10", 15000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-1700, 1, 31, "game loss", "2022-09-10", 0);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-500, 2, 14, "game loss", "2022-09-16", 2000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+300, 3, 29, "game win", "2022-09-16", 4200);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+300, 3, 31, "game win", "2022-09-16", 4500);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+2000, 4, 3, "game win", "2022-09-21", 2500);
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+3000, 1, 1, "credit charge", "2022-10-03", 3000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-2000, 4, 17, "game loss", "2022-10-08", 500);
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+70000, 6, 3, "credit charge", "2022-10-21", 70000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-800, 3, 27, "game loss", "2022-10-21", 3700);
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+12000, 7, 5, "credit charge", "2022-11-01", 12000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (-5000, 5, 6, "game loss", "2022-11-04", 10000);
INSERT into record (balance, id_user, id_game, movement_class, record_date, total) values (+10000, 7, 34, "game win", "2022-11-20", 22000);
INSERT into record (balance, id_user, id_cashier, movement_class, record_date, total) values (+15000, 8, 2, "credit charge", "2022-11-20", 15000);
insert into bet (winner, loser, id_sport, id_user, bet_amount) values ("boca", "river", 1, 3, 1500);
insert into record (balance, id_user, id_bet, record_date, total, movement_class) values (-700, 3, 1, "2022-11-21", 3000, "bet loss");
insert into bet (winner, loser, id_sport, id_user, bet_amount) values ("namajunas", "zhang", 10, 8, 6000);
insert into record (balance, id_user, id_bet, record_date, total, movement_class) values (12000, 8, 2, "2022-11-22", 27000, "bet win");
insert into bet (winner, loser, id_sport, id_user, bet_amount) values ("chisora", "fury", 9, 8, 7000);
insert into record (balance, id_user, id_bet, record_date, total, movement_class) values (7000, 8, 3, "2022-11-25", 20000, "bet loss");
insert into bet (winner, id_sport, id_user, bet_amount) values ("verstappen", 6, 5, 2500);
insert into record (balance, id_user, id_bet, record_date, total, movement_class) values (+2500, 5, 4, "2022-11-25", 7500, "bet win");
INSERT INTO lottery_class (class) values ("Loto Plus");
INSERT INTO lottery_class (class) values ("Loto Plus Desquite");
INSERT INTO lottery_class (class) values ("Loto Plus Sale o Sale");
INSERT INTO lottery_class (class) values ("Loto 5 Plus");
INSERT INTO lottery_class (class) values ("Quini 6");
INSERT INTO lottery_class (class) values ("Quini 6 Revancha");
INSERT INTO lottery_class (class) values ("Quini 6 Siempre Sale");
INSERT INTO lottery_class (class) values ("Brinco");
INSERT INTO lottery_class (class) values ("Telekino");
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (2, "03, 05, 13, 15, 21, 31", "2022-11-26", 6);
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (3, "01, 06, 07, 15, 21", "2022-11-26", 4);
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (2, "03, 05, 13, 15, 21, 31", "2022-11-28", 6);
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (7, "03, 06, 12, 15, 36, 39", "2022-12-02", 8);
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (4, "01, 02, 11, 12, 21, 22", "2022-12-02", 3);
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (3, "11, 13, 17, 21, 24", "2022-12-04", 4);
INSERT INTO lottery(id_user, numbers, bet_date, id_lottery_class) values (2, "03, 05, 13, 15, 21, 31", "2022-12-06", 6);
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (+3500, 2,1,'2022-11-26', 5500, "lottery win");
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (-80, 3,2,'2022-11-26', 19920, "lottery loss");
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (-75,2,3,'2022-11-28', 5425, "lottery loss");
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (+10000,7,4,'2022-12-02', 32000, "lottery win");
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (-130,4,5,'2022-12-02', 370, "lottery loss");
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (-80,3,6,'2022-12-04', 19840, "lottery loss");
insert into record(balance, id_user, id_lottery, record_date, total, movement_class) values (-75,2,7,'2022-12-06', 5350, "lottery loss");
update user set credit = 5350 where id_user = 2; 
update user set credit = 19840 where id_user = 3;
update user set credit = 370 where id_user = 4;
update user set credit = 32000 where id_user = 7;


-- vistas (desafio)
-- 1) vista que muestra las cargas de credito
CREATE VIEW cash_cashier AS
SELECT
c.id_cashier
, p.id_user
, p.credit
FROM
cashier AS c
INNER JOIN 
payment AS p ON p.id_cashier = c.id_cashier;

-- 2) vista que muestra los tipos de juego que tiene age of the gods
CREATE VIEW aotg_games AS
    SELECT 
        g.id_game, c.class, g.name
    FROM
        game AS g
            INNER JOIN
        game_class AS c ON c.id_game_class = g.id_game_class
    WHERE
        g.name LIKE '%age of the gods%';

-- 3) vista que muestra la mayor carga
CREATE VIEW max_charge AS
    SELECT 
        p.id_payment, p.id_user, p.credit
    FROM
        payment AS p
    ORDER BY p.credit DESC
    LIMIT 1;

-- 4) vista que muestra los jugadores de scratch
CREATE VIEW scratch_players AS
    SELECT 
        u.username, g.name
    FROM
        user AS u
            INNER JOIN
        record AS r ON r.id_user = u.id_user
			INNER JOIN
		game as g on g.id_game = r.id_game
    WHERE
        r.id_game between 1 and 7 ;

-- 5) muestra apuestas ganadas y el deporte de la apuesta
CREATE VIEW won_bets AS
    SELECT 
        r.id_user
        , r.id_bet
        , s.class
    FROM
        bet AS b
            INNER JOIN
        sport_betting AS s ON b.id_sport = s.id_sport
			INNER JOIN
		record as r on r.id_bet = b.id_bet
    WHERE
        r.movement_class = "bet win";
        
 -- 6) muestra movimientos de los juegos     
        CREATE VIEW game_mov AS
    SELECT 
        r.id_bet, u.username, g.name, r.balance
    FROM
        user AS u
            INNER JOIN
        record AS r ON r.id_user = u.id_user
			INNER JOIN
		game as g on g.id_game = r.id_game;
        
 -- 7) muestra movimientos de las apuestas             
        CREATE VIEW bet_mov AS
    SELECT 
        r.id_bet, u.username, s.class, r.balance
    FROM
        bet AS b
            INNER JOIN
        sport_betting AS s ON b.id_sport = s.id_sport
			INNER JOIN
		record as r on r.id_bet = b.id_bet
        inner join
        user as u on u.id_user = r.id_user;
        
 -- 8) muestra movimientos de la loteria        
        CREATE VIEW lottery_mov AS
    SELECT 
        r.id_lottery, u.username, c.class, l.numbers, r.balance
    FROM
        lottery AS l
            INNER JOIN
        lottery_class AS c ON c.id_lottery_class = l.id_lottery_class
			INNER JOIN
		record as r on r.id_lottery = l.id_lottery
        inner join
        user as u on u.id_user = r.id_user;
        
        
        -- funciones (desafio)        
		-- 1)calcula bonificación
   DELIMITER $$
CREATE FUNCTION bonus_calculation (credit int, percentage int)
  RETURNS int
  no sql
BEGIN

  DECLARE total int;
  DECLARE bonus int;
	SET bonus = (percentage/100);
    SET total = (credit+(credit*bonus));


  RETURN total;
END
$$  

		-- 2)facilita username poniendo el id de jugador
DELIMITER $$
CREATE FUNCTION player_user (id int)
  RETURNS varchar(40)
  deterministic
BEGIN
	DECLARE player varchar(40);	
    SELECT username
    into player
    FROM user
    WHERE id_user = id;
  RETURN player;
END
$$


        -- stored procedures (desafio)
		-- 1)ordena tabla record en orden descendente por el campo pedido
DELIMITER $$
CREATE PROCEDURE order_record(IN field CHAR(20))
BEGIN
DECLARE r_order VARCHAR(100);
DECLARE query_to_execute  VARCHAR(200);	
    IF field <> " " THEN
	SET @r_order = CONCAT(" ORDER BY ", field, " DESC ");
	END IF;
SET @query_to_execute = CONCAT(" SELECT * FROM record ", @r_order);
SELECT @query_to_execute;
PREPARE run FROM @query_to_execute;
EXECUTE run;
deallocate prepare run;
END
$$;

		-- 2)elimina cajero poniendo su id
DELIMITER $$
CREATE PROCEDURE delete_cashier(IN id_cashier_param CHAR(255))
BEGIN
    SET @query_to_execute = CONCAT(' DELETE FROM cashier WHERE id_cashier = ', id_cashier_param);
    PREPARE run FROM @query_to_execute;
    EXECUTE run;
    DEALLOCATE PREPARE run;
END$$


-- triggers

create table payment_log(
id_log int primary key auto_increment,
log_id_user int,
log_id_cashier int,
log_credit int,
log_date date,
log_time time,
log_system_user varchar(100)
);

-- 1) al insertar un pago en payment agrega el movimiento a la tabla record y a una bitacora de payment
delimiter $$
create trigger tr_payment_before
before insert on payment
for each row
begin
insert into payment_log (log_id_user, log_id_cashier, log_credit, log_date, log_time, log_system_user)
values (new.id_user, new.id_cashier, new.credit, curdate(), curtime(), system_user() );
insert into record  (balance, id_user, id_cashier, record_date, movement_class)
values (new.credit, new.id_user, new.id_cashier, curdate(), "credit charge");
end;

-- 2) al insertar un pago en payment modifica el credito actual del usuario
delimiter $$
create trigger tr_payment_after
after insert on payment
for each row
begin
update user
set credit = credit + new.credit
where id_user = new.id_user;
end $$
delimiter ;


	-- sublenguaje DCL

-- 1) creación de usuario que sólo puede leer información
create user "1@localhost";
grant select on *.* to "1@localhost";

-- 2) creación de usuario que puede leer, modificar e insertar datos
create user "2@localhost";
grant select, insert, update on *.* to "2@localhost";



	-- sublenguaje TCL

-- para que permita eliminar los datos de la transacción
SET sql_safe_updates=0;

-- 1) En la primera tabla, si tiene registros, deberás eliminarlos usando transacción. 
start transaction; 
delete from social_media;
-- rollback;
-- commit;

-- 2) En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción.
start transaction; 
insert into comments(id_game, id_user, comment) values(13,1,"excelente");
insert into comments(id_game, id_user, comment) values(15,3,"me fascino");
insert into comments(id_game, id_user, comment) values(8,1,"no da premios, aburrido");
insert into comments(id_game, id_user, comment) values(5,4,"muy bueno");
savepoint comentarios1a4;
insert into comments(id_game, id_user, comment) values(1,7,"no lo jueguen perderan su dinero");
insert into comments(id_game, id_user, comment) values(21,5,"muy atrapante");
insert into comments(id_game, id_user, comment) values(12,6,"muy malo");
insert into comments(id_game, id_user, comment) values(23,2,"me encanto!!");
savepoint comentarios5a8;
-- release savepoint comentarios1a4;









