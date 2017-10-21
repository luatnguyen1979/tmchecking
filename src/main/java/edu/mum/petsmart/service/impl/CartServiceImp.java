package edu.mum.petsmart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.repository.CartRepository;
import edu.mum.petsmart.service.CartService;

@Service
@Transactional
public class CartServiceImp implements CartService{

	@Autowired
	CartRepository cartRepository;
	
	@Override
	public Cart updateCart(Cart cart) {
		cartRepository.delete(cart.getId());
		return cartRepository.save(cart);
	}

	@Override
	public Cart save(Cart cart) {
		return cartRepository.save(cart);
	}

	@Override
	public Cart get(long id) {
		return cartRepository.findOne(id);
	}

	@Override
	public boolean contains(Cart cart) {
		return cartRepository.findOne(cart.getId()) != null;
	}

}
