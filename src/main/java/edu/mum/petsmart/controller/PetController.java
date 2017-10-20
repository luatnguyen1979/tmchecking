/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.service.ItemService;
import edu.mum.petsmart.service.CartService;
import edu.mum.petsmart.service.ProductService;
import edu.mum.petsmart.service.impl.ProductServiceImp;

/**
 * @author Van Gia Luat Nguyen
 *
 */

@Controller
public class PetController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	CartService cartService;

	@RequestMapping(value= {"welcome", "/"}, method=RequestMethod.GET)
	public String welcome() {
		Product product = new Product();
		product.setName("cat");
		product.setDetails("fluffy");
		product.setPrice(100.0);
		
		Product product2 = new Product();
		product2.setName("dog");
		product2.setDetails("loyal");
		product2.setPrice(50.0);
		
		productService.save(product);
		productService.save(product2);
		
		Item cartItem = new Item();
		Item cartItem2 = new Item();
		
		cartItem.setProduct(product);
		
		cartItem2.setProduct(product);
		
		itemService.save(cartItem);
		itemService.save(cartItem2);
		
		Cart cart = new Cart();
		cart.addCartItem(cartItem);
		
		
		cartService.save(cart);
		
		cart.addCartItem(cartItem2);
		
		cartService.save(cart);
		
		return "products";
	}
	
	@RequestMapping(value = "/products", method=RequestMethod.GET)
	public String products(Model model) {
		model.addAttribute("products", productService.getAll());
		
		return "products";
	}

}
