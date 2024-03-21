package com.movieTicketBookingSystem.controller;

import java.util.List;

import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.movieTicketBookingSystem.model.Customer;
import com.movieTicketBookingSystem.model.Movie;
import com.movieTicketBookingSystem.service.CustomerService;
import com.movieTicketBookingSystem.service.MovieService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired 
	private MovieService movieService;
	
	@Autowired
	private MovieController movieController;
	
	@Autowired
	private AdminController adminController;
	
	
	StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
	
	@GetMapping("/home")
	public ModelAndView homeScreen() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("landingpage");
		List<Movie> displayTrailer = movieService.getAllMovies();
		try {
			mView.addObject("trailerOne", displayTrailer.get(0).getTrailerLink());
			mView.addObject("trailerTwo", displayTrailer.get(1).getTrailerLink());
			mView.addObject("trailerThree", displayTrailer.get(2).getTrailerLink());
		}
		catch(Exception exception) {
			System.out.println(exception);
			mView.setViewName("loginpage");
			return mView;
		}
		return mView;
		
	}
	
	@GetMapping("/login")
	public ModelAndView loginPage() {
		ModelAndView mView =new ModelAndView();
		mView.setViewName("loginpage");
		return mView;
	}
	
	
	
	@GetMapping("/registerpage")
	public ModelAndView registerPage() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("registerpage");
		return mView;
	}
	
	@PostMapping("/register")
	public ModelAndView creatNewCustomer(Customer customer,HttpSession session){
		Customer emailIdOptional = (customerService.getByEmailId(customer.getCustomerEmail()));
		if(emailIdOptional == null) {
			customerService.registerNewCustomer(customer);
			ModelAndView movieView =  movieController.getAllMovies(session);
			movieView.addObject("userName", customer.getCustomerName());
			movieView.addObject("customerId",customer.getCustomerId());
			
			session.setAttribute("userName", customer.getCustomerName());
			session.setAttribute("customerId", customer.getCustomerId());
			return movieView;
		}
		else {
			ModelAndView mView = new ModelAndView("registerpage"); 
			mView.addObject("errorMsg", "already registered with "+customer.getCustomerEmail()+" email.");
			return mView;
		}
	}
	
	@PostMapping("/logincredentials")
	public ModelAndView loginCredentialCheck(String customerEmail,String customerPassword , HttpSession session) {
		char verification = customerService.checkPassword(customerPassword, customerEmail);
		ModelAndView mView = new ModelAndView();
		
		//for Admin
		if(verification=='a') {
				mView = adminController.adminHome();
				Customer user = customerService.getByEmailId(customerEmail);
				session.setAttribute("userName", user.getCustomerName());
				session.setAttribute("customerId", user.getCustomerId());
				return mView;
		}
		else if(verification=='d') {
			ModelAndView movieView =  movieController.getAllMovies(session);
			movieView.addObject("userName", customerService.getByEmailId(customerEmail).getCustomerName());
			movieView.addObject("customerId",customerService.getByEmailId(customerEmail).getCustomerId());
			
			Customer user = customerService.getByEmailId(customerEmail);
			session.setAttribute("userName", user.getCustomerName());
			session.setAttribute("customerId", user.getCustomerId());
			return movieView;
		}
		else if(verification=='i') {
			mView.setViewName("loginpage");
			mView.addObject("msg", "You don't have any account registered with the email");
			return mView;
		}
		else if(verification=='p') {
			mView.setViewName("loginpage");
			mView.addObject("msg", "Wrong Password.Check again or contact Your admin");
			return mView;
		}
		
		mView.setViewName("loginpage");
		mView.addObject("msg", null);
		return mView;
	}
	
	@PostMapping("/forgotPassword")
	public ModelAndView forgotPassword(String customerEmail) {
		Customer forgotPass= customerService.getByEmailId(customerEmail);
		ModelAndView mView = new ModelAndView();
		if(forgotPass == null) {
			mView.setViewName("loginpage");
			mView.addObject("msg", "You don't have any account registered with the email");
			return mView;
		}
		mView.setViewName("loginpage");
		mView.addObject("msg","Your Password is- "+forgotPass.getCustomerPassword());
		return mView;
	}
	@GetMapping("/logout")
	public ModelAndView customerLogout(HttpSession session) {
		session.invalidate();
		ModelAndView mView = new ModelAndView("loginpage");
		return mView;
	}
	@PostMapping("/changePassword")
	public ModelAndView changePassword(String oldPassword,String newPassword,HttpSession session) {
		int custId = (int) session.getAttribute("customerId");
		Customer customer = (customerService.getByCustomerId(custId)).get();
		if(encryptor.checkPassword(oldPassword, customer.getCustomerPassword())) {
			
			boolean checkUpdate = customerService.updatePassWord(custId,newPassword);
			if(checkUpdate==true) {
				ModelAndView mView =customerLogout(session);
				mView.addObject("msg", "Password Changed Login Again");
				return mView;
			}
			return null;
		}
		else {
			ModelAndView mView = new ModelAndView("loginpage");
			mView.addObject("msg", "Wrong Password.Contact your admin");
			return mView;
		}
	}
	
}
