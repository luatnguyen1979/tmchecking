package edu.mum.petsmart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Product;
import edu.mum.petsmart.repository.ProductRepository;
import edu.mum.petsmart.service.ProductService;

@Service
@Transactional
public class ProductServiceImp implements ProductService{

	@Autowired
	ProductRepository productRepository;
	
	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}
	
	@Override
	public List<Product> getAll(){
		return (List<Product>) productRepository.findAll();
		
	}

	@Override
	public List<Product> saveAll(List<Product> products) {
		return (List<Product>) productRepository.save(products);
	}

	@Override
	public void delete(Long id) {
		productRepository.delete(id);
	}

	@Override
	public Product findOne(Long id) {
		return productRepository.findOne(id);
	}


}
