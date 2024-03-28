CREATE DATABASE MOVIE_TICKET_BOOKIG_SYSTEM;

USE MOVIE_TICKET_BOOKIG_SYSTEM;
CREATE TABLE MOVIE_DETAILS(
	movie_id int PRIMARY KEY,
    movie_name VARCHAR(50),
    movie_description VARCHAR(255),
    movie_director VARCHAR(20),
    movie_length int,
    genre VARCHAR(20),
    relase_date varchar(10),
    trailer_link VARCHAR(255)
);
ALTER TABLE movie_details MODIFY COLUMN movie_description TEXT;

USE MOVIE_TICKET_BOOKIG_SYSTEM;
INSERT INTO movie_details(id,movie_name,movie_description,movie_director,movie_length,genre,screen_number,total_seats,avl_seats)
VALUES(1,'DUNKI','Sharuk Khan','Rajkumar Hirani',120,'Funny',3,60,54);

SELECT * FROM movie_details;
UPDATE `movie_ticket_bookig_system`.`movie_details` SET `relase_date` = '8-12-2023' WHERE (`id` = '1');
SELECT * FROM EMPLOYEE;
SELECT*FROM movie_details;

CREATE TABLE THEATER_SCREENING_DETAILS(
	screen_id int auto_increment PRIMARY KEY,
    movie_id_for_screen int  not null,
    total_seats int  not null,
    booked_seats int not null,
    start_time VARCHAR(8),
    movie_date DATE  not null,
    ticket_price int NOT NULL,
    screen_no int NOT NULL,
    foreign key(movie_id_for_screen) references MOVIE_DETAILS(movie_id)
);
ALTER TABLE THEATER_SCREENING_DETAILS RENAME COLUMN movieIdForScreen TO movie_id_for_screen;
ALTER TABLE theater_screening_details MODIFY COLUMN ticket_price int NOT NULL;

CREATE TABLE customer_data(
	customer_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cuStomer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL unique,
    customer_password VARCHAR(15) NOT NULL,
    customer_address VARCHAR(255),
    customer_phone INT NOT NULL
);

CREATE TABLE seat_details(
	seat_id int PRIMARY KEY AUTO_INCREMENT,
    screen_id_booked int,
    customer_id_booked int,
    seats_booked int DEFAULT 0 NOT Null,
    total_paid int,
    foreign key(screen_id_booked) references theater_screening_details(screen_id),
    foreign key( customer_id_booked) references customer_data(customer_id )
);