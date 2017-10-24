/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.EmailForm;
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.service.CartService;
import edu.mum.petsmart.service.ItemService;
import edu.mum.petsmart.service.ProductService;

@Controller
@SessionAttributes("cart")
public class PetController {

	@Autowired
	ProductService productService;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	CartService cartService;

	@RequestMapping(value= {"welcome", "/"}, method=RequestMethod.GET)
	public String welcome(Model model, HttpServletRequest request) {
		model.addAttribute("products", productService.getAll());
		if(request.getSession().getAttribute("cart") == null ||
				!cartService.contains((Cart) request.getSession().getAttribute("cart"))) {
			Cart cart = new Cart();
			cartService.save(cart);
			
			request.getSession().setAttribute("cart", cart);
		}
		
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
	public String addToCart(@PathVariable("productId") long productId, @PathVariable("quantity") int quantity,
			HttpServletRequest request) {
		Product product = productService.findOne(productId);
		Item newItem = new Item();
		
		newItem.setProduct(product);
		newItem.setQuantity(quantity);
		newItem.setDiscount(product.getPrice() * quantity);
		
		itemService.save(newItem);
		
		long cartId = ((Cart)request.getSession().getAttribute("cart")).getId();
		
		Cart tempCart = cartService.get(cartId);
		
		tempCart.addCartItem(newItem);
		
		cartService.save(tempCart);
		return String.valueOf(tempCart.getCartItems().size());
	}
	
	@RequestMapping(value = "/cart", method=RequestMethod.GET)
	public String cart(Model model, HttpServletRequest request) throws Exception {
		if(request.getSession().getAttribute("cart") == null ||
				!cartService.contains((Cart) request.getSession().getAttribute("cart"))) {
			Cart cart = new Cart();
			cartService.save(cart);
			
			request.getSession().setAttribute("cart", cart);
		}
		
		List<Item> cartItems;
		long cartId = ((Cart)request.getSession().getAttribute("cart")).getId();
		try{
			cartItems = cartService.get(cartId).getCartItems();
			model.addAttribute("totalCost", cartService.get(cartId).getTotalPrice());
		}catch(RuntimeException rte) {
			throw new Exception("Failed to retrive Cart Items" + rte);
		}
		
		model.addAttribute("items", cartItems);
		
		return "cart";
	}

	@RequestMapping(value = "/removeItem/{itemId}")
	public String removeFromCart(@PathVariable long itemId, HttpServletRequest request) {
		long cartId = ((Cart)request.getSession().getAttribute("cart")).getId();
		Cart testCart = cartService.get(cartId);
		
		for(int i = 0; i < testCart.getCartItems().size(); i++) {
			if(testCart.getCartItems().get(i).getId() == itemId) {
				testCart.getCartItems().remove(i);
			}
		}
		cartService.save(testCart);
		return "redirect:/cart";
	}
	@RequestMapping(value = "/updateCart")
	public String updateCart(HttpServletRequest request) {
		long cartId =((Cart)request.getSession().getAttribute("cart")).getId();
		Cart tempCart = cartService.get(cartId);

		int quantity = Integer.parseInt((String) request.getParameter("quantity"));
		long itemId = Long.parseLong((String) request.getParameter("itemId"));
		
		for(int i = 0; i < tempCart.getCartItems().size(); i++) {
			if(tempCart.getCartItems().get(i).getId() == itemId) {
				Item tempItem = tempCart.getCartItems().get(i);
				tempItem.setQuantity(quantity);
				tempItem.setDiscount(tempItem.getQuantity()*tempItem.getProduct().getPrice());
				itemService.save(tempItem);
			}
		}
		
		cartService.save(tempCart);
		
		return "redirect:/cart";
	}


}
