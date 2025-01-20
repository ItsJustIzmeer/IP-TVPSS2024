package com.dto;

public class UserPagePermissionDTO {
    private String pageTitle;
    private String pageIcon;
    private String pageFilename;
    private boolean readPermission;
    private boolean createPermission;
    private boolean updatePermission;
    private boolean deletePermission;
    
    public UserPagePermissionDTO(String pageTitle, String pageIcon, String pageFilename, boolean readPermission, boolean createPermission, boolean updatePermission, boolean deletePermission) {
        this.pageTitle = pageTitle;
        this.pageIcon = pageIcon;
        this.pageFilename = pageFilename;
        this.readPermission = readPermission;
        this.createPermission = createPermission;
        this.updatePermission = updatePermission;
        this.deletePermission = deletePermission;
    }

	public String getPageTitle() {
		return pageTitle;
	}
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	public String getPageIcon() {
		return pageIcon;
	}
	public void setPageIcon(String pageIcon) {
		this.pageIcon = pageIcon;
	}
	public String getPageFilename() {
		return pageFilename;
	}
	public void setPageFilename(String pageFilename) {
		this.pageFilename = pageFilename;
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
