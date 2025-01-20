package com.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.dto.PagePermissionDTO;
import com.dto.UserPagePermissionDTO;
import com.entity.PagePermission;

public interface PagePermissionDAO extends JpaRepository<PagePermission, Integer> {

	// Delete all data related to a specific user_id
	void deleteByUserId(int userId);

	// Fetch permissions with page and user details
	@Query("SELECT pp FROM PagePermission pp " + "JOIN FETCH Page p ON pp.pageId = p.id "
			+ "JOIN FETCH User u ON pp.userId = u.id")
	List<PagePermission> findAllWithDetails();

	List<PagePermission> findByUserId(Integer userId);

	@Query("SELECT new com.dto.UserPagePermissionDTO(p.title, p.icon, p.filename, pp.readPermission, pp.createPermission, pp.updatePermission, pp.deletePermission) "
			+ "FROM PagePermission pp " + "JOIN Page p ON pp.pageId = p.id " + "WHERE pp.userId = :userId")
	List<UserPagePermissionDTO> findPermissionsWithPageDetailsByUserId(Integer userId);

	@Query("SELECT pp.readPermission, pp.createPermission, pp.updatePermission, pp.deletePermission "
			+ "FROM PagePermission pp " + "JOIN Page p ON pp.pageId = p.id "
			+ "WHERE pp.userId = :userId AND p.filename = :filename")
	List<Object[]> findPermissionsByUserIdAndPageFilename(Integer userId, String filename);

	void deleteAllByUserId(int id);

	@Query("SELECT new com.dto.PagePermissionDTO(p.id, p.title, "
			+ "pp.readPermission, pp.createPermission, pp.updatePermission, pp.deletePermission) " + "FROM Page p "
			+ "LEFT JOIN FETCH PagePermission pp ON pp.pageId = p.id AND pp.userId = :userId")
	List<PagePermissionDTO> findAllPagesWithPermissionsByUserId(Integer userId);
}
