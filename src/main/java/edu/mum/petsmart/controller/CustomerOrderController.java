/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.petsmart.domain.Address;
import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.CustomerOrder;
import edu.mum.petsmart.service.AddressService;
import edu.mum.petsmart.service.CustomerService;
import edu.mum.petsmart.service.ProductService;

/**
 * @author Van Gia Luat Nguyen
 *
 */
@Controller
//@RequestMapping(value="/customer")
public class CustomerOrderController {
	
	@Autowired
	CustomerService custService;
	
	@Autowired
	AddressService addrService;
	
	@RequestMapping(value = "/checkout", method=RequestMethod.GET)
	public String products(Model model) {
		//model.addAttribute("newCustOrder", new CustomerOrder());
		Customer cust = custService.getCustomer(1);
		
		CustomerOrder custOrder = new CustomerOrder();
		Address address = cust.getAddress();

		custOrder.setTotalPrice(1000);
		custOrder.setNotes("This order Notes");
		custOrder.setBillingAddress(address);
		custOrder.setShipingAddress(address);
		//CustomerOrder custOrder = new CustomerOrder();
		System.out.println(custOrder.getNotes());
		model.addAttribute("custOrder",custOrder);
		//model.addAttribute("address", address);
	     
		return "checkout";
	}


}
