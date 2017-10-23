/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Customer implements Serializable {
	private static final long serialVersionUID = -2930448216032136579L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@NotEmpty
	@Size(min = 2, max = 40)
	private String firstName;
	
	@NotEmpty
	@Size(min = 2, max = 40)
	private String lastName;
	


	 @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="payment_id", nullable = true, insertable=false, updatable=false)
	private Payment payment;


	 @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="address_id", nullable = true, insertable=false, updatable=false)
	private Address address;

	@NotEmpty
	String cellPhone;

	String notes;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable
	private List<CustomerOrder> orderList = new ArrayList<CustomerOrder>();
	

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cart_id")
	private Cart cart;

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the payment
	 */
	public Payment getPayment() {
		return payment;
	}

	/**
	 * @param payment
	 *            the payment to set
	 */
	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	/**
	 * @return the cellPhone
	 */
	public String getCellPhone() {
		return cellPhone;
	}

	/**
	 * @param cellPhone
	 *            the cellPhone to set
	 */
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	/**
	 * @return the notes
	 */
	public String getNotes() {
		return notes;
	}

	/**
	 * @param notes
	 *            the notes to set
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}

	/**
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(Address address) {
		this.address = address;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<CustomerOrder> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<CustomerOrder> orderList) {
		this.orderList = orderList;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

}
