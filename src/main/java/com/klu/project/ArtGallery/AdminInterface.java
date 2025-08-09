package com.klu.project.ArtGallery;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminInterface extends JpaRepository<Admin, String> 
{
     Admin findByUsernameAndPassword(String username, String password);
     
}
