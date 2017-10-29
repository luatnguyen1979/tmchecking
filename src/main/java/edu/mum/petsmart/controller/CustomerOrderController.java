/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.petsmart.domain.Address;
import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.CustomerOrder;
import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.domain.Payment;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.service.AddressService;
import edu.mum.petsmart.service.CartService;
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
// @RequestMapping(value="/customer")
@SessionAttributes({"customer", "customerOrder", "cart", "billingAddress", "shippingAddress", "orderPayment", "items", "custID"})
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
	
	@Autowired
	CartService cartService;

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(@ModelAttribute("custOrder") CustomerOrder custOrder,
			@ModelAttribute("shipAddr") Address shipAddr,@ModelAttribute("billAddr") Address billAddr,  @ModelAttribute("payment") Payment payment,
			Model model, HttpSession session, HttpServletRequest request) {
		// model.addAttribute("newCustOrder", new CustomerOrder());
		
		List<Item> items = (List<Item>)request.getSession().getAttribute("items");
		if (items == null || items.size() == 0) {
			return "redirect:/emptycart";
		}
		
		
		Long custID = (Long)session.getAttribute("custID");
		if (custID == null) {
			custID = new Long(1);
			model.addAttribute("custID", custID);
		}
		Customer customer = custService.getCustomer(custID);
		Address address = customer.getAddress();
		address.setId(null);
		model.addAttribute("billingAddress", address);
		model.addAttribute("shippingAddress", address);
		Payment pment = customer.getPayment();
		if (pment != null)
			pment.setId(null);
		
		model.addAttribute("orderPayment", pment);
		//List<Item> items = (List<Item>)request.getSession().getAttribute("items");
		custOrder.setItems(items);

		model.addAttribute("customerOrder", custOrder);
		model.addAttribute("customer", customer);
session.setAttribute("customer", customer);
		return "checkout";
	}
	
	@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
	public String placeOrder(@ModelAttribute("custOrder") CustomerOrder custOrder, RedirectAttributes redirectAttributes,
			Model model, HttpSession session, HttpServletRequest request) {
		// model.addAttribute("newCustOrder", new CustomerOrder());
		Customer customer = (Customer) session.getAttribute("customer");
		
		custOrder.setOrderDate(LocalDate.now().toString());
		Cart tempCart = (Cart)request.getSession().getAttribute("cart");
		Cart cart = cartService.get(tempCart.getId());
	
		/*custOrder.setItems(cart.getCartItems());
		custOrder.setTotalPrice(cart.getTotalPrice());
		*/
		List<Item> items = (List<Item>)session.getAttribute("items");
		custOrder.setItems(items);
		custOrder.setTotalPrice(1000);
		
		Address billAddr = (Address) session.getAttribute("billingAddress");
		Address shipAddr = (Address) session.getAttribute("shippingAddress");
		Payment payment = (Payment) session.getAttribute("orderPayment");
		custOrder.setBillingAddress(billAddr);
		custOrder.setShippingAddress(shipAddr);
		custOrder.setPayment(payment);

		customer.getOrderList().add(custOrder);
		
		//custOrder.setItems(cart.getCartItems());

		customer = custService.save(customer);
		
		//custOrder = custOrderService.save(custOrder);
		
		
		//reflect the id of Customer order
		//customer = custService.getCustomer(customer.getId());
		cartService.delete(cart.getId());
		request.getSession().removeAttribute("cart");
		cart = new Cart();
		model.addAttribute("items", new ArrayList<Item>());
		cart.setCartItems(new ArrayList<Item>());
		request.getSession().setAttribute("cart", cart);
		request.getSession().setAttribute("cartItems", 0);
		model.addAttribute("customerOrder", new CustomerOrder());
		//model.addAttribute("customer", customer);
		redirectAttributes.addFlashAttribute("doneCustomerOrder",custOrder);
		model.addAttribute("customer", customer);
		return "redirect:/confirmation";
	}
	
	@RequestMapping(value = "/confirmation", method = RequestMethod.GET)
	public String confirm(Model model) {
		return "ordersuccessful";
	}
	
	@RequestMapping(value = "/emptycart", method = RequestMethod.GET)
	public String emptyCard(Model model) {
		return "emptycart";
	}
	
	private void emptyCart(List<Item> list) {
		while(list.size() > 0) {
			list.remove(0);
		}

	}
	
	

}
