package edu.mum.petsmart.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;

@Entity
public class CartItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3456587136376164966L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	private int number;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="product_Id")
	private Product product;
	
	public CartItem() {}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
