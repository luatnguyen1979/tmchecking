package edu.mum.petsmart.repository;


import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import edu.mum.petsmart.domain.Login;

@Repository
public interface UserRepository extends  PagingAndSortingRepository<Login, Long> 
{

	public Login findByUserId(String userId);
}

