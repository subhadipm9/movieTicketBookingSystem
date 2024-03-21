package com.movieTicketBookingSystem.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieTicketBookingSystem.model.BookingHistory;
import com.movieTicketBookingSystem.model.Customer;
import com.movieTicketBookingSystem.model.Movie;
import com.movieTicketBookingSystem.model.Seat;
import com.movieTicketBookingSystem.model.TheaterScreening;
import com.movieTicketBookingSystem.repository.CustomerRepository;
import com.movieTicketBookingSystem.repository.SeatRepository;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private TheaterScreeningService theaterScreeningService;
	
	@Autowired
	private MovieService movieService;
	
	@Override
	public Seat bookSeat(Seat seat) {
		
		theaterScreeningService.setSeatNumbers(seat.getScreenIdBooked(), seat.getSeatsBooked());
		return seatRepository.save(seat);
	}

	@Override
	public List<Seat> getAllBookedSeatDetail() {
		
		return seatRepository.findAll();
	}

	@Override
	public Optional<Customer> getSeat(int id) {
		
		Optional<Seat> seatDetailOptional = seatRepository.findById(id);
		if(seatDetailOptional.isPresent()) {
			Seat seatDetail = seatDetailOptional.get();
			Optional<Customer> customerOptional = customerRepository.findById(seatDetail.getCustomerIdBooked());
			return customerOptional;
		}
		return null;
	}

	@Override
	public List<BookingHistory> getBookingHistory(int id) {
		
		//For finding particular customer
		List<Seat> bookedList = seatRepository.findByCustomerIdBooked(id);
		
		
		List<BookingHistory> bookingHistoryList = new ArrayList<>();
		String movieName = null;
		String directorName = null;
		int noOfSeats = 0;
		Date startDate = null;
		String startTime = null;
		int seatId = 0;
		ArrayList<Integer> bookedSeats = new ArrayList<>();
		
		if(bookedList.isEmpty()) {
			return null;
		}
		else {
			for(Seat cursor:bookedList) {
				Optional<TheaterScreening> theaterScreeningOptional = theaterScreeningService.getTheaterScreeningById(cursor.getScreenIdBooked());
				if(theaterScreeningOptional.isPresent()) {
					TheaterScreening theaterScreening = theaterScreeningOptional.get();
					int totalBookedSeats =0;
					
					//Find all the seat booking on happened on the theater
					List<Seat> allSeatsOnTheaterList = seatRepository.findByScreenIdBooked(theaterScreening.getScreenId());

					for(Seat countSeats:allSeatsOnTheaterList) {
						
						//When the seatid matches then it will generate the seats
						if(countSeats.getSeatId()==cursor.getSeatId()) {
							for(int i=1;i<=countSeats.getSeatsBooked();i++) {
								bookedSeats.add(totalBookedSeats+=1);
			
							}
							break;
						}
						
						//Count the total seats booked before matching the seat id.
						totalBookedSeats += countSeats.getSeatsBooked();
					}
					
					//Adding movie details
					startDate = theaterScreening.getMovieDate();
					startTime = theaterScreening.getStartTime();
					Optional<Movie> movieOptional = movieService.getMovie(theaterScreening.getMovieIdForScreen());
					{
						if(movieOptional.isPresent()) {
							Movie movie = movieOptional.get();
							movieName = movie.getMovieName();
							directorName = movie.getMovieDirector();
						}
					}
				}
				noOfSeats = cursor.getSeatsBooked();
				seatId = cursor.getSeatId();
				
				BookingHistory bookingHistory = new BookingHistory(movieName,directorName,noOfSeats,startDate,startTime,seatId,bookedSeats);
				bookingHistoryList.add(bookingHistory);
				bookedSeats.clear();
			}
			Collections.reverse(bookingHistoryList);
			return bookingHistoryList;
		}
	}

	@Override
	public void cancelSeat(int seatId) {
		
		Optional<Seat> seatOpt = seatRepository.findById(seatId);
		if(seatOpt.isPresent()) {
			Seat seat = seatOpt.get();
			theaterScreeningService.setCancelSeatNumbers((seat.getScreenIdBooked()), (seat.getSeatsBooked()));
			seatRepository.deleteById(seatId);
		}
		
	}

}
