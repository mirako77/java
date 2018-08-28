package ghh.citelum.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.PermissionsDAO;
import ghh.citelum.model.Permissions;

@Service
public class PermissionsServiceImpl implements PermissionsService {

	private PermissionsDAO permissionsDAO;
	
	public void setPermissionsDAO(PermissionsDAO permissionsDAO) {
		this.permissionsDAO = permissionsDAO;
	}

	@Override
	@Transactional
	public void updatePermission(Permissions p) {
		this.permissionsDAO.updatePermission(p);		
	}
	
	@Override
	@Transactional
	public List<Permissions> listPermissions() {
		System.out.println("service");
		return this.permissionsDAO.listPermissions();
	}

	@Override
	@Transactional
	public Permissions getPermissionById(int id) {
		System.out.println("---------------------*-*-*-*");
		return this.permissionsDAO.getPermissionById(id);
	}

	@Override
	@Transactional
	public Permissions getPermissionByRole(String role) {
		return this.permissionsDAO.getPermissionByRole(role);
	}

}
