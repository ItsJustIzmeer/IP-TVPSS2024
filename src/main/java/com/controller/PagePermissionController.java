package com.controller;

import com.entity.PagePermission;
import com.dao.PagePermissionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class PagePermissionController {

    @Autowired
    private PagePermissionDAO pagePermissionDAO;

    // Function to get user permissions for the logged-in user
    @GetMapping("/permissions")
    public List<PagePermission> getUserPermissions(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("loginnedUserId");
        if (userId == null) {
            throw new RuntimeException("User not logged in");
        }
        return pagePermissionDAO.findAllWithDetails();
    }

    // Function to create or update a list of permissions
    @PostMapping("/permissions")
    public List<PagePermission> createPermissions(@RequestBody List<PagePermission> permissions) {
        return pagePermissionDAO.saveAll(permissions);
    }

    // Function to delete all permissions for a specific user
    @PostMapping("/permissions/delete")
    public void deletePermissionsForUser(@RequestBody int userId) {
    	pagePermissionDAO.deleteByUserId(userId);
    }
}
