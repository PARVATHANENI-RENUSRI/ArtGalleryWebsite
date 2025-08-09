package com.klu.project.ArtGallery;

import java.util.List;

public interface UserDAO 
{   
    public String insertUser(User user);
    public User findByEmailAndPassword(String email, String password);
    public List<User> findAllUsers();
}
