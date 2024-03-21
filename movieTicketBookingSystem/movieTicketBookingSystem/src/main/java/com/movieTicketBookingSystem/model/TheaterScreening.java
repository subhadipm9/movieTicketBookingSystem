package com.movieTicketBookingSystem.model;

import java.sql.Date;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="THEATER_SCREENING_DETAILS")
public class TheaterScreening {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int screenId;
	
	private int movieIdForScreen;
	private int totalSeats;
	private int bookedSeats;
	private String startTime;
	private Date movieDate;
	private int ticketPrice;
	private int screenNo;
	
	public TheaterScreening(int screenId, int movieIdForScreen, int totalSeats, int bookedSeats, String startTime,
			Date movieDate, int ticketPrice, int screenNo) {
		super();
		this.screenId = screenId;
		this.movieIdForScreen = movieIdForScreen;
		this.totalSeats = totalSeats;
		this.bookedSeats = bookedSeats;
		this.startTime = startTime;
		this.movieDate = movieDate;
		this.ticketPrice = ticketPrice;
		this.screenNo = screenNo;
	}

	
	
	public TheaterScreening() {
		super();
	}



	public int getScreenId() {
		return screenId;
	}



	public void setScreenId(int screenId) {
		this.screenId = screenId;
	}



	public int getMovieIdForScreen() {
		return movieIdForScreen;
	}



	public void setMovieIdForScreen(int movieIdForScreen) {
		this.movieIdForScreen = movieIdForScreen;
	}



	public int getTotalSeats() {
		return totalSeats;
	}



	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}



	public int getBookedSeats() {
		return bookedSeats;
	}



	public void setBookedSeats(int bookedSeats) {
		this.bookedSeats = bookedSeats;
	}



	public String getStartTime() {
		return startTime;
	}



	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}



	public Date getMovieDate() {
		return movieDate;
	}



	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}



	public int getTicketPrice() {
		return ticketPrice;
	}



	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}



	public int getScreenNo() {
		return screenNo;
	}



	public void setScreenNo(int screenNo) {
		this.screenNo = screenNo;
	}



	@Override
	public String toString() {
		return "TheaterScreening [screenId=" + screenId + ", movieIdForScreen=" + movieIdForScreen + ", totalSeats="
				+ totalSeats + ", bookedSeats=" + bookedSeats + ", startTime=" + startTime + ", movieDate=" + movieDate
				+ ", ticketPrice=" + ticketPrice + ", screenNo=" + screenNo + "]";
	}
	
	
	
	
}