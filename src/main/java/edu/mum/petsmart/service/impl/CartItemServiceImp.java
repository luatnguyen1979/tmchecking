package edu.mum.petsmart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.CartItem;
import edu.mum.petsmart.repository.CartItemRepository;
import edu.mum.petsmart.service.CartItemService;

@Service
@Transactional
public class CartItemServiceImp implements CartItemService{

	@Autowired
	CartItemRepository cartItemRepository;
	
	@Override
	public CartItem save(CartItem cartItem) {
		return cartItemRepository.save(cartItem);
	}

}
