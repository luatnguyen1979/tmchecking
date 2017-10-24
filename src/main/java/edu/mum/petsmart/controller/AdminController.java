package edu.mum.petsmart.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.dto.DomainErrors;
import edu.mum.petsmart.service.CustomerOrderService;
import edu.mum.petsmart.service.ProductService;

@Controller
public class AdminController {
	
	@Autowired
	ProductService productService;

	@Autowired
	CustomerOrderService customerOrderService;

	
	@Autowired
	MessageSourceAccessor messageAccessor;
	
	@RequestMapping(value = "/admin", method=RequestMethod.GET)
	public String products(@ModelAttribute("product")Product product, Model model) {
		model.addAttribute("products", productService.getAll());
		return "admin";
	}
	
	
	@RequestMapping(value = "/adminSearch", method=RequestMethod.GET)
	public String search(@ModelAttribute("product")Product product, @RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("keyword", keyword);
		model.addAttribute("products", productService.findProducts(keyword));
		return "admin";
	}	

	@RequestMapping(value = "/saveProduct", method=RequestMethod.POST)
	public String saveProducts(@Valid @ModelAttribute("product")Product product, BindingResult bindingResult,
			Model model, HttpServletRequest request) {
		
		if (bindingResult.hasErrors()) {
			return "redirect:admin";
		}
		
		Product newProduct = null;
		if (product.getId() != null) {
			newProduct = productService.findOne(product.getId());
			newProduct.setDetails(product.getDetails());
			newProduct.setName(product.getName());
			newProduct.setTag(product.getTag());
			newProduct.setPrice(product.getPrice());
			newProduct.setQuantity(product.getQuantity());
		} 

		newProduct = productService.save(product);
		
		// save product here
		model.addAttribute("product", newProduct);
		
		try {
			if (!product.getImage().isEmpty()) {
				String rootDirectory = request.getSession().getServletContext().getRealPath("/");
				product.getImage().transferTo(new File(rootDirectory + "resources\\images\\products\\" + product.getId() + ".jpg"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return "redirect:admin";
	}
	
	
	@RequestMapping(value = "/validate", method=RequestMethod.POST)
	@ResponseBody
	public DomainErrors validate(@Valid @RequestBody Product product) {
		DomainErrors errors = new DomainErrors();
		return errors;
	}
	
	
	@RequestMapping(value = "/deleteProduct", method=RequestMethod.POST)
	public String saveProducts(@ModelAttribute("product")Product product) {
		productService.delete(product.getId());
		return "redirect:admin";
	}	
	
	
	@RequestMapping(value = "/orders", method=RequestMethod.GET)
	public String orders(Model model) {
		model.addAttribute("orders", customerOrderService.getAll());
		return "orders";
	}	
}
