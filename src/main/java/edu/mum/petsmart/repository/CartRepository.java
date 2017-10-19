package edu.mum.petsmart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.Cart;

@Repository
public interface CartRepository extends CrudRepository<Cart, Long>{

}
