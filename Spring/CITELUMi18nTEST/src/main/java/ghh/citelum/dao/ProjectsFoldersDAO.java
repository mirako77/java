package ghh.citelum.dao;

import java.util.List;

import ghh.citelum.model.ProjectsFolders;

public interface ProjectsFoldersDAO {

	public void addProjectFolder(ProjectsFolders pf);
	public void updateProjectFolder(ProjectsFolders pf);
	public List<ProjectsFolders> listProjectsFolders();
	public List<ProjectsFolders> getListProjectsFoldersByProjectId(int id);
	public List<ProjectsFolders> getListProjectsFoldersByStaffId(int id);
	public List<String> getListDescriptionProjectsFoldersByProjectId(int id);
	public ProjectsFolders getProjectsFoldersByProjectIdAndNodeName(int id, String name);
	public ProjectsFolders getProjectsFoldersByProjectIdAndDescription(int id, String description);
	public ProjectsFolders getProjectsFoldersById(int id);
	public void removeProjectsFolders(int id);
	public int maxId();
	public List<String> getFileNameAssignedByStaffId(int id, int sid);
}
