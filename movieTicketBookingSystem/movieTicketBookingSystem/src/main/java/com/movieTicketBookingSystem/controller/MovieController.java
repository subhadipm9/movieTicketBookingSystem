package com.movieTicketBookingSystem.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.movieTicketBookingSystem.model.Movie;
import com.movieTicketBookingSystem.service.MovieService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/movie")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private AdminController adminController;
	@PostMapping("/create")
	public ModelAndView createMovie(Movie movie) {
		Movie movieTwo = movieService.saveMovie(movie);
		System.out.println(movieTwo);
		ModelAndView mView = adminController.adminHome();
		mView.addObject("theaterMessage", "Added Movie Successfully!");
		return mView;
	}
	
	@GetMapping("/allmovies")
	public ModelAndView getAllMovies(HttpSession session){
		List<Movie> movieList = movieService.getAllMovies();
		ModelAndView mView = new ModelAndView();
		session.setAttribute("movieName", "null");
		mView.setViewName("movieDetailsPage");
        if (!movieList.isEmpty()) {
            return mView.addObject("listValue", movieList);
        } else {
        	return mView.addObject("listValue", movieList);
        }
	}

    @PostMapping("/getMovie/filter")
    public ModelAndView getMoviesBasedOnGenre(String genre,HttpSession session){
    	List<Movie> movieOnGenreList= movieService.getMoviesOnGenre(genre);
    	ModelAndView mView = new ModelAndView();
		session.setAttribute("movieName", "null");
		mView.setViewName("movieDetailsPage");
        if (movieOnGenreList.isEmpty()) {
            return mView.addObject("listValue", movieOnGenreList);
        } else {
        	return mView.addObject("listValue", movieOnGenreList);
        }
    }
    @PostMapping("/searchMovie")
    public ModelAndView searchMovie(String name){
    	List<Movie> searchedMovie = movieService.searchByMovieName(name);
    	ModelAndView mView = new ModelAndView();
    	mView.setViewName("movieDetailsPage");
    	if(searchedMovie!= null) {
    		mView.addObject("listValue", searchedMovie);
    		mView.addObject("searchMethod",searchedMovie.size()+" movies found.");
    	}
    	else {
    		mView.addObject("searchMethod", "No Movies Found!!");
    	}
    	
    	return mView;
    }

    @PostMapping("/deleteMovie")
    public ModelAndView deleteMovie(int movieId) {
    	ModelAndView mView = adminController.adminHome();
    	try {
	        movieService.deleteMovie(movieId);
			mView.addObject("theaterMessage", "Deleted Movie Successfully!");
    	}
    	catch(Exception ex) {
			mView.addObject("theaterMessage", "Can't Delete because it's on theater");
    	}
		return mView;
    }
}
