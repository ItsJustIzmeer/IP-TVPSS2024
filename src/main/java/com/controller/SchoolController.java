package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.SchoolDAO;
import com.entity.School;

@RestController
@RequestMapping("/schoolMng")
public class SchoolController {

    private final SchoolDAO schoolDAO;

    @Autowired
    public SchoolController(SchoolDAO schoolDAO) {
        this.schoolDAO = schoolDAO;
    }

    // Get all schools
    @GetMapping("/schools")
    public List<School> findAll() {
        return schoolDAO.findAll(); // Automatically provided by JpaRepository
    }

    // Get a single school by ID
    @GetMapping("/schools/{id}")
    public School findById(@PathVariable int id) {
        return schoolDAO.findById(id).orElseThrow(() -> new RuntimeException("School ID not found - " + id));
        // findById returns an Optional, so we handle the empty case here
    }

    // Create a new school
    @PostMapping("/schools")
    public void insert(@RequestBody School school) {
        schoolDAO.save(school); // Use save() to insert the school
    }

    // Update an existing school
    @PutMapping("/schools")
    public void update(@RequestBody School school) {
        // Ensure that the school exists before updating
        if (schoolDAO.existsById(school.getId())) {
            schoolDAO.save(school); // Use save() to update the school
        } else {
            throw new RuntimeException("School ID not found - " + school.getId());
        }
    }

    // Delete a school by ID
    @DeleteMapping("/schools/{id}")
    public void deleteById(@PathVariable int id) {
        if (schoolDAO.existsById(id)) {
            schoolDAO.deleteById(id); // Use deleteById() to delete the school
        } else {
            throw new RuntimeException("School ID not found - " + id);
        }
    }
}
