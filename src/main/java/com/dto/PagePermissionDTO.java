package com.dto;


public class PagePermissionDTO {
    private int pageId;
    private String title;
    private Boolean readPermission;
    private Boolean createPermission;
    private Boolean updatePermission;
    private Boolean deletePermission;
    
	public PagePermissionDTO(int pageId, String title, Boolean readPermission, Boolean createPermission,
			Boolean updatePermission, Boolean deletePermission) {
		super();
		this.pageId = pageId;
		this.title = title;
		this.readPermission = readPermission;
		this.createPermission = createPermission;
		this.updatePermission = updatePermission;
		this.deletePermission = deletePermission;
	}

	public int getPageId() {
		return pageId;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getReadPermission() {
		return readPermission;
	}

	public void setReadPermission(Boolean readPermission) {
		this.readPermission = readPermission;
	}

	public Boolean getCreatePermission() {
		return createPermission;
	}

	public void setCreatePermission(Boolean createPermission) {
		this.createPermission = createPermission;
	}

	public Boolean getUpdatePermission() {
		return updatePermission;
	}

	public void setUpdatePermission(Boolean updatePermission) {
		this.updatePermission = updatePermission;
	}

	public Boolean getDeletePermission() {
		return deletePermission;
	}

	public void setDeletePermission(Boolean deletePermission) {
		this.deletePermission = deletePermission;
	}
    
    
}