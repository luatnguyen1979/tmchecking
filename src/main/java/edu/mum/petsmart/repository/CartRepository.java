package edu.mum.petsmart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.Cart;

@Repository
public interface CartRepository extends CrudRepository<Cart, Long>{

	@Query("SELECT c FROM Cart c WHERE c.id = :id")
	public List<Cart> getById(@Param("id") long id);
	
	@Query("DELETE FROM Cart c WHERE c.id = :id")
	public void deleteById(@Param("id") long id);
}
