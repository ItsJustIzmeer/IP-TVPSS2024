package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;

import com.dto.UserWithSchoolDTO;
import com.entity.User;
import java.util.Optional;
import java.util.List;
import java.util.Map;

public interface UserDAO extends JpaRepository<User, Integer> {

	Optional<User> findByName(String name);

	@Transactional
	default void insertAll(List<User> users) {
		saveAll(users); // Using JpaRepository's saveAll method
	}

	@Modifying
	@Query("UPDATE User u SET u.status = :status WHERE u.id = :id")
	@Transactional
	void updateUserStatus(@Param("id") Integer id, @Param("status") String status);

	@Query("SELECT new com.dto.UserWithSchoolDTO(u.id, u.name, u.role, u.status, u.email, u.phoneNumber, u.address,u.district,u.state, s.id, s.name) "
			+ "FROM User u JOIN School s ON u.schoolId = s.id")
	List<UserWithSchoolDTO> findUsersWithSchoolDetails(); 

	@Query("SELECT new com.dto.UserWithSchoolDTO(u.id, u.name, u.role, u.status, u.email, u.phoneNumber, u.address,u.district,u.state, s.id, s.name) "
			+ "FROM User u JOIN School s ON u.schoolId = s.id WHERE u.schoolId = :schoolId")
	List<UserWithSchoolDTO> findUsersWithSchoolDetailsBySchoolId(@Param("schoolId") int schoolId);

	@Query("SELECT u FROM User u " + "WHERE (:name IS NULL OR u.name LIKE %:name%) "
			+ "AND (:email IS NULL OR u.email LIKE %:email%) " + "AND (:status IS NULL OR u.status = :status) "
			+ "AND (:role IS NULL OR u.role = :role) "
			+ "AND (:phoneNumber IS NULL OR u.phoneNumber LIKE %:phoneNumber%) "
			+ "AND (:address IS NULL OR u.address LIKE %:address%) "
			+ "AND (:district IS NULL OR u.district LIKE %:district%) "
			+ "AND (:state IS NULL OR u.state LIKE %:state%) "
			+ "AND (:schoolId IS NULL OR u.schoolId = CAST(:schoolId AS int))")
	List<User> searchByCriteria(@Param("name") String name, @Param("email") String email,
			@Param("status") String status, @Param("role") String role, @Param("phoneNumber") String phoneNumber,
			@Param("address") String address, @Param("district") String district, @Param("state") String state,
			@Param("schoolId") String schoolId);
	
	@Query("SELECT u FROM User u WHERE " +
		       "(:criteria IS NULL OR u.name LIKE %:criteria%) " +
		       "AND (:email IS NULL OR u.email LIKE %:email%) " +
		       "AND (:status IS NULL OR u.status LIKE %:status%) " +
		       "AND (:role IS NULL OR u.role LIKE %:role%) " +
		       "AND (:phoneNumber IS NULL OR u.phoneNumber LIKE %:phoneNumber%) " +
		       "AND (:address IS NULL OR u.address LIKE %:address%) " +
		       "AND (:district IS NULL OR u.district LIKE %:district%) " +
		       "AND (:state IS NULL OR u.state LIKE %:state%) " +
		       "AND (:schoolId IS NULL OR u.schoolId = :schoolId)")
		List<User> searchByCriteria(@Param("criteria") Map<String, String> criteria);
}

