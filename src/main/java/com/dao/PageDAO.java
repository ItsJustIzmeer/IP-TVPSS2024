package com.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Page;

public interface PageDAO extends JpaRepository<Page, Integer> {

}
