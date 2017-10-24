package edu.mum.petsmart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.petsmart.domain.Login;
import edu.mum.petsmart.repository.UserRepository;
import edu.mum.petsmart.service.LoginService;


@Service
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired 
	UserRepository userRepository;

	public Login save(Login user) {
		if(user.getPassword().length() < 30) {
			user.setPassword(user.getPassword());
		}
		return userRepository.save(user);
	}

	public void delete(Long id) {
		userRepository.delete(id);		
	}
	
	public void delete(Login user) {
		userRepository.delete(user);		 
	}

	public Login update(Login user) {
		return userRepository.save(user);
	}

	public Login findOne(Long id) {
		// TODO Auto-generated method stub
		return userRepository.findOne(id);
	}

	public List<Login> getAll() {
		// TODO Auto-generated method stub
		return (List<Login>) userRepository.findAll(new Sort(Direction.DESC, "updated"));
	}


	public Login findByUsername(String username) {
		return userRepository.findByUserId(username);
	}

}
