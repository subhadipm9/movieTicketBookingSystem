USE MOVIE_TICKET_BOOKING_SYSTEM;
ALTER TABLE MOVIE_DETAILS DROP COLUMN movieDirector;
ALTER TABLE MOVIE_DETAILS RENAME COLUMN movieName TO movie_name;

INSERT INTO MOVIE_DETAILS
VALUES(1,'DUNKI','SRK',180,'EMOTIONAL','2023-12-07');

INSERT INTO movie
VALUES(2,'Action','PRABHAS','S.M',190,'SALAR','2023-12-07');

INSERT INTO MOVIE_DETAILS (movie_name, movie_description, movie_length, genre, release_date, movie_director)
VALUES
    ('The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 142, 'Drama', '1994-09-22', 'Frank Darabont'),
    ('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 175, 'Crime', '1972-03-24', 'Francis Ford Coppola'),
    ('The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 152, 'Action', '2008-07-18', 'Christopher Nolan'),
    ('The Godfather: Part II', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 202, 'Crime', '1974-12-20', 'Francis Ford Coppola'),
    ('The Lord of the Rings: The Return of the King', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 201, 'Fantasy', '2003-12-17', 'Peter Jackson'),
    ('Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 154, 'Crime', '1994-05-21', 'Quentin Tarantino'),
    ('Schindler\'s List', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 195, 'Drama', '1993-11-30', 'Steven Spielberg'),
    ('12 Angry Men', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 96, 'Drama', '1957-04-10', 'Sidney Lumet'),
    ('The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 178, 'Fantasy', '2001-12-19', 'Peter Jackson'),
    ('Forrest Gump', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 142, 'Drama', '1994-06-23', 'Robert Zemeckis');

INSERT INTO MOVIE_DETAILS (movie_name, movie_description, movie_length, genre, release_date, movie_director)
VALUES
    ('Amazon Obhijaan', 'A 2017 adventure film directed by Kamaleswar Mukherjee', 120, 'Adventure', '2017-12-22', 'Kamaleswar Mukherjee'),
    ('Chander Pahar', 'A 2013 adventure film directed by Kamaleswar Mukherjee', 143, 'Adventure', '2013-12-20', 'Kamaleswar Mukherjee'),
    ('Projapoti', 'A 2022 romantic drama film directed by Avijit Sen', 120, 'Romantic Drama', '2022-01-21', 'Avijit Sen'),
    ('Bela Seshe', 'A 2015 family drama film directed by Nandita Roy and Shiboprosad Mukherjee', 120, 'Family Drama', '2015-05-01', 'Nandita Roy and Shiboprosad Mukherjee'),
    ('Haami', 'A 2018 drama film directed by Nandita Roy and Shiboprosad Mukherjee', 120, 'Drama', '2018-05-11', 'Nandita Roy and Shiboprosad Mukherjee'),
    ('Drishyantar', 'A 2018 drama film directed by Atanu Ghosh', 120, 'Drama', '2018-09-14', 'Atanu Ghosh'),
    ('Mayurakshi', 'A 2017 drama film directed by Atanu Ghosh', 120, 'Drama', '2017-12-29', 'Atanu Ghosh'),
    ('Konttho', 'A 2019 drama film directed by Shiboprosad Mukherjee and Nandita Roy', 120, 'Drama', '2019-05-10', 'Shiboprosad Mukherjee and Nandita Roy'),
    ('Gumnaami', 'A 2019 mystery film directed by Srijit Mukherji', 120, 'Mystery', '2019-10-02', 'Srijit Mukherji'),
    ('Drishtikone', 'A 2018 romantic drama film directed by Kaushik Ganguly', 120, 'Romantic Drama', '2018-04-27', 'Kaushik Ganguly');

COMMIT;
SELECT * FROM movie_details;



INSERT INTO THEATER_SCREENING_DETAILS
VALUES(1,1,60,5,'8:25:00','2024-01-04') ;

SELECT * FROM THEATER_SCREENING_DETAILS;
CREATE INDEX index_name ON THEATER_SCREENING_DETAILS (booked_seats);

CREATE TABLE customer_data(
	customer_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cuStomer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL unique,
    customer_password VARCHAR(15) NOT NULL,
    customer_address VARCHAR(255),
    customer_phone INT NOT NULL
    );


INSERT INTO customer_data(CUSTOMER_NAME,CUSTOMER_EMAIL,CUSTOMER_PASSWORD,CUSTOMER_ADDRESS,CUSTOMER_PHONE,seats_booked_by_customer,seat_details,payment_status)
VALUES
('Subhadip','subhadip@cognizant.com','qwertyuiop','Gachibowli','789023456',5,6,1),
('Rakkhosh','rakhesh.hazra@cognizant.com','asdfghjkl','HYDERABAD','1234567890',DEFAULT,5,0);
SELECT * FROM customer_data;
ALTER TABLE customer_data MODIFY column customer_password varchar(255);

CREATE TABLE seat_details(
	seat_id int PRIMARY KEY AUTO_INCREMENT,
    screen_id_booked int,
    customer_id_booked int,
    seats_booked int DEFAULT 0 NOT Null,
    total_paid int,
    foreign key(screen_id_booked) references theater_screening_details(screen_id),
    foreign key( customer_id_booked) references customer_data(customer_id )
);

-- CREATE TABLE payment_details(
-- 	transaction_id INT PRIMARY KEY NOT NULL,
--     payment_method VARCHAR(10) NOT NULL,
--     payment_id INT UNIQUE NOT NULL
-- );
-- ALTER TABLE payment_details MODIFY payment_method VARCHAR(50);
-- INSERT INTO  payment_details
-- VALUES
-- (234523,'PAYTM',718956);
-- SELECT * FROM payment_details;
-- CREATE TABLE booking_confirmation(
-- 	cnf_transaction_id INT,
--     cnf_customer_id INT,
--     cnf_screen_id INT,
--     cnf_booking bool,
--     FOREIGN KEY(cnf_transaction_id) REFERENCES payment_details(transaction_id),
--     FOREIGN KEY(cnf_customer_id) REFERENCES customer_data(customer_id),
--     FOREIGN KEY(cnf_screen_id) REFERENCES THEATER_SCREENING_DETAILS(screen_id)
-- );
-- INSERT INTO booking_confirmation
-- VALUES-- (234523,1,2,TRUE),
-- (789123,1,2,FALSE);
-- SELECT * FROM booking_confirmation;

-- DROP TABLE payment_details;

-- SELECT * FROM movie_details;


-- SELECT CUSTOMER_NAME,CUSTOMER_EMAIL FROM customer_data WHERE customer_id=(SELECT customer_id FROM booking_confirmation WHERE cnf_booking = 1);