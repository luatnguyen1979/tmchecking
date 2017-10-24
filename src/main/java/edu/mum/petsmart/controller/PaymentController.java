/**
 * 
 */
package edu.mum.petsmart.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.mum.petsmart.domain.Payment;
import edu.mum.petsmart.service.PaymentService;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 24, 2017
 * @product Web Application Architecture
 */
@Controller
@SessionAttributes({"customer", "customerOrder", "cart", "billingAddress", "shippingAddress", "orderPayment"})
@RequestMapping(value="/payment")
public class PaymentController {
	@Autowired
	PaymentService paymentService;
	
	@RequestMapping(value = {"/add"}, method=RequestMethod.POST)
	public @ResponseBody Payment addPayment(@Valid @RequestBody Payment payment, Model model, HttpSession session) {		
		//paymentService.save(payment);
		model.addAttribute("orderPayment", payment);
		return payment;
  
	}
}
