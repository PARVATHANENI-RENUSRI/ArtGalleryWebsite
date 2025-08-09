package com.klu.project.ArtGallery;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jakarta.persistence.Query;

@Service
public class ImplClass implements UserDAO {

    @Autowired
    private UserInterface u;  // Assuming this is a Spring Data JPA repository interface

    @Autowired
    private SessionFactory sessionFactory; // Inject the SessionFactory

    @Override
    public String insertUser(User user) {
        // Using the injected repository to save the user
        u.save(user); 
        return "User inserted successfully"; 
    }

    @Override
    public User findByEmailAndPassword(String email, String password) {
        // Calls the repository's findByEmailAndPassword
        return u.findByEmailAndPassword(email, password);
    }

    // Method to authenticate a user by email and password
    public boolean authenticateUser(String email, String password) {
        User user = u.findByEmailAndPassword(email, password);
        return user != null;  // Return true if the user exists, false otherwise
    }

    @Override
    public List<User> findAllUsers()
    {
      
        Session session = sessionFactory.getCurrentSession(); // Get current session from SessionFactory
        session.beginTransaction();
        
       
        Query query = session.createQuery("from User", User.class);
        List<User> users = query.getResultList();
        
        session.getTransaction().commit(); 
        return users;
    }
}
