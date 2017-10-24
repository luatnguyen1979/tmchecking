/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.service;

import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.CustomerOrder;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public interface CustomerService {
	
	public Customer getCustomer(long cusId);
	public Customer save(Customer customer);
	public Customer update(Customer customer, CustomerOrder order);

}
