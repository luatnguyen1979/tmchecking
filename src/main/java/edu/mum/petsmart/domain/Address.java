/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * @author Van Gia Luat Nguyen
 *
 */
@Entity
public class Address implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5193877140370240037L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@NotEmpty
	@Size(min = 3, max = 40)
	private String street1;

	private String street2;

	@NotEmpty
	@Size(min = 3, max = 40)
	private String city;

	@NotEmpty
	@Size(min = 2, max = 2)
	private String state;

	@NotNull
	@Digits(integer = 5, fraction = 2)
	private Integer zipCode;

	@NotEmpty
	@Size(min = 3, max = 40)
	private String country;

}
