package edu.mum.petsmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.petsmart.service.ProductService;

@Controller
public class AdminController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/adminProducts", method=RequestMethod.GET)
	public String products(Model model) {
		model.addAttribute("products", productService.getAll());
		return "productsAdmin";
	}
}
