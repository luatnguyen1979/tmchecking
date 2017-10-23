/**
 * 
 */
package edu.mum.petsmart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Payment;
import edu.mum.petsmart.repository.PaymentRepository;
import edu.mum.petsmart.service.PaymentService;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	PaymentRepository paymentRep;
	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.Payment#getPayment(java.lang.Long)
	 */
	@Override
	public Payment getPayment(long paymentId) {
		// TODO Auto-generated method stub
		return paymentRep.findOne(paymentId);
	}

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.Payment#save(edu.mum.petsmart.service.Payment)
	 */
	@Override
	public Payment save(Payment payment) {
		// TODO Auto-generated method stub
		return paymentRep.save(payment);
	}

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.Payment#update(edu.mum.petsmart.service.Payment)
	 */
	@Override
	public Payment update(Payment payment) {
		// TODO Auto-generated method stub
		return paymentRep.save(payment);
	}

}
