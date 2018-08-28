package ghh.citelum.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import ghh.citelum.model.Projects;
import ghh.citelum.model.Staff;

public interface ProjectsService {

	public void addProject(Projects p);
	public void updateProject(Projects p);
	public List<Projects> listProjects();
	public List<Projects> listProjectsByCountry(String country);
	public List<Projects> listProjectsByStaffId(int staffId);
	public List<Projects> listProjectsByProjectManagerId(int projectManagerId);
	public Projects getProjectsById(int id);
	public void removeProjects(int id);	
	public int maxId();
	public boolean getArchiveProjectState(int id);
//	public LocalDate getDeadline(int id);
	public Date getDeadline(int id);
//	public String getStaff(int id);
	
}
