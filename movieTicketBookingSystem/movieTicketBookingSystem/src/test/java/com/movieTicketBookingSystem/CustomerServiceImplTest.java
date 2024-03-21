package com.movieTicketBookingSystem;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.movieTicketBookingSystem.model.Customer;
import com.movieTicketBookingSystem.repository.CustomerRepository;
import com.movieTicketBookingSystem.service.CustomerServiceImpl;

public class CustomerServiceImplTest {

    @Mock
    private CustomerRepository customerRepository;

    @InjectMocks
    private CustomerServiceImpl customerService;

    @BeforeEach
    public void setUp() {
    	MockitoAnnotations.openMocks(this);
    }


    @Test
    public void testCheckPassword_NonExistingCustomer() {
        String password = "password";
        String emailId = "nonexisting@example.com";

        when(customerRepository.findByCustomerEmail(emailId)).thenReturn(null);

        char result = customerService.checkPassword(password, emailId);

        assertEquals('i', result);
    }



    @Test
    public void testGetByEmailId_ExistingCustomer() {
        String emailId = "test@example.com";
        Customer existingCustomer = new Customer();
        existingCustomer.setCustomerEmail(emailId);

        when(customerRepository.findByCustomerEmail(emailId)).thenReturn(existingCustomer);

        Customer result = customerService.getByEmailId(emailId);

        assertNotNull(result);
        assertEquals(existingCustomer, result);
    }

    @Test
    public void testGetByEmailId_NonExistingCustomer() {
        String emailId = "nonexisting@example.com";

        when(customerRepository.findByCustomerEmail(emailId)).thenReturn(null);

        Customer result = customerService.getByEmailId(emailId);

        assertNull(result);
    }

    @Test
    public void testGetByCustomerId_ExistingCustomer() {
        int custId = 1;
        Customer existingCustomer = new Customer();
        existingCustomer.setCustomerId(custId);

        when(customerRepository.findById(custId)).thenReturn(Optional.of(existingCustomer));

        Optional<Customer> result = customerService.getByCustomerId(custId);

        assertTrue(result.isPresent());
        assertEquals(existingCustomer, result.get());
    }

    @Test
    public void testGetByCustomerId_NonExistingCustomer() {
        int custId = 1;

        when(customerRepository.findById(custId)).thenReturn(Optional.empty());

        Optional<Customer> result =customerService.getByCustomerId(custId);

        assertFalse(result.isPresent());
    }


    @Test
    public void testUpdatePassWord_NonExistingCustomer() {
        int custId = 1;
        String newPassword = "newPassword";

        when(customerRepository.findById(custId)).thenReturn(Optional.empty());

        boolean result = customerService.updatePassWord(custId, newPassword);

        assertFalse(result);
    }

}