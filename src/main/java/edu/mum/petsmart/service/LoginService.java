package edu.mum.petsmart.service;

import java.util.List;

import edu.mum.petsmart.domain.Login;

 

public interface LoginService {
	
	public Login save(Login user);	
	
	public void delete(Long id);	
	
	public void delete(Login user);	
	
	public Login update(Login user);	
	
	public Login findOne(Long id);	
	
	public List<Login> getAll();
	
	public Login findByUsername(String username);	
}
