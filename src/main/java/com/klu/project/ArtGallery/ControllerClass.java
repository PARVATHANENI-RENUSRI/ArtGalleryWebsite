package com.klu.project.ArtGallery;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControllerClass 
{

   
    @Autowired
    private UserInterface userRepository;

    
    @GetMapping("/home")
    public String showHomePage() {
        return "home"; 
    }

    
    @GetMapping("/feedback")
    public String showFeedbackPage()
    {
        return "feedback"; 
    }

   
    @GetMapping("/about")
    public String showAboutPage()
    {
        return "about";
    }

    // Register page
    @GetMapping("/register")
    public String showRegisterPage()
    {
        return "register"; 
    }

    // Sign Up form page
    @GetMapping("/signup")
    public String showSignUpForm()
    {
        return "signup"; 
    }

    // Contact page
    @GetMapping("/contact")
    public String showContactPage()
    {
        return "contact"; 
    }

    // Collection page
    @GetMapping("/collection")
    public String showCollectionPage() 
    {
        return "collection"; 
    }

    // Style pages
    @GetMapping("/style1")
    public String showStyle1() {
        return "style1";
    }

    @GetMapping("/style2")
    public String showStyle2() {
        return "style2";
    }

    @GetMapping("/style3")
    public String showStyle3() {
        return "style3";
    }

    @GetMapping("/style4")
    public String showStyle4() {
        return "style4";
    }

    @GetMapping("/style5")
    public String showStyle5() {
        return "style5";
    }

    @GetMapping("/style6")
    public String showStyle6() {
        return "style6";
    }

    @GetMapping("/style7")
    public String showStyle7() {
        return "style7";
    }

    // Collection pages
    @GetMapping("/collection1")
    public String showCollection1() {
        return "collection1";
    }

    @GetMapping("/collection2")
    public String showCollection2() {
        return "collection2";
    }

    @GetMapping("/collection3")
    public String showCollection3() {
        return "collection3";
    }

    @GetMapping("/collection4")
    public String showCollection4() {
        return "collection4";
    }

    // Handling user registration form data submission
    @PostMapping("/adddetails")
    public String formData(@ModelAttribute User user, Model model) {
        // Save user to the database
        userRepository.save(user); 
        
        // Redirect to the login page after successful registration
        return "register"; // Redirect to login page after registration
    }

    // Handling user login
    @PostMapping("/login")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model) {
        // Attempt to authenticate the user
        User user = userRepository.findByEmailAndPassword(email, password);

        if (user != null) {
            // If the user is found, redirect to the home page
            return "login_user"; 
        } else {
            // If the credentials don't match, add an error message
            model.addAttribute("errorMessage", "Incorrect email or password");
            return "register"; // Return to the login page with an error message
        }
    }

    
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // This should point to login.jsp
    }

   
    @GetMapping("/featured")
    public String featureddemo() {
        return "featured"; // featured.jsp
    }

    // Featured actions page (for showing artwork details)
    @GetMapping("/featuredactions")
    public String getArtworkDetails(@RequestParam("id") int id, Model model) {
        model.addAttribute("artworkId", id);
        return "featuredactions"; // This should correspond to your Artwork Details JSP page
    }

  
    @GetMapping("/whishlist")
    public String whishdemo()
    {
        return "whishlist";
    }


    @RequestMapping("/whishlist")
    public String addToWishlist(@RequestParam("id") int artworkId, HttpSession session) {
        // Fetch the wishlist from the session
        List<Integer> wishlist = (List<Integer>) session.getAttribute("whishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        // Add the artwork ID to the wishlist
        wishlist.add(artworkId);

        // Save the wishlist back to the session
        session.setAttribute("whishlist", wishlist);

        return "redirect:/whishlist"; // Redirect to the wishlist page to see updated items
    }


    @RequestMapping("/removeFromWishlist")
    public String removeFromWishlist(@RequestParam("id") int artworkId, HttpSession session)
    {
       
        List<Integer> wishlist = (List<Integer>) session.getAttribute("whishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        // Remove the item from the wishlist
        wishlist.remove(Integer.valueOf(artworkId));

        // Save the updated wishlist back to the session
        session.setAttribute("whishlist", wishlist);

        // Redirect to the wishlist page to see the updated items
        return "redirect:/whishlist";
    }

    // Cart page
    @GetMapping("/cart")
    public String cartdemo() {
        return "cart"; // cart.jsp
    }

    // Checkout page
    @GetMapping("/checkout")
    public String checkoutdemo() {
        return "checkout"; // checkout.jsp
    }

    // Redirect user to login page after successful login
    @GetMapping("/login_user")
    public String loginUser() {
        return "login_user"; // login_user.jsp
    }

    // View Cart (with logic)
    @RequestMapping("/cart")
    public String viewCart(Model model) {
        // Logic to add cart items to the model
        return "cart";  // This will resolve to /WEB-INF/jsp/cart.jsp
    }

    // Remove item from Cart
    @RequestMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("id") int artworkId, HttpSession session) {
        // Fetch the cart from the session
        List<Integer> cart = (List<Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        // Remove the item from the cart
        cart.remove(Integer.valueOf(artworkId));
        session.setAttribute("cart", cart); // Update the session with the modified cart
        return "redirect:/cart"; // Redirect to the cart page after removal
    }

    // Checkout page (handles checkout logic)
    @RequestMapping("/checkout")
    public String checkout()
{
        return "checkout";
    }

    
    
    
    
    @GetMapping("/artgallery")
    public String showArtGallery(Model model) {
        return "artgallery"; 
    }
    @GetMapping("/artworkdetails")
    public String showArtDetails(@RequestParam("id") int id, Model model) {
        model.addAttribute("id", id);
        return "artworkdetails"; // Ensure this view exists
    }
    @GetMapping("/cart1")
    public String showCart() {
        return "cart1"; 
    }
    @GetMapping("/favourites")
    public String showfav() {
        return "favourites"; 
    }
    
    
    @GetMapping("/category")
    public String showCategoryPage(Model model) {
        // You can add any data to the model if needed
        model.addAttribute("category", "category");
        return "category"; // This maps to category.jsp
    }

    @GetMapping("/modern")
    public String showModernPage(Model model) {
        model.addAttribute("category", "modern");
        return "modern"; // This maps to modern.jsp
    }

    @GetMapping("/nature")
    public String showNaturePage(Model model) {
        model.addAttribute("category", "nature");
        return "nature"; // This maps to nature.jsp
    }

    @GetMapping("/aesthetic")
    public String showAestheticPage(Model model) {
        model.addAttribute("category", "aesthetic");
        return "aesthetic"; // This maps to aesthetic.jsp
    }

    @GetMapping("/devotional")
    public String showDevotionalPage(Model model) {
        model.addAttribute("category", "devotional");
        return "devotional"; // This maps to devotional.jsp
    }

    @GetMapping("/artistic")
    public String showArtisticPage(Model model)
    {
        model.addAttribute("category", "artistic");
        return "artistic"; // This maps to artistic.jsp
    }
    
    @GetMapping("/forgotPassword")
    public String ForgotPassword()
    {
    	return "forgotPassword";
    }
 
    
    @PostMapping("/sendResetLink")
    public String sendResetLink(@RequestParam("email") String email, Model model) {
        // Logic to send reset link
        model.addAttribute("message", "Reset link sent to " + email);
        return "successPage"; // Return the name of the view
    }
    
    
    @GetMapping("/artists")
    public String showartists() {
    	return "artists";
    }


}
