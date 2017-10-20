/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.service;

import java.util.List;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Customer;
import edu.mum.petsmart.domain.Order;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public interface CustomerService {
	public Order getOrderById(Integer orderId);
	public List<Order> getOrderListById();
	public Cart getCart();
	public Customer save(Customer customer);
	public Customer update(Customer customer);

}
