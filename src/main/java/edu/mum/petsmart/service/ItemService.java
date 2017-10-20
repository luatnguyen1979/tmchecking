package edu.mum.petsmart.service;

import edu.mum.petsmart.domain.Item;

public interface ItemService {

	public Item save(Item cartItem);
	public Item get(long id);
	public void delete(long id);
}
