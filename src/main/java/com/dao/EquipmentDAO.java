package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;

import com.entity.Equipment;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface EquipmentDAO extends JpaRepository<Equipment, Integer> {

	Optional<Equipment> findByName(String name);

	@Transactional
	default void insertAll(List<Equipment> equipmentList) {
		saveAll(equipmentList); // Using JpaRepository's saveAll method
	}

	@Query("SELECT e FROM Equipment e WHERE " + "(:name IS NULL OR e.name LIKE %:name%) "
			+ "AND (:brand IS NULL OR e.brand LIKE %:brand%) "
			+ "AND (:equipmentID IS NULL OR e.equipmentID = :equipmentID)")
	List<Equipment> searchByCriteria(@Param("name") String name, @Param("brand") String brand,
			@Param("equipmentID") Integer equipmentID);

	@Query("SELECT e FROM Equipment e WHERE " + "(:criteria IS NULL OR e.name LIKE %:criteria%) "
			+ "AND (:brand IS NULL OR e.brand LIKE %:brand%) "
			+ "AND (:equipmentID IS NULL OR e.equipmentID = :equipmentID)")
	List<Equipment> searchByCriteria(@Param("criteria") Map<String, String> criteria);
}