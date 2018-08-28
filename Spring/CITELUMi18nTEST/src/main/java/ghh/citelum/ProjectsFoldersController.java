package ghh.citelum;

import java.io.File;
import java.io.IOException;
import java.nio.file.NoSuchFileException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.osgi.framework.SynchronousBundleListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ghh.citelum.model.Folders;
import ghh.citelum.model.Projects;
import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.service.FoldersService;
import ghh.citelum.model.Staff;
import ghh.citelum.service.ProjectsFoldersService;
import ghh.citelum.service.ProjectsService;
import ghh.citelum.service.StaffService;
import ghh.citelum.utils.ChaptersJson;
import ghh.citelum.utils.ChaptersJsonArray;
import ghh.citelum.utils.FoldersJson;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.Request;
import ghh.citelum.utils.Result;
import ghh.citelum.utils.WorkPath;

@Controller
public class ProjectsFoldersController {

	private ProjectsFoldersService projectsFoldersService;
	private ProjectsService projectsService;
	private StaffService staffService;
	private FoldersService foldersService;
	
	WorkPath workPath = new WorkPath();
	String path = WorkPath.getWorkPath();
	
	//======================== Front End Paths ========================
	FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();
	
	private String projectFiles = frontEndFilePaths.getProjectFiles();
	
	//======================== Setters Start ========================
	
	@Autowired(required=true)
	@Qualifier(value="projectsFoldersService")
	public void setProjectsFoldersService(ProjectsFoldersService pfs) {
		this.projectsFoldersService = pfs;
	}

	@Autowired(required=true)
	@Qualifier(value="projectsService")
	public void setProjectsService(ProjectsService ps) {
		this.projectsService = ps;
	}

	
	@Autowired(required=true)
	@Qualifier(value="foldersService")
	public void setFoldersService(FoldersService fs) {
		this.foldersService = fs;
	}
	

	@Autowired(required=true)
	@Qualifier(value="staffService")
	public void setStaffService(StaffService ss) {
		this.staffService = ss;
	}
	//======================== Setters End ========================

