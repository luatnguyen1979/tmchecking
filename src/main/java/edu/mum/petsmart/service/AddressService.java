/**
 * 
 */
package edu.mum.petsmart.service;

import edu.mum.petsmart.domain.Address;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */
public interface AddressService {
	public Address getAddress(long addrId);
	public Address save(Address addr);
	public Address update(Address addr);

}
