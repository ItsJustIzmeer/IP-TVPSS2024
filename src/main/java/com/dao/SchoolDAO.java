package com.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;


import com.entity.School;

public interface SchoolDAO extends JpaRepository<School, Integer>{
	 Optional<School> findByName(String name);

}