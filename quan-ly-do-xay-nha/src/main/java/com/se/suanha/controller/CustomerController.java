package com.se.suanha.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.suanha.entity.Customer;
import com.se.suanha.entity.Product;
import com.se.suanha.service.CustomerService;
import com.se.suanha.service.ProductService;

@Controller
public class CustomerController {
	
	@Autowired
	// need to inject our customer service
	private CustomerService customerService;
	
//	@GetMapping("/")
//	public String listCustomers(Model theModel) {
//		 get customers from the service
//		List<Customer> theCustomers = customerService.getCustomers();
//		add the customers to the model
//		theModel.addAttribute("customers", theCustomers);
//
//		return "home";
//	}
	
	

	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
		// save the customer using our service
		customerService.saveCustomer(theCustomer);
		return "redirect:/";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		// get the customer from our service
		Customer theCustomer = customerService.getCustomer(theId);
		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("customer", theCustomer);
		// send over to our form
		return "customer-form-register";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		// create model attribute to bind form data
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);
		return "customer-form-register";
	}

	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {

		// delete the customer
		customerService.deleteCustomer(theId);

		return "redirect:/";
	}

}