package com.movieTicketBookingSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.movieTicketBookingSystem.model.Movie;
import com.movieTicketBookingSystem.model.Seat;
import com.movieTicketBookingSystem.model.TheaterScreening;
import com.movieTicketBookingSystem.service.CustomerService;
import com.movieTicketBookingSystem.service.MovieService;
import com.movieTicketBookingSystem.service.SeatService;
import com.movieTicketBookingSystem.service.TheaterScreeningService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private TheaterScreeningService theaterScreeningService;
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/access")
	public ModelAndView adminHome() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("adminHome");
		List<Movie> movieOptionsList = movieService.getAllMovies();
		mView.addObject("optionListValue", movieOptionsList);
		List<Seat> seatList = seatService.getAllBookedSeatDetail();
		List<TheaterScreening> theaterListAdmin = theaterScreeningService.getAllTheaterScreeningDetails();
		mView.addObject("theaterListDelete", theaterListAdmin);
		mView.addObject("listValue",seatList);
		return mView;
	}
	
	@PostMapping("/resetPassword")
	public ModelAndView resetPassword(HttpSession session,String newPassword) {
		ModelAndView mView = new ModelAndView("adminHome");
		int custId = (int) session.getAttribute("customerId");
		boolean checkUpdate = customerService.updatePassWord(custId,newPassword);
		if(checkUpdate==true) {
			mView.addObject("theaterMessage", "Password Changed for"+custId);
			return mView;
		}
		return mView;
	}
}
