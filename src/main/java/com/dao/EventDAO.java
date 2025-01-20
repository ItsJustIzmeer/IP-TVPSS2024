package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import com.entity.Event;

public interface EventDAO extends JpaRepository<Event, Integer> {

}
