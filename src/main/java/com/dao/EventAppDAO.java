package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.EventApp;

import java.util.List;
import java.util.Optional;


public interface EventAppDAO extends JpaRepository<EventApp, Integer> {

}