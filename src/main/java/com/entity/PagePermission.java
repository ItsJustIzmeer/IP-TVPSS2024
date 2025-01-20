package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "page_permission")
public class PagePermission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "page_id", nullable = false)
    private int pageId;

    @Column(name = "user_id", nullable = false)
    private int userId;

    @Column(name = "read_permission", nullable = false)
    private boolean readPermission;

    @Column(name = "create_permission", nullable = false)
    private boolean createPermission;

    @Column(name = "update_permission", nullable = false)
    private boolean updatePermission;

    @Column(name = "delete_permission", nullable = false)
    private boolean deletePermission;
    
    public PagePermission() {}

	public PagePermission(int id,int pageId, int userId, boolean readPermission, boolean createPermission,
			boolean updatePermission, boolean deletePermission) {
		super();
		this.id = id;
		this.pageId = pageId;
		this.userId = userId;
		this.readPermission = readPermission;
		this.createPermission = createPermission;
		this.updatePermission = updatePermission;
		this.deletePermission = deletePermission;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean isReadPermission() {
		return readPermission;
	}

	public void setReadPermission(boolean readPermission) {
		this.readPermission = readPermission;
	}

	public boolean isCreatePermission() {
		return createPermission;
	}

	public void setCreatePermission(boolean createPermission) {
		this.createPermission = createPermission;
	}

	public boolean isUpdatePermission() {
		return updatePermission;
	}

	public void setUpdatePermission(boolean updatePermission) {
		this.updatePermission = updatePermission;
	}

	public boolean isDeletePermission() {
		return deletePermission;
	}

	public void setDeletePermission(boolean deletePermission) {
		this.deletePermission = deletePermission;
	}
    
}
