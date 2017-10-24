/**
 * 
 */
package edu.mum.petsmart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.CustomerOrder;
import edu.mum.petsmart.repository.CustomerOrderRepository;
import edu.mum.petsmart.service.CustomerOrderService;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */
@Service
@Transactional
public class CustomerOrderServiceImpl implements CustomerOrderService {
	
	@Autowired
	CustomerOrderRepository custOrderRep;

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.CustomerOrderService#getCustomerOrder(java.lang.Long)
	 */
	@Override
	public CustomerOrder getCustomerOrder(long custId) {
		// TODO Auto-generated method stub
		return custOrderRep.findOne(custId);
	}

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.CustomerOrderService#save(edu.mum.petsmart.domain.CustomerOrder)
	 */
	@Override
	public CustomerOrder save(CustomerOrder custOrder) {
		// TODO Auto-generated method stub
		return custOrderRep.save(custOrder);
	}

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.CustomerOrderService#update(edu.mum.petsmart.domain.CustomerOrder)
	 */
	@Override
	public CustomerOrder update(CustomerOrder custOrder) {
		// TODO Auto-generated method stub
		return custOrderRep.save(custOrder);
	}

	@Override
	public List<CustomerOrder> getAll() {
		return (List<CustomerOrder>) custOrderRep.findAll();
	}
	
}
