package edu.mum.petsmart.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;




@Entity
public class Cart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4761112110046894436L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable
	private List<Item> cartItems;
	
	public Cart() {
		cartItems = new ArrayList<>();
	}
	
	public long getId() {
		return id;
	}

	public List<Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<Item> cartItems) {
		this.cartItems = cartItems;
	}

	public void addCartItem(Item cartItem) {
		cartItems.add(cartItem);
	}
	
}
