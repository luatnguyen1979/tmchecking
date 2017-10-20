package edu.mum.petsmart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Item;
import edu.mum.petsmart.repository.ItemRepository;
import edu.mum.petsmart.service.ItemService;

@Service
@Transactional
public class ItemServiceImp implements ItemService{

	@Autowired
	ItemRepository itemRepository;
	
	@Override
	public Item save(Item cartItem) {
		return itemRepository.save(cartItem);
	}
	
	@Override
	public Item get(long id) {
		return itemRepository.findOne(id);
	}

	@Override
	public void delete(long id) {
		itemRepository.delete(id);
	}



}
