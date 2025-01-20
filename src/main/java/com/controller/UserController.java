package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.UserDAO;
import com.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/user")
public class UserController {

    private final UserDAO userDAO;

    @Autowired
    public UserController(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    // Get all users
    @GetMapping("/list")
    public List<User> findAll() {
        return userDAO.findAll();
    }

    // Get a single user by ID
    @GetMapping("/{id}")
    public User findById(@PathVariable int id) {
        Optional<User> user = userDAO.findById(id);
        if (user.isEmpty()) {
            throw new RuntimeException("User ID not found - " + id);
        }
        return user.get();
    }

    // Create a new user
    @PostMapping("/")
    public String insert(@RequestBody User user) {
        user.setId(0); // Ensure the ID is set to 0 so a new user is created
        userDAO.save(user); // Use save() instead of insert() method
        return "User created successfully!";
    }

    // Update an existing user
    @PutMapping("/")
    public String update(@RequestBody User user) {
        Optional<User> existingUser = userDAO.findById(user.getId());
        if (existingUser.isEmpty()) {
            throw new RuntimeException("User ID not found - " + user.getId());
        }
        userDAO.save(user); // Use save() for updating the user
        return "User updated successfully!";
    }

    // Delete a user by ID
    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable int id) {
        Optional<User> user = userDAO.findById(id);
        if (user.isEmpty()) {
            throw new RuntimeException("User ID not found - " + id);
        }
        userDAO.deleteById(id); // Use deleteById() method from JpaRepository
        return "User deleted successfully!";
    }

    // Sign-in functionality
    @PostMapping("/sign-in")
    public ModelAndView signIn(@RequestParam String name, @RequestParam String password, HttpSession session,
             RedirectAttributes redirectAttributes) {
        String success_msg = "";
        String error_msg = "";
        
        Optional<User> userOpt = userDAO.findByName(name);

        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
            User user = userOpt.get();
            session.setAttribute("loggedInUser", user);
            redirectAttributes.addFlashAttribute("success_msg", "Sign-in successful! Welcome " + user.getName() + ".");
            return new ModelAndView("redirect:/dashboard");
        } else {
            redirectAttributes.addFlashAttribute("error_msg", "Invalid username or password. Please try again.");
            return new ModelAndView("redirect:/");
        }
    }

    // Get logged-in user details
    @GetMapping("/current-user")
    public User getCurrentUser(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            throw new RuntimeException("No user is logged in.");
        }
        return loggedInUser;
    }

    // Sign-out functionality
    @GetMapping("/sign-out")
    public ModelAndView signOut(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/");
    }
}
