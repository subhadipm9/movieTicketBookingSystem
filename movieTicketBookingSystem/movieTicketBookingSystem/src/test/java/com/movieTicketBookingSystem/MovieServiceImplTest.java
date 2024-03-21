package com.movieTicketBookingSystem;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.movieTicketBookingSystem.model.Movie;
import com.movieTicketBookingSystem.repository.MovieRepository;
import com.movieTicketBookingSystem.service.MovieServiceImpl;

public class MovieServiceImplTest {
	
	@InjectMocks
    private MovieServiceImpl movieService;
    
    @Mock
    private MovieRepository movieRepository;

    @BeforeEach
    public void setUp() {
    	MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testSaveMovie() {
        
        // Set the properties of the movie object
        //Given
    	Movie movie = new Movie();
    	
    	//When
        when(movieRepository.save(movie)).thenReturn(movie);
        
        //Then
        Movie result = movieService.saveMovie(movie);

        assertNotNull(result);
        // Assert other expected outcomes
    }

    @Test
    public void testGetAllMovies() {
        List<Movie> movies = new ArrayList<>();
        // Add some movies to the list
        
        when(movieRepository.findAll()).thenReturn(movies);

        List<Movie> result = movieService.getAllMovies();

        assertNotNull(result);
        assertEquals(movies, result);
    }

    @Test
    public void testGetMovie() {
        int movieId = 1;
        Movie movie = new Movie();
        // Set the properties of the movie object
        
        Optional<Movie> existingMovieOptional = Optional.of(movie);
        when(movieRepository.findById(movieId)).thenReturn(existingMovieOptional);

        Optional<Movie> result = movieService.getMovie(movieId);

        assertTrue(result.isPresent());
        assertEquals(movie, result.get());
    }

    @Test
    public void testUpdateMovie() {
        int movieId = 1;
        Movie movie = new Movie();
        // Set the properties of the movie object
        
        Optional<Movie> existingMovieOptional = Optional.of(movie);
        when(movieRepository.findById(movieId)).thenReturn(existingMovieOptional);
        when(movieRepository.save(movie)).thenReturn(movie);

        Movie result = movieService.updateMovie(movieId, movie);

        assertNotNull(result);
        // Assert other expected outcomes
    }

    @Test
    public void testDeleteMovie() {
        int movieId = 1;

        movieService.deleteMovie(movieId);

        // Assert the deletion, e.g. by verifying mock interactions or checking if the movie is no longer retrievable
    }

    @Test
    public void testSearchByMovieName() {
        String movieName = "Example Movie";
        List<Movie> movies = new ArrayList<>();
        // Add some movies to the list
        
        when(movieRepository.findByMovieName(movieName)).thenReturn(movies);

        List<Movie> result = movieService.searchByMovieName(movieName);

        assertNotNull(result);
        assertEquals(movies, result);
    }

    @Test
    public void testGetMoviesOnGenre() {
        String genre = "Action";
        List<Movie> movies = new ArrayList<>();
        // Add some movies to the list
        
        when(movieRepository.findByGenre(genre)).thenReturn(movies);

        List<Movie> result = movieService.getMoviesOnGenre(genre);

        assertNotNull(result);
        assertEquals(movies, result);
    }

    // Add more test methods for other methods in the MovieServiceImpl class
}    