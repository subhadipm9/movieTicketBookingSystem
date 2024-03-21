package com.movieTicketBookingSystem.service;


import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.movieTicketBookingSystem.model.TheaterScreening;
import com.movieTicketBookingSystem.repository.TheaterScreeningRepository;

@Service
public class TheaterScreeningServiceImpl implements TheaterScreeningService {
	
	@Autowired
	private TheaterScreeningRepository theaterScreeningRepository;
	
	@Override
	public TheaterScreening setTheaterScreening(TheaterScreening theaterScreening) {
		
		return theaterScreeningRepository.save(theaterScreening);
	}

	@Override
	public List<TheaterScreening> getAllTheaterScreeningDetails() {
		
		return theaterScreeningRepository.findAll();
	}



	@Override
	public void deleteTheater(int screenId) {
		
		theaterScreeningRepository.deleteById(screenId);
	}

	@Override
	public TheaterScreening getTheaterScreenDetailsUsingDateAndTime(Date dateId, String timeId,int screenNo) {
		
		List<TheaterScreening> theaterDetailsOptional = theaterScreeningRepository.findByScreenNo(screenNo);
		if(theaterDetailsOptional.isEmpty()) {
			return null;
		}
		else {
			for(TheaterScreening tScreening:theaterDetailsOptional) {
				if(tScreening.getMovieDate().equals(dateId) && tScreening.getStartTime().equalsIgnoreCase(timeId)) {
					return tScreening;
				}
			}
		}
		return null;
	}

	
	@Override
	public boolean addMovieToTheater(TheaterScreening theaterScreening) {
		
		TheaterScreening theaterScreeningCheck = getTheaterScreenDetailsUsingDateAndTime(theaterScreening.getMovieDate(), theaterScreening.getStartTime(),theaterScreening.getScreenNo());
		if(theaterScreeningCheck != null) {
			return false;
			
		}
		theaterScreeningRepository.save(theaterScreening);
		return true;
		
	}

	@Override
	public void setSeatNumbers(int theaterId, int noOfSeats) {
		Optional<TheaterScreening> setTheaterScreeningSeatOptional = theaterScreeningRepository.findById(theaterId);
		if(setTheaterScreeningSeatOptional.isPresent()) {
			TheaterScreening theaterSeat = setTheaterScreeningSeatOptional.get();
			theaterSeat.setBookedSeats(theaterSeat.getBookedSeats()+noOfSeats);
//			theaterScreeningRepository.save(theaterSeat);
		}
	}

	@Override
	public List<TheaterScreening> getTheaterDetailsOnMovie(int movieId) {
		
		List<TheaterScreening> theaterDetails = theaterScreeningRepository.findAllByMovieIdForScreen(movieId);
		if(theaterDetails==null) {
			return null;
		}
		return theaterDetails;
	}

	@Override
	public Optional<TheaterScreening> getTheaterScreeningById(int screenIdBooked) {
		
		return theaterScreeningRepository.findById(screenIdBooked);
	}

	@Override
	public void setCancelSeatNumbers(int screenId, int noOfSeats) {
		Optional<TheaterScreening> setTheaterScreeningSeatOptional = theaterScreeningRepository.findById(screenId);
		if(setTheaterScreeningSeatOptional.isPresent()) {
			TheaterScreening theaterSeat = setTheaterScreeningSeatOptional.get();
			theaterSeat.setBookedSeats(theaterSeat.getBookedSeats()-noOfSeats);
		}
		
	}

}
