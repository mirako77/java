package ghh.citelum.service;

import java.util.List;

import ghh.citelum.model.Staff;

public interface StaffService {

	public void addStaff(Staff s);
	public void updateStaff(Staff s);
	public List<Staff> listStaff();
	public Staff getStaffById(int id);
	public Staff getStaffByName(String name);
	public Staff getStaffByLogin(String login);
	public void removeStaff(int id);
	public List<Integer> getStaffListByProjectId(int id);
//	public Staff getProjectManagerByProjectId(int id);
	List<Staff> listStaffByPermissionId(int permissionId);
	
}
