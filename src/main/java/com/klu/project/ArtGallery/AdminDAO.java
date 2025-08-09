package com.klu.project.ArtGallery;

public interface AdminDAO
{
	Admin findByUsernameAndPasswordForAdmin(String username, String password);
}
