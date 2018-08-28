package ghh.citelum.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.StaffDAO;
import ghh.citelum.model.Staff;

@Service
public class StaffServiceImpl implements StaffService {
	
	private StaffDAO StaffDAO;

	public void setStaffDAO(StaffDAO staffDAO) {
		this.StaffDAO = staffDAO;
	}

	@Override
	@Transactional
	public void addStaff(Staff s) {
		this.StaffDAO.addStaff(s);
	}

	@Override
	@Transactional
	public void updateStaff(Staff s) {
		this.StaffDAO.updateStaff(s);
	}

	@Override
	@Transactional
	public List<Staff> listStaff() {
		return this.StaffDAO.listStaff();
	}
	
	@Override
	@Transactional
	public List<Staff> listStaffByPermissionId(int permissionId) {
		return this.StaffDAO.listStaffByPermissionId(permissionId);
	}

	@Override
	@Transactional
	public Staff getStaffById(int id) {
		return this.StaffDAO.getStaffById(id);
	}
	
	@Override
	@Transactional
	public Staff getStaffByName(String name) {
		return this.StaffDAO.getStaffByName(name);
	}
	
	@Override
	@Transactional
	public Staff getStaffByLogin(String login) {
		return this.StaffDAO.getStaffByLogin(login);
	}

	@Override
	@Transactional
	public void removeStaff(int id) {
		this.StaffDAO.removeStaff(id);
	}

	@Override
	@Transactional
	public List<Integer> getStaffListByProjectId(int id) {
		
		return this.StaffDAO.getStaffListByProjectId(id);
	}
	
/*	@Override
	@Transactional
	public Staff getProjectManagerByProjectId(int id) {

		return this.StaffDAO.getProjectManagerByProjectId(id);
	}
*/
	
}
