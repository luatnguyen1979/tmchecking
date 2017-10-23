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

import edu.mum.petsmart.domain.CustomerOrder;
import edu.mum.petsmart.service.CustomerService;
import edu.mum.petsmart.service.ProductService;

/**
 * @author Van Gia Luat Nguyen
 *
 */
@Controller
//@RequestMapping(value="/customer")
public class CustomerController {
	
	@Autowired
	CustomerService custService;
	
	@RequestMapping(value = "/checkout", method=RequestMethod.GET)
	public String products(@ModelAttribute("newCustOrder")  CustomerOrder custOrder, Model model) {
		//model.addAttribute("products", productService.getAll());
		return "checkout";
	}


}
