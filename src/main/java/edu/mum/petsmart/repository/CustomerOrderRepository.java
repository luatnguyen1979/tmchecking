/**
 * 
 */
package edu.mum.petsmart.repository;

import org.springframework.data.repository.CrudRepository;

import edu.mum.petsmart.domain.CustomerOrder;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */
public interface CustomerOrderRepository extends CrudRepository<CustomerOrder, Long> {

}
