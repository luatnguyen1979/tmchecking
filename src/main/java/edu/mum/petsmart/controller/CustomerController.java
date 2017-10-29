/**
 * 
 */
package edu.mum.petsmart.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.petsmart.domain.Address;
import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.CustomerOrder;
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Login;
import edu.mum.petsmart.domain.Payment;
import edu.mum.petsmart.service.CartService;
import edu.mum.petsmart.service.CustomerService;
import edu.mum.petsmart.service.ItemService;
import edu.mum.petsmart.service.LoginService;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 26, 2017
 * @product Web Application Architecture
 */

@Controller
@SessionAttributes({"customer", "custID"})
@RequestMapping(value = "/")
public class CustomerController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ItemService itemService;
	

	@RequestMapping(value = "/addCustomer", method = RequestMethod.GET)
	public String addCustomer(@ModelAttribute("newLogin") Login login) {
		
		return "addcustomer";
	}
	
	@RequestMapping(value = "/addCust", method = RequestMethod.POST)
	public String createCustomer(@ModelAttribute("newLogin") Login login,  RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		//This is not good way, but I don't know why it can't map the spring form to domain data.
		Customer customer = new Customer();
		customer.setLastName(request.getParameter("customer.lastName"));
		customer.setFirstName(request.getParameter("customer.firstName"));
		customer.setEmail(request.getParameter("customer.email"));
		customer.setEmail(request.getParameter("customer.cellPhone"));
		Address address = new Address();
		address.setFullName(login.getCustomer().getFirstName() + " " + login.getCustomer().getFirstName());
		address.setAddressLine1(request.getParameter("customer.address.addressLine1"));
		address.setAddressLine2(request.getParameter("customer.address.addressLine2"));
		address.setCity(request.getParameter("customer.address.city"));
		address.setState(request.getParameter("customer.address.state"));
		address.setCountry(request.getParameter("customer.address.country"));
		address.setPhoneNumber(request.getParameter("customer.cellPhone"));
		int value = 0;
		try {
			value = Integer.parseInt(request.getParameter("customer.address.zipCode"));
		} catch(NumberFormatException nfe) {
			value = 11111;
		}
		address.setZipCode(value);
		customer.setAddress(address);
		login.setCustomer(customer);
 		login.setPassword(login.getPassword().replaceAll(",", ""));
 		login.setRole("USER");

 		model.addAttribute("customer", customer);
 		login = loginService.save(login);
 		model.addAttribute("custID", login.getCustomer().getId());
		return "redirect:/creatingcustomersuccessful";
	}
	
	@RequestMapping(value = "/creatingcustomersuccessful", method = RequestMethod.GET)
	public String success() {
	
		return "creatingcustomersuccessful";
	}
	
}
