package edu.mum.petsmart.service;

import java.util.List;

import edu.mum.petsmart.domain.Product;


public interface ProductService {

	public Product save(Product product);
	public List<Product> saveAll(List<Product> Products);
	public List<Product> getAll();
	
	public void delete(Long id);
	
	public Product findOne(Long id);	

	public List<Product> findProducts(String keyword);	

}
