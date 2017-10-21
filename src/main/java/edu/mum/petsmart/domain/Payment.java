/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.domain;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import edu.mum.petsmart.util.PaymentMethod;

/**
 * @author Van Gia Luat Nguyen
 *
 */
@Entity
public class Payment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3831595884958390537L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@NotEmpty
	String paymentMethod;

	@NotEmpty
	@Size(min = 3, max = 40)
	String fullName;

	@NotEmpty
	@Size(min = 16, max = 16)
	String cardNumber;

	@NotEmpty
	@Size(min = 3, max = 3)
	String ccv;

	@NotEmpty
	@Size(min=7, max=7)
	String expiration;

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
	 * @return the paymentMethod
	 */
	public String getPaymentMethod() {
		return paymentMethod;
	}

	/**
	 * @param paymentMethod
	 *            the paymentMethod to set
	 */
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the cardNumber
	 */
	public String getCardNumber() {
		return cardNumber;
	}

	/**
	 * @param cardNumber
	 *            the cardNumber to set
	 */
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	/**
	 * @return the ccv
	 */
	public String getCcv() {
		return ccv;
	}

	/**
	 * @param ccv
	 *            the ccv to set
	 */
	public void setCcv(String ccv) {
		this.ccv = ccv;
	}

	/**
	 * @return the expirationDate
	 */
	public String getExpiration() {
		return expiration;
	}

	/**
	 * @param expirationDate
	 *            the expirationDate to set
	 */
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}

}
