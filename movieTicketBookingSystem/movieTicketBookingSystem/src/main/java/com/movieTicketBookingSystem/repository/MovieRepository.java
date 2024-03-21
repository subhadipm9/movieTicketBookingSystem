package com.movieTicketBookingSystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.movieTicketBookingSystem.model.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie, Integer>{
	
	public List<Movie> findByMovieName(String name);
	public List<Movie> findByGenre(String genre);
}
