/**
 * 
 */
package edu.mum.petsmart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Address;
import edu.mum.petsmart.repository.AddressRepository;
import edu.mum.petsmart.service.AddressService;

/**
 * @author Van Gia Luat Nguyen
 * @date Oct 22, 2017
 * @product Web Application Architecture
 */

@Service
@Transactional
public class AddressServiceImpl implements AddressService {

	@Autowired
	AddressRepository addrRep;
	/* (non-Javadoc)
	 * @see org.springframework.data.repository.CrudRepository#count()
	 */

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.AddressService#getAddress(java.lang.Long)
	 */
	@Override
	public Address getAddress(long addrId) {
		// TODO Auto-generated method stub
		return addrRep.findOne(addrId);
	}

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.AddressService#save(edu.mum.petsmart.domain.Address)
	 */
	@Override
	public Address save(Address addr) {
		// TODO Auto-generated method stub
		return addrRep.save(addr);
	}

	/* (non-Javadoc)
	 * @see edu.mum.petsmart.service.AddressService#update(edu.mum.petsmart.domain.Address)
	 */
	@Override
	public Address update(Address addr) {
		// TODO Auto-generated method stub
		return addrRep.save(addr);
	}
	

}
