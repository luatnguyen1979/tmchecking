/**
 * 
 */
package edu.mum.petsmart.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.petsmart.domain.Address;
import edu.mum.petsmart.service.AddressService;


/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */
@Controller
@RequestMapping(value="/address")
public class AddressController {
	@Autowired
	AddressService addrService;
	
	@RequestMapping(value = {"/add"}, method=RequestMethod.POST)
	public @ResponseBody Address addAddress(@Valid @RequestBody Address address, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
		/*if (bindingResult.hasErrors()) {
			return "checkout";
		}*/
			
		addrService.save(address);
		return address;
 
	
             
             
	    
	}
	
	
	@RequestMapping(value = "/success", method=RequestMethod.GET)
	public String getAddress(Model model) {
		return "address";
	}
}

