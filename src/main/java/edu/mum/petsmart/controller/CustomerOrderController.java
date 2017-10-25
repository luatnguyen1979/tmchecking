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
@SessionAttributes({"customer", "customerOrder", "cart", "billingAddress", "shippingAddress", "orderPayment"})
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

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(@ModelAttribute("custOrder") CustomerOrder custOrder,
			@ModelAttribute("shipAddr") Address shipAddr,@ModelAttribute("billAddr") Address billAddr,  @ModelAttribute("payment") Payment payment,
			Model model, HttpSession session) {
		// model.addAttribute("newCustOrder", new CustomerOrder());
		
		Customer customer = (Customer) session.getAttribute("customer");
		if (customer == null) {
			customer = custService.getCustomer(1);
		}
		
		
		/*session.setAttribute("billingAddress", billAddr);
		session.setAttribute("shippingAddress", shipAddr);*/
		//session.setAttribute("orderPayment", payment);
		model.addAttribute("billingAddress", customer.getAddress());
		model.addAttribute("shippingAddress", customer.getAddress());
		model.addAttribute("orderPayment", customer.getPayment());

		model.addAttribute("customerOrder", custOrder);
		model.addAttribute("customer", customer);

		return "checkout";
	}
	
	@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
	public String placeOrder(@ModelAttribute("custOrder") CustomerOrder custOrder, RedirectAttributes redirectAttributes,
			Model model, HttpSession session, HttpServletRequest request) {
		// model.addAttribute("newCustOrder", new CustomerOrder());
		Customer customer = (Customer) session.getAttribute("customer");
		//CustomerOrder order = (CustomerOrder) session.getAttribute("customerOrder");
		custOrder.setOrderDate(LocalDate.now().toString());
		List<Item> items = customer.getCart().getCartItems();
		double totalPrice = 0;
		for (Item item: items) {
			double price = item.getProduct().getPrice();
			double realPrice = item.getQuantity() * price - price*item.getDiscount()/100;
			totalPrice += realPrice;
		}
		custOrder.setItems(items);
		custOrder.setTotalPrice(totalPrice);
		
		Address billAddr = (Address) session.getAttribute("billingAddress");
		Address shipAddr = (Address) session.getAttribute("shippingAddress");
		Payment payment = (Payment) session.getAttribute("orderPayment");
		custOrder.setBillingAddress(billAddr);
		custOrder.setShippingAddress(shipAddr);
		custOrder.setPayment(payment);
		List<CustomerOrder> orderList = new ArrayList<CustomerOrder>();
		orderList.add(custOrder);
		//customer.setOrderList(orderList);
		customer.getOrderList().add(custOrder);
		//custService.update(customer, custOrder);
		
		request.getSession().removeAttribute("cart");
		request.getSession().setAttribute("cartItems", 0);
		model.addAttribute("customerOrder", new CustomerOrder());
		model.addAttribute("customer", customer);
		redirectAttributes.addFlashAttribute("customerOrder",custOrder);
		model.addAttribute("customer", customer);
		return "redirect:/confirmation";
	}
	
	@RequestMapping(value = "/confirmation", method = RequestMethod.GET)
	public String confirm(Model model) {
		return "ordersuccessful";
	}

}
