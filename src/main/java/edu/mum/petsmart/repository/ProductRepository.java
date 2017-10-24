package edu.mum.petsmart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
	
	@Query("select a from product a where a.name like concat('%',:keyword,'%')")
	List<Product> findProductsByKeywork(@Param("keyword") String keyword);
	
}
