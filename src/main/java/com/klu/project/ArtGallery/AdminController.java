package com.klu.project.ArtGallery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminDAO adminDAO; // DAO for admin authentication

    @Autowired
    private UserInterface userRepository; // Repository for user data

    // Display Login Form
    @GetMapping("/admin_login")
    public String showLoginForm(Model model) {
        model.addAttribute("admin", new Admin()); // Add Admin object to model
        return "admin_login"; // Returns the JSP view for admin login
    }

    // Process Login Form Submission
    @PostMapping("/admin_login")
    public String processLogin(@ModelAttribute("admin") Admin admin, Model model, HttpSession session) {
        // Use DAO to check credentials
        Admin foundAdmin = adminDAO.findByUsernameAndPasswordForAdmin(admin.getUsername(), admin.getPassword());

        if (foundAdmin != null) {
            session.setAttribute("currentAdmin", foundAdmin); // Store the logged-in admin in session
            return "redirect:/admindash"; // Redirect to the admin dashboard after successful login
        } else {
            model.addAttribute("error", "Invalid username or password"); // Show error if credentials are incorrect
            return "admin_login"; // Reload the login page with error message
        }
    }

    // Display Admin Dashboard
    @RequestMapping("/admindash")
    public String showAdminDashboard(HttpSession session) {
        // Check if admin is logged in by checking session attribute
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");
        if (currentAdmin == null) {
            return "redirect:/admin_login"; // If no admin is logged in, redirect to login page
        }
        return "admindash"; // Return the admin dashboard view
    }

    // View All Users (after successful login)
    @RequestMapping("/view_users")
    public String viewUsers(Model model, HttpSession session) {
        // Check if the admin is logged in
        Admin currentAdmin = (Admin) session.getAttribute("currentAdmin");
        if (currentAdmin == null) {
            return "redirect:/admin_login"; // Redirect to login page if not logged in
        }

        // Fetch all users from the repository
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users); // Add the users list to the model
        return "viewAllUsers"; // Return the view that displays all users
    }

    // Logout (invalidate session)
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/admin_login"; // Redirect to login page after logout
    }
}
