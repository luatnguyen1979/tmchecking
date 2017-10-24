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
import javax.validation.constraints.Pattern;
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
	private Long id;

	@NotEmpty(message="{Paymentmethod.validation}")
	String paymentMethod;

	@NotEmpty(message="{Empty.validation}")
	@Size(min = 3, max = 40, message= "{Size.validation}")
	String fullName;

	@NotEmpty(message="{Empty.validation}")
	@Size(min = 16, max = 16, message="{Address.size.16digits.validation}")
	@Pattern(regexp = "[0-9]+", message = "{Pattern.number.validation}")
	String cardNumber;

	@NotEmpty(message="{Empty.validation}")
	@Size(min = 3, max = 3,  message="{Address.size.3digits.validation}")
	@Pattern(regexp = "[0-9]+", message = "{Pattern.number.validation}")
	String ccv;

	String expirationMonth;
	
	String expirationYear;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Long id) {
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
	public String getExpirationMonth() {
		return expirationMonth;
	}

	/**
	 * @param expirationDate
	 *            the expirationDate to set
	 */
	public void setExpirationMonth(String expiration) {
		this.expirationMonth = expiration;
	}

	/**
	 * @return the expirationYear
	 */
	public String getExpirationYear() {
		return expirationYear;
	}

	/**
	 * @param expirationYear the expirationYear to set
	 */
	public void setExpirationYear(String expirationYear) {
		this.expirationYear = expirationYear;
	}

	
}
