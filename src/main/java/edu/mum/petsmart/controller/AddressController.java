/**
 * 
 */
package edu.mum.petsmart.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.petsmart.domain.Address;
import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.CustomerOrder;
import edu.mum.petsmart.service.AddressService;


/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */
@Controller
@SessionAttributes({"customer", "customerOrder", "cart", "billingAddress", "shippingAddress", "orderPayment"})
@RequestMapping(value="/address")
public class AddressController {
	@Autowired
	AddressService addrService;
	
	@RequestMapping(value = {"/add"}, method=RequestMethod.POST)
	public @ResponseBody Address addAddress(@Valid @RequestBody Address address, Model model, HttpSession session) {
		//CustomerOrder custOrder = (CustomerOrder) session.getAttribute("customerOrder");
			
		//addrService.save(address);
		//custOrder.setBillingAddress(address);
		model.addAttribute("shippingAddress", address);
		return address;
  
	}
	
	@RequestMapping(value = {"/addbilling"}, method=RequestMethod.POST)
	public @ResponseBody Address addBillingAddress(@Valid @RequestBody Address address, Model model, HttpSession session) {
		/*Customer customer = (Customer)session.getAttribute("customer");
		
		addrService.save(address);*/
		model.addAttribute("billingAddress", address);
		return address;
  
	}
	
}

