/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import java.util.List;

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
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Payment;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.service.AddressService;
import edu.mum.petsmart.service.CustomerOrderService;
import edu.mum.petsmart.service.CustomerService;
import edu.mum.petsmart.service.ItemService;
import edu.mum.petsmart.service.PaymentService;
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
	CustomerOrderService custOrderService;
	
	@Autowired
	AddressService addrService;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/checkout", method=RequestMethod.GET)
	public String products(@ModelAttribute("custOrder") CustomerOrder custOrder, Model model) {
		//model.addAttribute("newCustOrder", new CustomerOrder());
		Customer customer = custService.getCustomer(1);
		
		CustomerOrder custOrder1 = custOrderService.getCustomerOrder(1);
		Address address = addrService.getAddress(1);
		
		Item item = itemService.get(1);
		Payment payment = paymentService.getPayment(1);
		List<Product> productList = productService.getAll();
		
		custOrder.setTotalPrice(1000);
		custOrder.setNotes("This order Notes");
		custOrder.setBillingAddress(address);
		custOrder.setShipingAddress(address);
		//CustomerOrder custOrder = new CustomerOrder();
		System.out.println(custOrder.getNotes());
		//model.addAttribute("custOrder",custOrder);
		model.addAttribute("address", address);
		model.addAttribute("customer", customer); 
	     
		return "checkout";
	}


}
