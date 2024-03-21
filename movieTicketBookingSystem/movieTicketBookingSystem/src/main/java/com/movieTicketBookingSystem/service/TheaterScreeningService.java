package com.movieTicketBookingSystem.service;


import java.sql.Date;
import java.util.List;
import java.util.Optional;

import com.movieTicketBookingSystem.model.TheaterScreening;

public interface TheaterScreeningService {
	public TheaterScreening setTheaterScreening(TheaterScreening theaterScreening);
	public List<TheaterScreening> getAllTheaterScreeningDetails();
	public TheaterScreening getTheaterScreenDetailsUsingDateAndTime(Date dateId, String timeId,int screenNo);
	
	public void deleteTheater(int screenId);
	public boolean addMovieToTheater(TheaterScreening theaterScreening);
	public void setSeatNumbers(int theaterId,int noOfSeats);
	public List<TheaterScreening> getTheaterDetailsOnMovie(int movieId);
	public Optional<TheaterScreening> getTheaterScreeningById(int screenIdBooked);
	public void setCancelSeatNumbers(int screenId, int noOfSeats);
	
}
