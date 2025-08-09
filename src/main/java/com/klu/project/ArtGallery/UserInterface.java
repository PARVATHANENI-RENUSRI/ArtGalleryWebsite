package com.klu.project.ArtGallery;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface UserInterface extends JpaRepository<User, Long> 
{
	
	
	 User findByEmailAndPassword(String email, String password);

	static List<User> getAllUsers() 
	{
		
		return null;
	}
    
	
}
