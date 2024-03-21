package com.movieTicketBookingSystem.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class BookingHistory {
	private String movieName;
	private String directorName;
	private int noOfSeats;
	private Date startDate;
	private String startTime;
	private int seatId;
	private ArrayList<Integer> bookedSeats;
	public BookingHistory(String movieName, String directorName, int noOfSeats, Date startDate, String startTime,
			int seatId,ArrayList<Integer> bookedSeats) {
		super();
		this.movieName = movieName;
		this.directorName = directorName;
		this.noOfSeats = noOfSeats;
		this.startDate = startDate;
		this.startTime = startTime;
		this.seatId = seatId;
		this.bookedSeats=new ArrayList<>(bookedSeats);
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public int getNoOfSeats() {
		return noOfSeats;
	}

	public void setNoOfSeats(int noOfSeats) {
		this.noOfSeats = noOfSeats;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	public BookingHistory() {
		super();
	}

	public List<Integer> getBookedSeats() {
		return bookedSeats;
	}

	public void setBookedSeats(ArrayList<Integer> bookedSeats) {
		this.bookedSeats = new ArrayList<>(bookedSeats);
	}

	@Override
	public String toString() {
		return "BookingHistory [movieName=" + movieName + ", directorName=" + directorName + ", noOfSeats=" + noOfSeats
				+ ", startDate=" + startDate + ", startTime=" + startTime + ", seatId=" + seatId + ", bookedSeats="
				+ bookedSeats + "]";
	}
	
}
