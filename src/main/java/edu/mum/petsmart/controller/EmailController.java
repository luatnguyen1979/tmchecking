package edu.mum.petsmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.mum.petsmart.domain.EmailForm;

@Controller
public class EmailController {

	@RequestMapping(value="/help", method = RequestMethod.GET)
	public String contactUs(Model model) {
		return "contactUs";
	}
	
	@RequestMapping(value="/helpSubmit", method = RequestMethod.POST)
	public String contactSubmit(@ModelAttribute("emailForm") EmailForm emailForm) {
		
		
		return "redirect:/help";
	}

}
