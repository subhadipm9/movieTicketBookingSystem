package com.movieTicketBookingSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movieTicketBookingSystem.model.TheaterScreening;

public interface TheaterScreeningRepository extends JpaRepository<TheaterScreening, Integer> {
	public List<TheaterScreening> findAllByMovieIdForScreen(int movieIdForScreen);

	public List<TheaterScreening> findByMovieIdForScreen(int movieId);

	public List<TheaterScreening> findByScreenNo(int screenNo);
}
