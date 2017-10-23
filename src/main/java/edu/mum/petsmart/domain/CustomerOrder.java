/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Van Gia Luat Nguyen
 *
 */
@Entity
public class CustomerOrder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8555692489522088753L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@NotNull
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private LocalDate orderDate;

	private double totalPrice;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "billingaddress_id", nullable=true,  insertable=false, updatable=false)
	private Address billingAddress;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "shippingaddress_id", nullable=true,  insertable=false, updatable=false)
	private Address shipingAddress;

	@Email
	String contactEmail;

	String contactCellPhone;

	String notes;
	
	@Valid
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="payment_id", nullable = true,  insertable=false, updatable=false)
	private Payment payment;

	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable
	List<Item> items = new ArrayList<Item>();

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
	 * @return the orderDate
	 */
	public LocalDate getOrderDate() {
		return orderDate;
	}

	/**
	 * @param orderDate
	 *            the orderDate to set
	 */
	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	/**
	 * @return the totalPrice
	 */
	public double getTotalPrice() {
		return totalPrice;
	}

	/**
	 * @param totalPrice
	 *            the totalPrice to set
	 */
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	/**
	 * @return the billingAddress
	 */
	public Address getBillingAddress() {
		return billingAddress;
	}

	/**
	 * @param billingAddress
	 *            the billingAddress to set
	 */
	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
	}

	/**
	 * @return the shipingAddress
	 */
	public Address getShipingAddress() {
		return shipingAddress;
	}

	/**
	 * @param shipingAddress
	 *            the shipingAddress to set
	 */
	public void setShipingAddress(Address shipingAddress) {
		this.shipingAddress = shipingAddress;
	}

	/**
	 * @return the contactEmail
	 */
	public String getContactEmail() {
		return contactEmail;
	}

	/**
	 * @param contactEmail
	 *            the contactEmail to set
	 */
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	/**
	 * @return the contactCellPhone
	 */
	public String getContactCellPhone() {
		return contactCellPhone;
	}

	/**
	 * @param contactCellPhone
	 *            the contactCellPhone to set
	 */
	public void setContactCellPhone(String contactCellPhone) {
		this.contactCellPhone = contactCellPhone;
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
	 * @return the items
	 */
	public List<Item> getItems() {
		return items;
	}

	/**
	 * @param items
	 *            the items to set
	 */

	public void setItems(List<Item> items) {
		this.items = items;
	}

}
