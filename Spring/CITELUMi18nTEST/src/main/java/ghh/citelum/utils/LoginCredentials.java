package ghh.citelum.utils;

import java.util.List;

import ghh.citelum.model.Permissions;
import ghh.citelum.model.Staff;

public class LoginCredentials {
	
	private String name;
	private String login;
	private String password;
	private int staffId;
	private String sessionId;
	private Permissions permission;
	private Staff staff;
	private int permissionLevel;
	private String country;
	private int projectFoldersId;
	private String projFolderPath;
	private String currentProjectId;
	private List<String> fileNameListToMerge;

	public List<String> getFileNameListToMerge() {
		return fileNameListToMerge;
	}
	public void setFileNameListToMerge(List<String> fileNameListToMerge) {
		this.fileNameListToMerge = fileNameListToMerge;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getCurrentProjectId() {
		return currentProjectId;
	}
	public void setCurrentProjectId(String currentProjectId) {
		this.currentProjectId = currentProjectId;
	}
	public String getProjFolderPath() {
		return projFolderPath;
	}
	public void setProjFolderPath(String projFolderPath) {
		this.projFolderPath = projFolderPath;
	}
	public int getProjectFoldersId() {
		return projectFoldersId;
	}
	public void setProjectFoldersId(int projectFoldersId) {
		this.projectFoldersId = projectFoldersId;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getPermissionLevel() {
		return permissionLevel;
	}
	public void setPermissionLevel(int permissionLevel) {
		this.permissionLevel = permissionLevel;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public Permissions getPermission() {
		return permission;
	}
	public void setPermission(Permissions permission) {
		this.permission = permission;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	
	
	@Override
	public String toString() {
		return "LoginCredentials [name=" + name + ", password=" + password + ", staffId=" + staffId + ", sessionId="
				+ sessionId + ", permission=" + permission + ", staff=" + staff + ", permissionLevel=" + permissionLevel
				+ "]";
	}

	
	
	
	

	
	

}