	@RequestMapping(value = "/addProjectsFoldersListProjectId={id}", method=RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String addProjectsFoldersList(@PathVariable("id") int id, @RequestBody final ChaptersJsonArray chaptersJsonArray, Model model) {

		int ordenationCount = 0;
		
		int projectId = id;
		model.addAttribute("listProjectsFolders", this.projectsFoldersService.getListProjectsFoldersByProjectId(projectId));

		List<ProjectsFolders> lpfBeforeJson = this.projectsFoldersService.getListProjectsFoldersByProjectId(projectId);

			for (ProjectsFolders p : lpfBeforeJson) {	
				p.setInUse(false);
				this.projectsFoldersService.updateProjectFolder(p);
				System.out.println(p.getDescription() + "            DESCRIPTION");
				//this.projectsFoldersService.removeProjectsFolders(p.getId());
			}

			System.out.println("--------------------after FOR----------");
		Projects project = this.projectsService.getProjectsById(projectId);

		project.setTemplateUpdated("false");

		this.projectsService.updateProject(project);

		for ( ChaptersJson projectItems : chaptersJsonArray.getChaptersArray() ) {
			
			System.out.println(projectItems.getText() + " 1");
			System.out.println(projectItems.getParent() + " 2");
			System.out.println(projectItems.getLi_attr().getPath() + " 2");
			System.out.println(" ------------------------------------------");

			
			ordenationCount++;
			
			
			ProjectsFolders pf = new ProjectsFolders();
			
			
			pf.setOrdenation(ordenationCount);
			
/*
			if ( projectItems.getLi_attr().getIdentity() != 0 ) {
			} 
	*/		
			pf.setProject(this.projectsService.getProjectsById(projectId));
			
			// get node id name and set it in backend object
			pf.setNodeId(projectItems.getId());

			// get node parent and set it in backend object
			pf.setParent(projectItems.getParent());

			// get node description and set it in backend object
			pf.setDescription(projectItems.getText());
			pf.setPath(projectItems.getText());
			// get node type and set it in backend object - File or Folder
			if ( projectItems.getType().equals("default") ) {
				pf.setIs_file(0);

			} else if ( projectItems.getType().equals("file") ) {
				
				
				File f = new File(path + "folders\\" + projectId + "\\" + projectItems.getLi_attr().getPath() +".docx");
				f.getParentFile().mkdirs();
					
					
					
					
				if(f.exists()==false && !f.isDirectory()) {
							System.out.println(projectItems.getLi_attr().getDir() + " yeyeye");
					if ( projectItems.getLi_attr().getDir().equals("root") ) {
						
					
						try {
							
							File source = new File(path + "template\\" + projectItems.getLi_attr().getPath() +".docx");
							File dest = new File(path + "folders\\" + projectId + "\\" + projectItems.getLi_attr().getPath() +".docx");
							
							dest.getParentFile().mkdirs();
							
							FileUtils.copyFile(source, dest);
						} catch (IOException e) {
							e.printStackTrace();
						}  
					
					} else {
						
						try {
							
							File source = new File(path + "template\\" + projectItems.getLi_attr().getDir() + "\\" + projectItems.getLi_attr().getPath() +".docx");
							File dest = new File(path + "folders\\" + projectId + "\\" + projectItems.getLi_attr().getPath() +".docx");
							
							dest.getParentFile().mkdirs();
							
							FileUtils.copyFile(source, dest);
						} catch (IOException e) {
							e.printStackTrace();
						}  
						
					}
					
					
					
					
				}

				pf.setIs_file(1);
			}

			if (projectItems.getText() != projectItems.getLi_attr().getPath()) {
				File file = new File(path + "folders\\" + projectId + "\\" + projectItems.getLi_attr().getPath() +".docx");
				File file2 = new File(path + "folders\\" + projectId + "\\" + projectItems.getText() +".docx");
				
				file.renameTo(file2);
			}

				//pf.setPath(projectItems.getText());

			
			pf.setInUse(true);
			
			System.out.println(" before existing for");
			if ( projectItems.getLi_attr().getIdentity() != -10 && projectItems.getLi_attr().getIdentity() != 0 ) {
				System.out.println(" inside existing for");
				pf.setId(projectItems.getLi_attr().getIdentity());
				ProjectsFolders pfdatabase = this.projectsFoldersService.getProjectsFoldersById(projectItems.getLi_attr().getIdentity());
				//ProjectsFolders pfdatabase = this.projectsFoldersService.getProjectsFoldersById(2494);
				//System.out.println(this.projectsFoldersService.getProjectsFoldersById(2494) + " GET FROM DATABASE =================== ");
				
				//System.out.println(pfdatabase.getStaff() + "   STAFFFFFFFFFFFFFFFFFFFFFF");
				
				pf.setStaff(pfdatabase.getStaff());
				pf.setFinished(pfdatabase.isFinished());
				
				this.projectsFoldersService.updateProjectFolder(pf);
			} else if ( projectItems.getLi_attr().getIdentity() == -10 ) {
				
				System.out.println(" inside second if in existing database element");
				ProjectsFolders pfdatabase = this.projectsFoldersService.getProjectsFoldersByProjectIdAndDescription(projectId, projectItems.getLi_attr().getPath());
				
				pf.setId(pfdatabase.getId());
				pf.setStaff(pfdatabase.getStaff());
				pf.setFinished(pfdatabase.isFinished());
				
				
				this.projectsFoldersService.updateProjectFolder(pf);
				System.out.println("updated ");
			} else {
				System.out.println("inside add project folder");
				
				try {
					ProjectsFolders pfdatabase;
					
					pf.setInUse(true);
					if ( projectItems.getType().equals("default") ) {
						pfdatabase = this.projectsFoldersService.getProjectsFoldersByProjectIdAndDescription(projectId, projectItems.getLi_attr().getPath());
					} else {
						pfdatabase = this.projectsFoldersService.getProjectsFoldersByProjectIdAndDescription(projectId, projectItems.getLi_attr().getPath());
					}
					System.out.println("try verified");
					pf.setId(pfdatabase.getId());
					pf.setStaff(pfdatabase.getStaff());
					pf.setFinished(pfdatabase.isFinished());
					this.projectsFoldersService.updateProjectFolder(pf);
					
				} catch ( /*NullPointerException*/ Exception e) {
					System.out.println( "catch nullPOinter");
					this.projectsFoldersService.addProjectFolder(pf);
				}
				
				
				
				
			}
		
			//this.projectsFoldersService.addProjectFolder(pf);
		
		}  // for each end
		
		System.out.println("*************************************************");
		List<ProjectsFolders> lpfAfterJson = this.projectsFoldersService.getListProjectsFoldersByProjectId(projectId);

		for (ProjectsFolders paf : lpfAfterJson) {	
			
			
			System.out.println( paf.getDescription() + " " + paf.isFinished() + " " + paf.isInUse() + "     DELETE FOR");
			
			if ( !paf.isInUse() ) {
				System.out.println(" INSIDE IF DELETE FOR " + paf.getId());
				
				this.projectsFoldersService.removeProjectsFolders(paf.getId());
				File file = new File(path + "folders\\" + projectId + "\\" + paf.getPath() +".docx");
				file.delete();
				
			}
			
			//this.projectsFoldersService.updateProjectFolder(p);
		}
		
		
		return "redirect:project{id}";
	}
	
	
	
	@RequestMapping(value = "/project{id}_taskCompleted", method = RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String taskCompleted(@PathVariable("id") int id, @RequestBody ChaptersJson taskObj, Model model) {

		//set the task finished or unfinished and update it to database
		System.out.println(taskObj.getLi_attr().isFinished() + " ...........................................................");
		boolean finishStatus = !taskObj.getLi_attr().isFinished();
		System.out.println(finishStatus + " ...........................................................");
		ProjectsFolders databaseProjectFolder = this.projectsFoldersService.getProjectsFoldersByProjectIdAndNodeName(id, taskObj.getId());
		System.out.println(databaseProjectFolder.toString() + " ...........................................................");
		databaseProjectFolder.setFinished(finishStatus);

		this.projectsFoldersService.updateProjectFolder(databaseProjectFolder);

		return "redirect:project" + id;
	}

	@RequestMapping(value = "/project{id}_calculateStatus", method = RequestMethod.POST)
	public @ResponseBody String calculateStatus(@PathVariable("id") int id, Model model) {

		ArrayList<ProjectsFolders> projectsFoldersList = (ArrayList<ProjectsFolders>) this.projectsFoldersService.getListProjectsFoldersByProjectId(id);
		
		Projects currentProject = this.projectsService.getProjectsById(id);
		
		int countTasksCompleted = 0;
		int countTotalTasks = 0;
		int projectStatus = 0;
		
		for ( ProjectsFolders pf : projectsFoldersList) {
			if ( pf.getIs_file() == 1 ) {
				countTotalTasks = countTotalTasks + 1;
				
				if ( pf.isFinished() ) {
					countTasksCompleted = countTasksCompleted + 1;
				}
			}			
		}

		
		if ( countTasksCompleted != 0) {
			projectStatus = (int)(countTasksCompleted / (double)countTotalTasks * 100) ;
		} else {
			projectStatus = 0;
		}
		
		System.out.println(projectStatus + " projectStatus ");
		
		currentProject.setProject_status(projectStatus);
		
		this.projectsService.updateProject(currentProject);

		return "---------no need for this return-----------";
	}
	
	
	
	@RequestMapping(value = "/project{id}_upload", method = RequestMethod.GET)
	public @ResponseBody String editProject(@PathVariable("id") int id, ProjectsFolders pf) {

		if(pf.getId() == 0) {
			this.projectsFoldersService.addProjectFolder(pf);
		} else {
			this.projectsFoldersService.updateProjectFolder(pf);
		}

		return projectFiles + "project" + id + "_upload";
	}

	@RequestMapping(value = "/assignTasksProjectId={id}/user={user}", method=RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String assignTasks(@PathVariable("id") int id, @PathVariable("user") int user, @RequestBody final ChaptersJsonArray assignedChaptersJsonArray, Model model) {

		model.addAttribute("listProjectsFolders", this.projectsFoldersService.getListProjectsFoldersByProjectId(id));

		int projectId = id;
		int staffId = user;

		Staff currentStaff = this.staffService.getStaffById(user);

		for ( ChaptersJson chaptersList : assignedChaptersJsonArray.getChaptersArray() ) {
			
			ProjectsFolders loadPF = this.projectsFoldersService.getProjectsFoldersByProjectIdAndNodeName(projectId, chaptersList.getId());
			
			if ( nodeExistsInDataBase(chaptersList, loadPF) && isChapterDisabled(chaptersList) ) {
				if ( isChapterSelected(chaptersList) ) {
					loadPF.setStaff(currentStaff);													//SET staff the same as CURRENTSTAFF VARIABLE
					this.projectsFoldersService.updateProjectFolder(loadPF);						//Updates database Chapter Line
				} else {
					loadPF.setStaff(null);															//SET staff the same as CURRENTSTAFF VARIABLE
					this.projectsFoldersService.updateProjectFolder(loadPF);						//Updates database Chapter Line
				}
			}
		}
		return "----------No need for this return----------";
	}

	@RequestMapping(value = "/changeProjectTemplateStatus={id}", method=RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String changeProjectTemplateStatus(@PathVariable("id") int id, @RequestBody final ChaptersJsonArray chaptersJsonArray, Model model) {
		
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL START
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL START
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL START
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL START
		
/*
		model.addAttribute("listProjectsFolders", this.projectsFoldersService.getListProjectsFoldersByProjectId(id));
		List<ProjectsFolders> lpf = this.projectsFoldersService.getListProjectsFoldersByProjectId(id);
/*
			for (ProjectsFolders p : lpf) {	
				this.projectsFoldersService.removeProjectsFolders(p.getId());
			}
*/	
		/*
		int projectId = id;
		Projects project = this.projectsService.getProjectsById(projectId);

		project.setTemplateUpdated("true");

		this.projectsService.updateProject(project);

		for ( ChaptersJson projectItems : chaptersJsonArray.getChaptersArray() ) {

			//ProjectsFolders pf = new ProjectsFolders();	
			ProjectsFolders pf = this.projectsFoldersService.getProjectsFoldersById(projectItems.getLi_attr().getIdentity());

			pf.setProject(this.projectsService.getProjectsById(projectId));
			
			pf.setNodeId(projectItems.getId());
			pf.setParent(projectItems.getParent());
			pf.setDescription(projectItems.getText());
			if ( projectItems.getType().equals("default") ) {
				pf.setIs_file(0);
			} else if ( projectItems.getType().equals("file") ) {
				pf.setIs_file(1);
			}

			if (projectItems.getLi_attr().getPath() != null) {
				pf.setPath(projectItems.getLi_attr().getPath());
			} else {
				pf.setPath("---");
			}
			this.projectsFoldersService.updateProjectFolder(pf);
			//this.projectsFoldersService.addProjectFolder(pf);;

		}
*/
		
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL END
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL END
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL END
		// OLD PROJECT TEMPLATE VERSION - BEFORE ADD CHAPTER NUMBERS TO PROJECT DETAIL END
		int projId = id;
		Projects project = this.projectsService.getProjectsById(projId);
		project.setTemplateUpdated("true");
		
		for ( ChaptersJson projectItems : chaptersJsonArray.getChaptersArray() ) {
			
			int currentProjectFolderID = projectItems.getLi_attr().getIdentity();
			System.out.println(currentProjectFolderID + " currentProjectFolderID");
			
			ProjectsFolders databaseProjectFolders = this.projectsFoldersService.getProjectsFoldersById(currentProjectFolderID);
			
			databaseProjectFolders.setListnumber(projectItems.getLi_attr().getListnumber());
			databaseProjectFolders.setTreeLevel(projectItems.getLi_attr().getTreelevel());
			
			this.projectsFoldersService.updateProjectFolder(databaseProjectFolders);
			
		}
		
		return "----------No need for this return----------";
	}

	private boolean nodeExistsInDataBase(ChaptersJson chaptersList, ProjectsFolders loadPF) {
		return loadPF.getNodeId().equals(chaptersList.getId());
	}	

	private boolean isChapterDisabled(ChaptersJson chaptersList) {
		return chaptersList.getState().getDisabled().equals("false");
	}

	private boolean isChapterSelected(ChaptersJson chaptersList) {
		return chaptersList.getState().getSelected().equals("true");
	}
}
