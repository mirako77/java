package ghh.citelum.service;

import java.util.List;

import ghh.citelum.model.Permissions;

public interface PermissionsService {

	public void updatePermission(Permissions p);
	public List<Permissions> listPermissions();
	public Permissions getPermissionById(int id);
	public Permissions getPermissionByRole(String role);
	
}
