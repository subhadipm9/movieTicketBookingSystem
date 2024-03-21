package com.movieTicketBookingSystem.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.movieTicketBookingSystem.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	Customer findByCustomerEmail(String emailId);

}
