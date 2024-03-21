package com.movieTicketBookingSystem.service;

import java.util.List;
import java.util.Optional;

import com.movieTicketBookingSystem.model.BookingHistory;
import com.movieTicketBookingSystem.model.Customer;
import com.movieTicketBookingSystem.model.Seat;

public interface SeatService {
	public Seat bookSeat(Seat seat);
	public List<Seat> getAllBookedSeatDetail();
	public Optional<Customer> getSeat(int id);
	public List<BookingHistory> getBookingHistory(int id);
	public void cancelSeat(int seatId);
}
