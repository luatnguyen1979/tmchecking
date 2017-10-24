package edu.mum.petsmart.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;


@Entity (name="product")
public class Product implements Serializable {
	
	private static final long serialVersionUID = 3375286077364928608L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name="title")
	@NotEmpty
	private String name;
	@NotEmpty
	private String tag;
	@NotEmpty
	private String details;
	
	@Transient
	private MultipartFile image;
	
	@NotNull
	@Max(100000)
	@Min(0)
	private Double price;
	@NotNull
	@Max(100)
	@Min(0)
	private Integer quantity; 
	
	public Product() {}
	
	public Product(String name, String details, Double price) {
		this.name = name;
		this.details = details;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * @return the image
	 */
	public MultipartFile getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
}
