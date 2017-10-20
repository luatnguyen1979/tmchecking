package edu.mum.petsmart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Cart;
import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.repository.CartRepository;


public interface CartService {
	
	public Cart updateCart(Cart cart);
	public Cart save(Cart cart);
	public Cart get(long id);

	
}
