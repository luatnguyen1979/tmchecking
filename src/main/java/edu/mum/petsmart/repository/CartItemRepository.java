package edu.mum.petsmart.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.CartItem;

@Repository
public interface CartItemRepository extends CrudRepository<CartItem, Long>{

}
