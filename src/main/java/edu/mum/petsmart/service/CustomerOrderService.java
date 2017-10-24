/**
 * 
 */
package edu.mum.petsmart.service;

import java.util.List;

import edu.mum.petsmart.domain.CustomerOrder;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */


public interface CustomerOrderService {
	public CustomerOrder getCustomerOrder(long custId);
	public CustomerOrder save(CustomerOrder custOrder);
	public CustomerOrder update(CustomerOrder custOrder);
	public List<CustomerOrder> getAll();
}
