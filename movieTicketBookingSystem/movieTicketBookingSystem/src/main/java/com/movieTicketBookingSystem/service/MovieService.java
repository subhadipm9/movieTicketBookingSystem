package com.movieTicketBookingSystem.service;

import java.util.List;
import java.util.Optional;

import com.movieTicketBookingSystem.model.Movie;



public interface MovieService {
	
	public Movie saveMovie(Movie movie);
	public List<Movie> getAllMovies();
	public Optional<Movie> getMovie(int id);
	public Movie updateMovie(int id, Movie movie);
	public void deleteMovie(int id);
	public List<Movie> searchByMovieName(String name);
	public List<Movie> getMoviesOnGenre(String genre);
}
