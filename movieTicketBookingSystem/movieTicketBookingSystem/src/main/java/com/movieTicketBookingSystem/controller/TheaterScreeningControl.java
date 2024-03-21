package com.movieTicketBookingSystem.controller;


import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.movieTicketBookingSystem.model.TheaterScreening;
import com.movieTicketBookingSystem.service.TheaterScreeningService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/theater")
public class TheaterScreeningControl {
	
	@Autowired
	private TheaterScreeningService theaterScreeningService;
	
	@Autowired
	private AdminController adminController;
	
	@PostMapping("/theaterDetail")
	public ModelAndView getMovieDetailsWithTheater(int movieId, String movieName,HttpSession session){
		List<TheaterScreening> theaterDetails = theaterScreeningService.getTheaterDetailsOnMovie(movieId);
		ModelAndView mView = new ModelAndView();
		List<TheaterScreening> filteredByDateList = new ArrayList<>();
		for(TheaterScreening cursor:theaterDetails) {
			LocalDate sqlDate = cursor.getMovieDate().toLocalDate();
			LocalDate today = LocalDate.now(ZoneId.systemDefault());
			if(sqlDate.isAfter(today)) {
				filteredByDateList.add(cursor);
			}
		}
		mView.setViewName("bookingPage");
		if(theaterDetails != null) {
			Collections.reverse(filteredByDateList);
			mView.addObject("listValue", filteredByDateList);
			mView.addObject("movieName", movieName);
			session.setAttribute("movieName", movieName);
			return mView;
		}
		return mView.addObject("theaterError","Not Found Theater ");
	}
	
	@PostMapping("/create")
	public ModelAndView addMovieToTheater(TheaterScreening theaterScreening){
		ModelAndView mView = adminController.adminHome();
		boolean check = theaterScreeningService.addMovieToTheater(theaterScreening);
		if(check) {
			mView.addObject("theaterMessage","Already Added" );
		}
		mView.addObject("theaterMessage","Theater added successfully" );
		return mView;
	}
	
	@PostMapping("/delete")
	public ModelAndView deleteTheater(int theaterId) {
		
		ModelAndView mView = adminController.adminHome();
		try {
			theaterScreeningService.deleteTheater(theaterId);
			mView.addObject("theaterMessage", "Deleted Theater Successfully!");
		}
		catch(Exception ex) {
			mView.addObject("theaterMessage", "Someone booked seats on the theater.Refund them");
		}
			
		return mView;
	}
	
}
