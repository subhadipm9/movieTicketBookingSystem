package com.movieTicketBookingSystem.service;

import java.util.Optional;

import com.movieTicketBookingSystem.model.Customer;

public interface CustomerService {
	public char checkPassword(String password,String emailId);
	public Customer registerNewCustomer(Customer customer);
	public Customer getByEmailId(String emailId);

	public Optional<Customer> getByCustomerId(int custId);
	public boolean updatePassWord(int custId, String newPassword);
	
}
