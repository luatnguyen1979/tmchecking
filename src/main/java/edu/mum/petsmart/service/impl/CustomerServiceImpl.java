/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.service.impl;

import java.util.ArrayList;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.CustomerOrder;

import edu.mum.petsmart.repository.CustomerRepository;
import edu.mum.petsmart.service.CustomerService;

/**
 * @author Van Gia Luat Nguyen
 *
 */

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerRepository customerRepository;

	/*
	 * (non-Javadoc)
	 * 
	 * @see edu.mum.petsmart.service.CustomerService#getCustomer(java.lang.Long)
	 */
	@Override
	public Customer getCustomer(long cusId) {

		return customerRepository.findOne(cusId);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see edu.mum.petsmart.service.CustomerService#save(edu.mum.petsmart.domain.
	 * Customer)
	 */
	@Override
	public Customer save(Customer customer) {
		
		return customerRepository.save(customer);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see edu.mum.petsmart.service.CustomerService#update(edu.mum.petsmart.domain.
	 * Customer)
	 */
	@Override
	public Customer update(Customer cust, CustomerOrder order) {
		return customerRepository.save(cust);
	}

}
