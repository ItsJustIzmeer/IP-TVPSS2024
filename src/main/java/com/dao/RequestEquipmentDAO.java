package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;

import com.entity.RequestEquipment;
import com.entity.User;

public interface RequestEquipmentDAO extends JpaRepository<RequestEquipment, Integer> {
	// Fetch all requests for a specific school
	@Query("SELECT r FROM RequestEquipment r WHERE r.schoolId = :schoolId")
	List<RequestEquipment> findBySchoolId(@Param("schoolId") int schoolId);

	// Fetch all requests made by a specific user
	@Query("SELECT r FROM RequestEquipment r WHERE r.userId = :userId")
	List<RequestEquipment> findByUserId(@Param("userId") int userId);

	// Search requests by item name (case insensitive)
	@Query("SELECT r FROM RequestEquipment r WHERE LOWER(r.itemName) LIKE LOWER(CONCAT('%', :itemName, '%'))")
	List<RequestEquipment> findByItemNameContaining(@Param("itemName") String itemName);

	// Get requests with total estimated cost exceeding a certain amount
	@Query("SELECT r FROM RequestEquipment r WHERE r.totalEstimatedCost > :cost")
	List<RequestEquipment> findByTotalEstimatedCostGreaterThan(@Param("cost") int cost);

	// Fetch all requests within a price range for items
	@Query("SELECT r FROM RequestEquipment r WHERE r.itemPricePerUnit BETWEEN :minPrice AND :maxPrice")
	List<RequestEquipment> findByItemPriceRange(@Param("minPrice") double minPrice, @Param("maxPrice") double maxPrice);

	// Find requests by reason for request (exact match)
	@Query("SELECT r FROM RequestEquipment r WHERE r.reasonForRequest = :reason")
	List<RequestEquipment> findByReasonForRequest(@Param("reason") String reason);

	// Find all requests with a specific item model
	@Query("SELECT r FROM RequestEquipment r WHERE r.itemModel = :itemModel")
	List<RequestEquipment> findByItemModel(@Param("itemModel") String itemModel);

	// Count requests for a specific school
	@Query("SELECT COUNT(r) FROM RequestEquipment r WHERE r.schoolId = :schoolId")
	long countBySchoolId(@Param("schoolId") int schoolId);
}
