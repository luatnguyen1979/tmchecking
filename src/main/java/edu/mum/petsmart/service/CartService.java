package edu.mum.petsmart.service;

import java.util.List;

import edu.mum.petsmart.domain.Cart;


public interface CartService {
	
	public Cart updateCart(Cart cart);
	public Cart save(Cart cart);
	public Cart get(long id);
	public boolean contains(Cart cart);
	void delete(long id);
	public List<Cart> getAll();
}
