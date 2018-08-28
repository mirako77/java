package ghh.citelum.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.ProjectsFoldersDAO;
import ghh.citelum.model.ProjectsFolders;

@Service
public class ProjectsFoldersServiceImpl implements ProjectsFoldersService {
	
	private ProjectsFoldersDAO projectsFoldersDAO;
	
	public void setProjectsFoldersDAO(ProjectsFoldersDAO projectsFoldersDAO) {
		this.projectsFoldersDAO = projectsFoldersDAO;
	}
	
	@Override
	@Transactional
	public void addProjectFolder(ProjectsFolders pf) {
		this.projectsFoldersDAO.addProjectFolder(pf);
	}

	@Override
	@Transactional
	public void updateProjectFolder(ProjectsFolders pf) {
		this.projectsFoldersDAO.updateProjectFolder(pf);
	}

	@Override
	@Transactional
	public List<ProjectsFolders> listProjectsFolders() {
		return this.projectsFoldersDAO.listProjectsFolders();
	}
	
	@Override
	@Transactional
	public List<ProjectsFolders> getListProjectsFoldersByProjectId(int id) {
		return this.projectsFoldersDAO.getListProjectsFoldersByProjectId(id);
	}
	
	@Override
	@Transactional
	public List<ProjectsFolders> getListProjectsFoldersByStaffId(int id) {
		return this.projectsFoldersDAO.getListProjectsFoldersByStaffId(id);
	}
	
	@Override
	@Transactional
	public List<String> getListDescriptionProjectsFoldersByProjectId(int id) {
		return this.projectsFoldersDAO.getListDescriptionProjectsFoldersByProjectId(id);
	}

	@Override
	@Transactional
	public ProjectsFolders getProjectsFoldersByProjectIdAndNodeName(int id, String name) {
		return this.projectsFoldersDAO.getProjectsFoldersByProjectIdAndNodeName(id, name);
	}
	
	@Override
	@Transactional
	public ProjectsFolders getProjectsFoldersByProjectIdAndDescription(int id, String description) {
		return this.projectsFoldersDAO.getProjectsFoldersByProjectIdAndDescription(id, description);
	}
	
	@Override
	@Transactional
	public ProjectsFolders getProjectsFoldersById(int id) {
		return this.projectsFoldersDAO.getProjectsFoldersById(id);
	}

	@Override
	@Transactional
	public void removeProjectsFolders(int id) {
		this.projectsFoldersDAO.removeProjectsFolders(id);
	}

	@Override
	@Transactional
	public int maxId() {
		return this.projectsFoldersDAO.maxId();
	}

	@Override
	@Transactional
	public List<String> getFileNameAssignedByStaffId(int id, int sid) {
		return this.projectsFoldersDAO.getFileNameAssignedByStaffId(id, sid);
	}


}
