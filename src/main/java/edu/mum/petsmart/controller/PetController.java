/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.service.CartService;
import edu.mum.petsmart.service.ItemService;
import edu.mum.petsmart.service.ProductService;

@Controller
public class PetController {

	private long cartId = 1;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	CartService cartService;

	@RequestMapping(value= {"welcome", "/"}, method=RequestMethod.GET)
	public String welcome() {
		return "forward:products";
	}
	
	@RequestMapping(value = "/products", method=RequestMethod.GET)
	public String products(Model model) {
		model.addAttribute("products", productService.getAll());
		return "products";
	}
	
	@RequestMapping(value = "/product/{productId}", method=RequestMethod.GET)
	@ResponseBody
	public Product product(@PathVariable("productId") Long productId, Model model) {
		System.out.println(productId + "--------------");
		return productService.findOne(productId);
	}
	
	@RequestMapping(value = "/addToCart/{productId}/{quantity}", method=RequestMethod.POST)
	@ResponseBody
	public String addToCart(@PathVariable long productId, @PathVariable int quantity) {
		Product product = productService.findOne(productId);
		Item newItem = new Item();
		
		newItem.setProduct(product);
		newItem.setQuantiry(quantity);
		
		itemService.save(newItem);
		
		Cart tempCart = cartService.get(cartId);
		
		tempCart.addCartItem(newItem);
		
		cartService.save(tempCart);
		return String.valueOf(tempCart.getCartItems().size());
	}
	
	@RequestMapping(value = "/cart", method=RequestMethod.GET)
	public String cart(Model model) throws Exception {
		
		
		List<Item> cartItems;
		try{
			cartItems = cartService.get(cartId).getCartItems();
		}catch(RuntimeException rte) {
			throw new Exception("Failed to retrive Cart" + rte);
		}
		
		model.addAttribute("items", cartItems);
		
		return "cart";
	}

	@RequestMapping(value = "/removeItem/{itemId}")
	public String removeFromCart(@PathVariable long itemId) {
		Cart testCart = cartService.get(cartId);
		for(int i = 0; i < testCart.getCartItems().size(); i++) {
			if(testCart.getCartItems().get(i).getId() == itemId) {
				testCart.getCartItems().remove(i);
			}
		}
		cartService.save(testCart);
		return "redirect:/cart";
	}
}
