package com.klu.project.ArtGallery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;

@Repository
public class AdminImpl implements AdminDAO
{

    @Autowired
    private AdminInterface a;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Admin findByUsernameAndPasswordForAdmin(String username, String password) {
        try 
        {
           
            String query = "SELECT a FROM Admin a WHERE a.username = :username AND a.password = :password";
            return entityManager.createQuery(query, Admin.class)
                                .setParameter("username", username)
                                .setParameter("password", password)
                                .getSingleResult();
        }
        catch (NoResultException e)
        {
            
            return null;
        }
    }
}
