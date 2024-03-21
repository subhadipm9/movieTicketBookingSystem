package com.movieTicketBookingSystem.service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieTicketBookingSystem.model.Movie;
import com.movieTicketBookingSystem.repository.MovieRepository;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieRepository movieRepository;
	
	@Override
	public Movie saveMovie(Movie movie) {
		return movieRepository.save(movie);
	}
	
	@Override
	public List<Movie> getAllMovies(){
		List<Movie> movieList = movieRepository.findAll();
		Collections.reverse(movieList);
		return movieList;
	}
	
	@Override
	public Optional<Movie> getMovie(int id) {
		
		return movieRepository.findById( id);
	}
	
	@Override
	public Movie updateMovie(int id, Movie movie) {
		Optional<Movie> existingMovieOptional = movieRepository.findById(id);

        if (existingMovieOptional.isPresent()) {
            Movie existingMovie = existingMovieOptional.get();
            existingMovie.setMovieName(movie.getMovieName());
            existingMovie.setGenre(movie.getGenre());
            existingMovie.setMovieLength(movie.getMovieLength());
            existingMovie.setReleaseDate(movie.getReleaseDate());
            existingMovie.setMovieDirector(movie.getMovieDirector());
            existingMovie.setMovieDescription(movie.getMovieDescription());
            
            return movieRepository.save(existingMovie);
        } 
        else {
            
            return null;
        }
	}
	
	@Override
	public void deleteMovie(int id) {
		movieRepository.deleteById(id);
	}

	@Override
	public List<Movie> searchByMovieName(String name) {
		// TODO Auto-generated method stub
		List<Movie> movieName = movieRepository.findByMovieName(name);
		return movieName;
	}

	@Override
	public List<Movie> getMoviesOnGenre(String genre) {
		// TODO Auto-generated method stub
		List<Movie> moviesBasedOnGenre=movieRepository.findByGenre(genre);
		return moviesBasedOnGenre;
	}
	
}
