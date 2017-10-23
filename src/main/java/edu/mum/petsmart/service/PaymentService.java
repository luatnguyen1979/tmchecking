/**
 * 
 */
package edu.mum.petsmart.service;

import org.springframework.data.repository.CrudRepository;

import edu.mum.petsmart.domain.Payment;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */
public interface PaymentService {
	public Payment getPayment(long paymentId);
	public Payment save(Payment payment);
	public Payment update(Payment payment);
}
