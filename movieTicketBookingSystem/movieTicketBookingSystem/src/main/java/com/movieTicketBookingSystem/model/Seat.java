package com.movieTicketBookingSystem.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "seat_details")
public class Seat {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int seatId;
	
	private int screenIdBooked;
	private int customerIdBooked;
	private int seatsBooked;
	private int totalPaid;
	
	public Seat() {
		
	}
	
	public Seat(int screenIdBooked, int customerIdBooked, int seatsBooked, int totalPaid) {
		this.screenIdBooked = screenIdBooked;
		this.customerIdBooked = customerIdBooked;
		this.seatsBooked = seatsBooked;
		this.totalPaid = totalPaid;
	}

	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	public int getScreenIdBooked() {
		return screenIdBooked;
	}

	public void setScreenIdBooked(int screenIdBooked) {
		this.screenIdBooked = screenIdBooked;
	}

	public int getCustomerIdBooked() {
		return customerIdBooked;
	}

	public void setCustomerIdBooked(int customerIdBooked) {
		this.customerIdBooked = customerIdBooked;
	}

	public int getSeatsBooked() {
		return seatsBooked;
	}

	public void setSeatsBooked(int seatsBooked) {
		this.seatsBooked = seatsBooked;
	}

	public int getTotalPaid() {
		return totalPaid;
	}

	public void setTotalPaid(int totalPaid) {
		this.totalPaid = totalPaid;
	}

	@Override
	public String toString() {
		return "Seat [seatId=" + seatId + ", screenIdBooked=" + screenIdBooked + ", customerIdBooked="
				+ customerIdBooked + ", seatsBooked=" + seatsBooked + ", totalPaid=" + totalPaid + "]";
	}
}
