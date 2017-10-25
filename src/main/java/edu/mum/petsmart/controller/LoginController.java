package edu.mum.petsmart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Login;
import edu.mum.petsmart.service.CartService;
import edu.mum.petsmart.service.CustomerService;
import edu.mum.petsmart.service.ItemService;
import edu.mum.petsmart.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	SessionHelper sessionHelper;

 	@RequestMapping(value ="/login", method=RequestMethod.GET)
	public String login(@ModelAttribute("login") Login login, Model model) {
 		model.addAttribute("errors", "");
 		return "login";
	}
	
 	@RequestMapping(value ="/login", method=RequestMethod.POST)
	public String doLogin(@ModelAttribute("login") Login login, Model model,  HttpServletRequest request) {
 		
 		Login l = loginService.findByUsername(login.getUserId());
 		if (l != null) {
 			if (l.getPassword().equals(login.getPassword())) {
 				request.getSession().setAttribute("login", l);
 				
 				if ("ADMIN".equals(l.getRole())) {
 					return "redirect:admin";
 				} else {
 					if(request.getSession().getAttribute("cart") == null ||
 							!cartService.contains((Cart) request.getSession().getAttribute("cart"))) {
 						Cart cart = new Cart();
 						cartService.save(cart);
 						request.getSession().setAttribute("cart", cart);
 						request.getSession().setAttribute("cartItems", 0);
 					}
 					
 					Customer customer = l.getCustomer();
 					Cart sessionCart = cartService.get(((Cart)request.getSession().getAttribute("cart")).getId());
 					
 					if(customer.getCart() != null) {
 						for(Item i : customer.getCart().getCartItems()) {
 							Item newItem = new Item();
 							newItem.setDiscount(i.getDiscount());
 							newItem.setProduct(i.getProduct());
 							newItem.setQuantity(i.getQuantity());
 							itemService.save(newItem);
 							
 							sessionCart.addCartItem(newItem);
 						}
 					}
 					cartService.save(sessionCart);
 					
 					customer.setCart(sessionCart);
 					
 					customerService.save(customer);
 					
// 					if(l.getCustomer().getCart() == null) {
// 	 					Cart newCustomerCart = new Cart();
// 	 					cartService.save(newCustomerCart);
// 	 					l.getCustomer().setCart(newCustomerCart);
// 	 				}
// 					
// 	 				Cart customerCart = l.getCustomer().getCart();
// 	 				
// 	 				if ((Cart)request.getSession().getAttribute("cart") != null) {
// 	 	 				Cart sessionCart = cartService.get(((Cart)request.getSession().getAttribute("cart")).getId());
// 	 	 				
// 	 	 				List<Item> customerItems = customerCart.getCartItems();
// 	 	 				List<Item> sessionItems = sessionCart.getCartItems();
// 	 	 				
// 	 	 				for(Item item: sessionItems) {
// 	 	 					
// 	 	 					Item newItem = new Item();
// 	 	 					newItem.setDiscount(item.getDiscount());
// 	 	 					newItem.setProduct(item.getProduct());
// 	 	 					newItem.setQuantity(item.getQuantity());
// 	 	 					
// 	 	 					itemService.save(newItem);
// 	 	 	 				customerCart.getCartItems().add(newItem);
// 	 	 				}
// 	 	 				List<Item> items = new ArrayList<>();
// 	 	 				sessionCart.setCartItems(items);
// 	 	 				for(Item item: customerItems) {
// 	 	 					
// 	 	 					Item newItem = new Item();
// 	 	 					newItem.setDiscount(item.getDiscount());
// 	 	 					newItem.setProduct(item.getProduct());
// 	 	 					newItem.setQuantity(item.getQuantity());
// 	 	 					
// 	 	 					itemService.save(newItem);
// 	 	 	 				sessionCart.getCartItems().add(newItem);
// 	 	 				}
// 	 	 				
// 	 	 				
// 	 	 				cartService.save(customerCart);
// 	 	 				cartService.save(sessionCart);
// 	 				}
 	 				//customerService.save(l.getCustomer());
 					
 					return "redirect:products";
 				}
 			}
 		}
 		
 		model.addAttribute("errors", "Login failed. Please check you username and password.");
 		return "login";
	}
 	 
 	@RequestMapping(value ="/logout")
	public String logout(@ModelAttribute("login") Login login, HttpServletRequest request) {
 		request.getSession().removeAttribute("login");
 		return "redirect:products";
	}
 	
 	
 	@RequestMapping(value ="/addUser")
	public String addUser(@ModelAttribute("login") Login login) {
 		return "addUser";
	}

 	@RequestMapping(value ="/createUser")
	public String createUser(@Valid @ModelAttribute("login") Login login, BindingResult bindingResult) {
 		if (bindingResult.hasErrors()) {
 	 		return "addUser";
 		}
 		
 		login.setPassword(login.getPassword().replaceAll(",", ""));
 		login.setRole("USER");
 		loginService.save(login);
 		return "redirect:login";
	}

 	
 	
 	
}
