package edu.mum.petsmart.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{

	
}
