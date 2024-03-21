package com.movieTicketBookingSystem.service;

import java.util.Optional;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieTicketBookingSystem.model.Customer;
import com.movieTicketBookingSystem.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerRepository customerRepository;

	StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
	
	//Checking password for logging in
	@Override
	public char checkPassword(String password, String emailId) {
		// TODO Auto-generated method stub
		Customer existingCustomerOptional = customerRepository.findByCustomerEmail(emailId);
		if(existingCustomerOptional != null) {
			
			if(encryptor.checkPassword(password, existingCustomerOptional.getCustomerPassword())) {
				if(existingCustomerOptional.getCustomerPhone()==0){
					return 'a';
				}
				return 'd';
			}
			else {
				return 'p';
			}
			
		}
		return 'i';
	}

	//Creating new customer
	@Override
	public Customer registerNewCustomer(Customer customer) {
		// TODO Auto-generated method stub
		
		String encryptedString = encryptor.encryptPassword(customer.getCustomerPassword());
		
		customer.setCustomerPassword(encryptedString);
		return customerRepository.save(customer);
	}


	//Finding account by emailId to login
	@Override
	public Customer getByEmailId(String emailId) {
		// TODO Auto-generated method stub
		Customer existingCustomerOptional = customerRepository.findByCustomerEmail(emailId);
		if(existingCustomerOptional != null) {
			return existingCustomerOptional;
		}
		return null;
	}


	@Override
	public Optional<Customer> getByCustomerId(int custId) {
		// TODO Auto-generated method stub
		return customerRepository.findById(custId);
	}
	
	//updating customer password
	@Override
	public boolean updatePassWord(int custId, String newPassword) {
		// TODO Auto-generated method stub
		
		Optional<Customer> customerOptional = customerRepository.findById(custId);
		if(customerOptional.isPresent()) {
			Customer customer = customerOptional.get();
			String encryptedString = encryptor.encryptPassword(newPassword);
			customer.setCustomerPassword(encryptedString);
			customerRepository.save(customer);
			return true;
		}
		return false;
			
	}

	
	

}
