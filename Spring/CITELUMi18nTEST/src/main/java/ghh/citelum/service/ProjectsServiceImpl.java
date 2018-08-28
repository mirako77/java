package ghh.citelum.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.ProjectsDAO;
import ghh.citelum.model.Projects;
import ghh.citelum.model.Staff;;

@Service
public class ProjectsServiceImpl implements ProjectsService {
	
	private ProjectsDAO projectsDAO;
	
	public void setProjectsDAO(ProjectsDAO projectsDAO) {
		this.projectsDAO = projectsDAO;
	}
		
	@Override
	@Transactional
	public void addProject(Projects p) {
		this.projectsDAO.addProject(p);
	}

	@Override
	@Transactional
	public void updateProject(Projects p) {
		this.projectsDAO.updateProject(p);
	}

	@Override
	@Transactional
	public List<Projects> listProjects() {
		return this.projectsDAO.listProjects();
	}

	@Override
	@Transactional
	public Projects getProjectsById(int id) {
		return this.projectsDAO.getProjectById(id);
	}
	
	@Override
	@Transactional
	public List<Projects> listProjectsByCountry(String country) {
		return this.projectsDAO.listProjectsByCountry(country);
	}
	
	@Override
	@Transactional
	public List<Projects> listProjectsByStaffId(int staffId) {
		return this.projectsDAO.listProjectsByStaffId(staffId);
	}
	
	@Override
	@Transactional
	public List<Projects> listProjectsByProjectManagerId(int projectManagerId) {
		return this.projectsDAO.listProjectsByProjectManagerId(projectManagerId);
	}
	
	@Override
	@Transactional
	public void removeProjects(int id) {
		this.projectsDAO.removeProject(id);
	}

	@Override
	@Transactional
	public int maxId() {
		return this.projectsDAO.maxId();
	}

	@Override
	@Transactional
	public boolean getArchiveProjectState(int id) {
		return this.projectsDAO.getArchiveProjectState(id);
		
	}
	
	@Override
	@Transactional
	public Date getDeadline(int id) {
		return this.projectsDAO.getDeadline(id);
		
	}

/*	@Override
	@Transactional
	public String getStaff(int id) {
		return this.projectsDAO.getStaff(id);
	}
*/
}
