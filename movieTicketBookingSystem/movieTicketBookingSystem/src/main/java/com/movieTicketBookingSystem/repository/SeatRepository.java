package com.movieTicketBookingSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movieTicketBookingSystem.model.Seat;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
	public List<Seat> findByCustomerIdBooked(int id);

	public List<Seat> findByScreenIdBooked(int  screenId);
}
