package com.movieTicketBookingSystem.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.movieTicketBookingSystem.model.BookingHistory;
import com.movieTicketBookingSystem.model.Seat;
import com.movieTicketBookingSystem.service.SeatService;
import com.movieTicketBookingSystem.service.TheaterScreeningService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/seat")
public class SeatController {
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private TheaterScreeningService theaterScreeningService;
	
	@GetMapping("/allSeat")
	public ResponseEntity<List<Seat>> getAllSeat(){
		List<Seat> seatDetails = seatService.getAllBookedSeatDetail();
		return new ResponseEntity<>(seatDetails,HttpStatus.OK);
	}
	@PostMapping("/book")
	public ModelAndView bookSeat(Seat seat,HttpSession session){
		seatService.bookSeat(seat);
		theaterScreeningService.setSeatNumbers(seat.getScreenIdBooked(), seat.getSeatsBooked());
		ModelAndView mView = bookingHistory(session);
		mView.addObject("notFound", "Booked Succesfully");

		return mView;
	}
	@GetMapping("/bookingHistory")
	public ModelAndView bookingHistory(HttpSession session) {
		int userId = (int) session.getAttribute("customerId");
		List<BookingHistory> bookingList = seatService.getBookingHistory(userId);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("bookingHistory");
		if(bookingList==null) {
			mView.addObject("notFound", "No booking history found");
		}
		else {
			mView.addObject("notFound", null);
		}
		List<BookingHistory> canCancelBookingHistories = new ArrayList<>();
		for(BookingHistory cursor:bookingList) {
			LocalDate sqlDate = cursor.getStartDate().toLocalDate();
			LocalDate today = LocalDate.now(ZoneId.systemDefault());
			if(sqlDate.isAfter(today)) {
				canCancelBookingHistories.add(cursor);
			}
		}
		mView.addObject("listValue", bookingList);
		mView.addObject("CancelationListValue", canCancelBookingHistories);
		return mView;
	}
	@PostMapping("/cancelSeat")
	public ModelAndView cancelSeat(int seatId,HttpSession session) {
		seatService.cancelSeat(seatId);
		ModelAndView mView = bookingHistory(session);
		return mView;
	}
}
