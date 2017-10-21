/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.repository;

import org.springframework.data.repository.CrudRepository;

import edu.mum.petsmart.domain.Customer;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public interface CustomerRepository extends CrudRepository<Customer, Long> {

}
