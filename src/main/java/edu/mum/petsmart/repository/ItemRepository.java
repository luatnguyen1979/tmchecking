package edu.mum.petsmart.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.Item;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long>{

}
