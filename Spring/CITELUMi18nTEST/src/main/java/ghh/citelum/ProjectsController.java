package ghh.citelum;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ghh.citelum.ControllerUtils.ProjectsControllerMethods;
import ghh.citelum.model.Folders;
import ghh.citelum.model.Projects;
import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.model.Staff;
import ghh.citelum.model.Template;
import ghh.citelum.service.FoldersService;
import ghh.citelum.service.ProjectsFoldersService;
import ghh.citelum.service.ProjectsService;
import ghh.citelum.service.StaffService;
import ghh.citelum.service.TemplateService;
import ghh.citelum.utils.ChaptersJsonArray;
import ghh.citelum.utils.FoldersJson;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.FrontEndGetStaffListToProject;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.PermissionTypes;
import ghh.citelum.utils.WorkPath;

@Controller
public class ProjectsController extends ProjectsControllerMethods {

	private ProjectsService projectsService;
	private FoldersService foldersService;
	private ProjectsFoldersService projectsFoldersService;
	private StaffService staffService;
	private TemplateService templateService;
	private Logger logger = Logger.getLogger(ProjectsController.class);
	
	//======================== Front End Paths ========================
	FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();
	
	private String projectFiles = frontEndFilePaths.getProjectFiles();

	WorkPath workPath = new WorkPath();	
	private String path = WorkPath.getWorkPath();
	
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
	
	@Autowired(required=true)
	@Qualifier(value="templateService")
	public void setTemplateService(TemplateService ts) {
		this.templateService = ts;
	}	

	//======================== Setters End ========================


	@RequestMapping(value = "/project_list", method = RequestMethod.GET)
	public String projectList(Model model, HttpServletRequest request) {
		
		try {
			
		//Get loged user
		LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
		
		int globalAdminLevel = 		PermissionTypes.getGlobalAdminLevel();
		int localAdminLevel = 		PermissionTypes.getLocalAdminLevel();
		int projectManagerLevel = 	PermissionTypes.getProjectManagerLevel();
		int contributeurLevel = 	PermissionTypes.getContributeurLevel();
		
		System.out.println("****************************************");
		System.out.println(currentUser.toString() + " TOSTRING ");
		System.out.println(currentUser.getStaffId() +  " STAF ID ---------------------------------------------------");
				
		int currentUserPermission = currentUser.getPermissionLevel();
		
		List<Projects> projectsList = null;
		if ( currentUserPermission <= globalAdminLevel ) {
			projectsList = 					this.projectsService.listProjects();
		} else if (currentUserPermission <= localAdminLevel ) {
			projectsList = 					this.projectsService.listProjectsByCountry( currentUser.getCountry() );
		} else if (currentUserPermission <= projectManagerLevel) {
			projectsList = 					this.projectsService.listProjectsByProjectManagerId( currentUser.getStaffId() );
		} else {
			projectsList = 					this.projectsService.listProjectsByStaffId( currentUser.getStaffId() );
		}
		
		int userId= currentUser.getStaffId();
		model.addAttribute("getCurrentUserId", 			userId);
		
		
		LinkedHashMap<Projects, List<String>> map = new LinkedHashMap<Projects, List<String>>();
		
		Iterator<Projects> projectsIt = projectsList.iterator();
		
		while(projectsIt.hasNext()){
			Projects project = projectsIt.next();
			int projectId = project.getId();
			
			List<String> fileNameListToMerge = this.projectsFoldersService.getListDescriptionProjectsFoldersByProjectId(projectId);
			
			map.put(project, fileNameListToMerge);
			
		}
		
		
		
		request.getSession().setAttribute("projectsMap", map);
		
		
		//Projects Attributes
		model.addAttribute("projects", 						new Projects());
		//model.addAttribute("maxId", 						this.projectsService.maxId());
		
		//List<Projects> projectListByCountry = this.projectsService.listProjectsByCountry("Portugal");
		
		model.addAttribute("listProjects", projectsList);
//		model.addAttribute("listProjectsMap", map);
		
		
		return projectFiles + "project_list";
		
		
		} catch (NullPointerException e) {
			return "redirect:../";
		}

	}

	@RequestMapping(value = "/project{id}", method = RequestMethod.GET)
	public String selectProjectById(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		
		try {
			
			//Get loged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			
			System.out.println("-----------------------------------------------");
			System.out.println(currentUser + "      USER CREDENTIALS");
			System.out.println("-----------------------------------------------");
			
			int globalAdminLevel = 		PermissionTypes.getGlobalAdminLevel();
			int localAdminLevel = 		PermissionTypes.getLocalAdminLevel();
			int projectManagerLevel = 	PermissionTypes.getProjectManagerLevel();
			int contributeurLevel = 	PermissionTypes.getContributeurLevel();
					
			int currentUserPermission = currentUser.getPermissionLevel();
			
			
			int userId= currentUser.getStaffId();
			model.addAttribute("getCurrentUserId", 			userId);
			
			
			model.addAttribute("currentUser", currentUser.getName() );
			System.out.println(currentUser.getName() + "         currentUser.getName()  ");
			model.addAttribute("currentUserPermission", currentUserPermission);
			model.addAttribute("projectManagerLevel", projectManagerLevel);
			//Projects Attributes
			model.addAttribute("projects", 						new Projects());
			model.addAttribute("selectProjectById", 			this.projectsService.getProjectsById(id));
			model.addAttribute("listProjects", 					this.projectsService.listProjects());
			model.addAttribute("getCurrentProjectId", 			id);
			
			//Folders Attributes
			model.addAttribute("folders",						new Folders());
			model.addAttribute("listFolders",					this.foldersService.listFolders());
			
			//ProjectsFolders Attributes
			model.addAttribute("projectsFolders", 				new ProjectsFolders());
			model.addAttribute("listProjectsFolders", 			this.projectsFoldersService.getListProjectsFoldersByProjectId(id));
			model.addAttribute("getProjectTemplateState", 		this.projectsService.getProjectsById(id).getTemplateUpdated());
			//model.addAttribute("maxId", this.projectFoldersService.maxId());
			
			
			List<Projects> projectsList = null;
			if ( currentUserPermission <= globalAdminLevel ) {
				projectsList = 					this.projectsService.listProjects();
			} else if (currentUserPermission <= localAdminLevel ) {
				projectsList = 					this.projectsService.listProjectsByCountry( currentUser.getCountry() );
			} else if (currentUserPermission <= projectManagerLevel) {
				projectsList = 					this.projectsService.listProjectsByProjectManagerId( currentUser.getStaffId() );
			} else {
				projectsList = 					this.projectsService.listProjectsByStaffId( currentUser.getStaffId() );
			}

			LinkedHashMap<Projects, List<String>> map = new LinkedHashMap<Projects, List<String>>();
			
			Iterator<Projects> projectsIt = projectsList.iterator();
			
			while(projectsIt.hasNext()){
				Projects project = projectsIt.next();
				int projectId = project.getId();
				
				List<String> fileNameListToMerge = this.projectsFoldersService.getListDescriptionProjectsFoldersByProjectId(projectId);
				
				map.put(project, fileNameListToMerge);
				
			}
			request.getSession().setAttribute("projectsMap", map);
			
			return projectFiles + "project_detail";
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}

	}

	@RequestMapping(value = "/add_project", method = RequestMethod.POST)
	public String addProject(@ModelAttribute("projects") Projects p, HttpServletRequest request) {

//		System.out.println(req);
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getParameterNames());
		
//		Enumeration enumeration = request.getParameterNames();
//      while (enumeration.hasMoreElements()) {
//          String parameterName = (String) enumeration.nextElement();
//          System.out.println("Parameter = " + parameterName);
//      }
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			
			p.setCountry( currentUser.getCountry() );

			p.setProjectManager( currentUser.getStaff() );
			//System.out.println(currentUser.getName());

			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		
		
		
		if(p.getId() == 0) {
			this.projectsService.addProject(p);
		} else {
			this.projectsService.updateProject(p);
		}
		
		System.out.println(p.getId() +  " NEW PROJECT ID .............");
		System.out.println(p.getDescription() +  " NEW PROJECT ID .............");
		
		int id = p.getId();
		logger.info(id);

		return "redirect:../project" + id + "_preview";
	}


	@RequestMapping(value = "/project{id}_preview", method = RequestMethod.GET)
	public String projectPreview(@PathVariable("id") int id, HttpServletRequest request, Model model) {
		Projects currentProject = this.projectsService.getProjectsById(id);
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			
			int userId= currentUser.getStaffId();
			
			boolean wizardCompleted = currentProject.isWizardCompleted();
			String isDisabled = wizardCompleted ? "" : "disabled";
			String isTab 		= wizardCompleted ? "" : "tab";
			
			model.addAttribute("tab", 					isTab);
			model.addAttribute("wizardCompleted", 		isDisabled);
			model.addAttribute("getCurrentUserId", 			userId);
			currentUser.getStaff();
			
			request.getSession().setAttribute("sessionProjectId", id);
			
			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		
		
		
		
		
		
		//Projects Attributes
		model.addAttribute("projects", 							new Projects());
		model.addAttribute("selectProjectById", 				currentProject);
		model.addAttribute("listProjects", 						this.projectsService.listProjects());
		model.addAttribute("getCurrentProjectId", 				id);

		//Folders Attributes
		model.addAttribute("folders", 							new Folders());
		model.addAttribute("listFolders", 						this.foldersService.listFolders());


		//ProjectsFolders Attributes
		model.addAttribute("projectsFolders", 					new ProjectsFolders());
		model.addAttribute("listProjectsFolders", 				this.projectsFoldersService.getListProjectsFoldersByProjectId(id));

		return projectFiles + "project_preview";
	}

	@RequestMapping(value = "/project_create")
	public String projectCreate(HttpServletRequest request, Model model) {
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			
			int userId= currentUser.getStaffId();
			model.addAttribute("getCurrentUserId", 			userId);
			
			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		
		
		
		//Projects Attributes
		model.addAttribute("projects", 							new Projects());

		return projectFiles + "project_create";
	}

	@RequestMapping(value = "/project{id}_edit")
	public String editProject(@PathVariable("id") int id, HttpServletRequest request, Model model) {
		Projects currentProject = this.projectsService.getProjectsById(id);

		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			int userId= currentUser.getStaffId();
			
			
			boolean wizardCompleted = currentProject.isWizardCompleted();
			String isDisabled 	= wizardCompleted ? "" : "disabled";
			String isTab 		= wizardCompleted ? "" : "tab";
			
			model.addAttribute("tab", 					isTab);
			model.addAttribute("wizardCompleted", 		isDisabled);
			model.addAttribute("getCurrentUserId", 			userId);
			

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		//Projects Attributes
		model.addAttribute("projects", new Projects());
		model.addAttribute("selectProjectById", 				currentProject);
		model.addAttribute("listProjects", 						this.projectsService.listProjects());
		model.addAttribute("getCurrentProjectId", 				id);
		model.addAttribute("getCurrentProjectName", 			currentProject.getTitle());
		model.addAttribute("getCurrentProjectDescription", 		currentProject.getDescription());
		model.addAttribute("getCurrentProjectStatus", 			currentProject.getProject_status());
		model.addAttribute("getCurrentDeadline", 				currentProject.getDeadline());

		//Folders Attributes
		model.addAttribute("folders", 							new Folders());
		model.addAttribute("listFolders", 						this.foldersService.listFolders());

		//ProjectsFolders Attributes
		model.addAttribute("projectsFolders", 					new ProjectsFolders());
		model.addAttribute("listProjectsFolders", 				this.projectsFoldersService.getListProjectsFoldersByProjectId(id));
	
		return projectFiles + "project_edit";
	}

	@RequestMapping(value = "/edit_project={id}", method = RequestMethod.POST)
	public String addProject(@PathVariable("id") int id, @ModelAttribute("projects") Projects p, HttpServletRequest request , Model model) {
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			
		int userId= currentUser.getStaffId();
		model.addAttribute("getCurrentUserId", 			userId);
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		
		Projects oldProject = this.projectsService.getProjectsById(id);
		p.setCountry(oldProject.getCountry());
		p.setProjectManager(oldProject.getProjectManager());
		p.setStaffList(oldProject.getStaffList());
		p.setTemplateUpdated("false");
		p.setWizardCompleted(oldProject.isWizardCompleted());
		
			this.projectsService.updateProject(p);
		
		return "redirect:../project" + id + "_preview";
	};

	@RequestMapping(value = "/delete_project={id}", method = RequestMethod.GET)
	public String deleteProject(@PathVariable("id") int id, @ModelAttribute("projects") Projects p) throws IOException {

		int projectId = id;
		
		if(!(p.getId() == 0)) {
			List<ProjectsFolders> lpf = this.projectsFoldersService.getListProjectsFoldersByProjectId(projectId);
				for (ProjectsFolders pf : lpf) {	
					this.projectsFoldersService.removeProjectsFolders(pf.getId());
				}
			this.projectsService.removeProjects(p.getId());
		}
		
		
		String directory = path + "folders\\" + id;
		FileUtils.deleteDirectory(new File(directory));
		return "redirect:project_list";
	}
	
	@RequestMapping(value = "/project{id}_addStaff", method = RequestMethod.GET)
	public String projectAssignStaff(@PathVariable("id") int id, HttpServletRequest request, Model model) {
		Projects currentProject = this.projectsService.getProjectsById(id);
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			
			boolean wizardCompleted = currentProject.isWizardCompleted();
			String isDisabled 	= wizardCompleted ? "" : "disabled";
			String isTab 		= wizardCompleted ? "" : "tab";
			
			model.addAttribute("tab",			 		isTab);
			model.addAttribute("wizardCompleted", 		isDisabled);
			
			int userId= currentUser.getStaffId();
			model.addAttribute("getCurrentUserId", 			userId);

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		int projectId = id;
		Projects project = this.projectsService.getProjectsById(projectId);
		
		List<Staff> projectStaffList = project.getStaffList();
		
		ArrayList<Staff> staffUnavailable = new ArrayList<Staff>();
		ArrayList<Staff> staffAvailable = (ArrayList<Staff>) this.staffService.listStaff();
		
		staffUnavailable.addAll(projectStaffList);
		
		for ( Staff b : staffUnavailable) {	
			for ( Staff a : staffAvailable) {			
					if ( b.getName().equalsIgnoreCase(a.getName()) ) {
						staffAvailable.remove(a);
						break;
					}
			}
		}		
		
		for ( Staff a : staffAvailable) {
			System.out.println(a.getName() + "  LISTA DE DUDES------------------------------------------------------------------------2349508923572304");
		}
		
		for (Iterator<Staff> it = staffAvailable.iterator(); it.hasNext(); ) {
			
			Staff currentIteratorStaff = it.next();
			
			System.out.println(currentIteratorStaff.getName() + " NAME FORA DE IF -------------------");
			System.out.println(currentIteratorStaff.getPermissions().getId() + " PERM ID FORA DE IF -------------------");
			if ( currentIteratorStaff.getPermissions().getId() != 4 ) {
				
				System.out.println(currentIteratorStaff.getName() + " NAME DENTRO Do IF -------------------");
				System.out.println(currentIteratorStaff.getPermissions().getId() + " NAME DENTRO Do IF -------------------");
		        it.remove();
			}
			System.out.println("===============================================");
		}
		
		model.addAttribute("projects", 					new Projects());
		model.addAttribute("selectProjectById", 		project);
		model.addAttribute("listProjects", 				this.projectsService.listProjects());
		model.addAttribute("getCurrentProjectId", 		id);
		
		model.addAttribute("listStaff", 				staffAvailable);
		model.addAttribute("listStaffAssignedToProject",project.getStaffList());
		
		//Folders Attributes
		model.addAttribute("folders", 					new Folders());
		model.addAttribute("listFolders", 				this.foldersService.listFolders());
		//model.addAttribute("maxId", 					this.foldersService.maxId());

		//ProjectsFolders Attributes
		model.addAttribute("projectsFolders", 			new ProjectsFolders());
		model.addAttribute("listProjectsFolders", 		this.projectsFoldersService.getListProjectsFoldersByProjectId(id));
		

		return projectFiles + "project_addStaff";
	}
	
	@RequestMapping(value = "/addStaffToProject={id}", method=RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String addStaffToProject(@PathVariable("id") int id, @RequestBody final FrontEndGetStaffListToProject staffIdList, Model model) {
		
		
		int projectId = id;
		
		List<Staff> projectStaffList = new ArrayList<Staff>();
		
		
		Projects p = this.projectsService.getProjectsById(projectId);
		//Projects p = new Projects();
		
		for (int staffId : staffIdList.getIdStaffList() ) {
			
			Staff staff = this.staffService.getStaffById(staffId);
			
			projectStaffList.add(staff);

		}
		
		p.setStaffList(projectStaffList);
		
		this.projectsService.updateProject(p);
		

		ArrayList<Staff> staffUnavailable = new ArrayList<Staff>();
		ArrayList<Staff> staffAvailable = (ArrayList<Staff>) this.staffService.listStaff();
		
		staffUnavailable.addAll(projectStaffList);
		
		
		//Remove selected staff from all staff available
		for ( Staff b : staffUnavailable) {	
			for ( Staff a : staffAvailable) {			
					if ( b.getName().equalsIgnoreCase(a.getName()) ) {
						staffAvailable.remove(a);
						break;
					}
			}
		}		
		
		//loop through all tasks and check if a task is assigned to a staff that is not selected - case true, remove the task from him
		ArrayList<ProjectsFolders> projectsFoldersList = (ArrayList<ProjectsFolders>) this.projectsFoldersService.getListProjectsFoldersByProjectId(projectId);
		
		for ( ProjectsFolders pfl : projectsFoldersList) {
			if ( pfl.getStaff() != null ) {
				for ( Staff avl : staffAvailable) {	
					if ( pfl.getStaff().getName().equals(avl.getName()) ) {
						pfl.setStaff(null);
						this.projectsFoldersService.updateProjectFolder(pfl);
						break;
					}
				}
			}
		}
		
		return "no need for this return";
	}

	@RequestMapping(value = "/project{id}_assignTask", method = RequestMethod.GET)
	public String projectAssignTasks(@PathVariable("id") int id, HttpServletRequest request, Model model) {
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			
			int userId= currentUser.getStaffId();
			model.addAttribute("getCurrentUserId", 			userId);
			
			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		int projectId = id;
		Projects project = this.projectsService.getProjectsById(projectId);
		
		model.addAttribute("projects", 					new Projects());
		model.addAttribute("selectProjectById", 		project);
		model.addAttribute("listProjects", 				this.projectsService.listProjects());
		model.addAttribute("getCurrentProjectId", 		id);
		
		model.addAttribute("listStaffAssignedToProject",project.getStaffList());

		//Folders Attributes
		model.addAttribute("folders", 					new Folders());
		model.addAttribute("listFolders", 				this.foldersService.listFolders());
		//model.addAttribute("maxId", 					this.foldersService.maxId());

		//ProjectsFolders Attributes
		model.addAttribute("projectsFolders", 			new ProjectsFolders());
		model.addAttribute("listProjectsFolders", 		this.projectsFoldersService.getListProjectsFoldersByProjectId(id));

		return projectFiles + "project_assignTask";
	}

	@RequestMapping(value = "/project{id}_assignTaskFrame/{user}", method = RequestMethod.GET)
	public String projectJstree(@PathVariable("id") int id, @PathVariable("user") int user, Model model) {

		//Projects Attributes
		model.addAttribute("projects", 					new Projects());
		model.addAttribute("selectProjectById", 		this.projectsService.getProjectsById(id));
		model.addAttribute("listProjects", 				this.projectsService.listProjects());
		model.addAttribute("getCurrentProjectId", 		id);
		model.addAttribute("listStaff", 				this.staffService.listStaff());

		//Folders Attributes
		model.addAttribute("folders", 					new Folders());
		model.addAttribute("listFolders", 				this.foldersService.listFolders());
		//model.addAttribute("maxId", 					this.foldersService.maxId());

		//ProjectsFolders Attributes
		model.addAttribute("projectsFolders", 			new ProjectsFolders());
		model.addAttribute("listProjectsFolders", 		this.projectsFoldersService.getListProjectsFoldersByProjectId(id));

		//Utils Attributes
		model.addAttribute("getCurrentStaffId", 		user);
		model.addAttribute("getProjectTemplateState", 	this.projectsService.getProjectsById(id).getTemplateUpdated());

		return projectFiles + "project_assignTaskFrame";
	}
	
	@RequestMapping(value = "/project{id}_uploadDocument", method = RequestMethod.GET)
	public String projectUploadDocument(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		int projId = id;
		
		String uploadFileName = (String) request.getSession().getAttribute("uploadFileName");
		System.out.println(uploadFileName + " FILE UPLOAD Name CONTROLER */**--***********/*/*-/*-/-*/");
		
		ProjectsFolders newProjectFolder = new ProjectsFolders();
		Projects currentProj = this.projectsService.getProjectsById(projId);
		
		//newProjectFolder.setId(projId);
		newProjectFolder.setDescription(uploadFileName);
		
		newProjectFolder.setFinished(false);
		newProjectFolder.setInUse(true);
		newProjectFolder.setIs_file(1);
		//newProjectFolder.setNodeId(nodeId);
		//newProjectFolder.setOrdenation(ordenation);
		newProjectFolder.setParent("#");
		newProjectFolder.setPath(uploadFileName);
		newProjectFolder.setProject(currentProj);
		//newProjectFolder.setStaff(staff);
		
		
		this.projectsFoldersService.addProjectFolder(newProjectFolder);
		
		
		System.out.println( " Inside Controller ");
		return "redirect:/web/project" + projId + "_preview";
		
	}
	
	@RequestMapping(value = "/addBlankDocumentFileToProject={id}", method = RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody void addBlankDocumentFileToProject(@PathVariable("id") int id, Model model, @RequestBody String documentName, HttpServletRequest request) {

		int projId = id;
		Projects currentProj = this.projectsService.getProjectsById(projId);
		ProjectsFolders addBlankDocument = new ProjectsFolders();
		
		//addBlankDocument.setId(projId);
		addBlankDocument.setDescription(documentName);
		
		addBlankDocument.setFinished(false);
		addBlankDocument.setInUse(true);
		addBlankDocument.setIs_file(1);
		//addBlankDocument.setNodeId(nodeId);
		//addBlankDocument.setOrdenation(ordenation);
		addBlankDocument.setParent("#");
		addBlankDocument.setPath(documentName);
		addBlankDocument.setProject(currentProj);
		//addBlankDocument.setStaff(staff);
		
		this.projectsFoldersService.addProjectFolder(addBlankDocument);
		
		//String filePath = path + "\\template\\";
		String filePath = path + "\\folders\\" +  projId + "\\";
		String blankDocumentPath = path + "\\utils\\blankDocument.docx";
		String tag = ".docx";
		
		
		
		try {
			
			//File blankDocumentFile = new File(filePath + documentName + tag);
			File file 			= new File( filePath + documentName + tag);
			File blankDocument 	= new File( blankDocumentPath );
		
			if( !file.exists() ) {
       	    	//System.out.println(file.getName() + "  file name");
       	    	FileUtils.copyFile(blankDocument, file);
       	    }
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value = "/wizardCompletedProjectId={id}", method = RequestMethod.GET)
	public void projectWizardCompleted(@PathVariable("id") int id, Model model) {
		
		int projId = id;
		Projects currentProject = this.projectsService.getProjectsById(projId);
		currentProject.setWizardCompleted(true);
		this.projectsService.updateProject(currentProject);
		
	}
	
	
	@RequestMapping(value = "/archive_project={id}", method = RequestMethod.GET)
	public String archiveProject(@PathVariable("id") int id, Model model) {

		int projectId = id;
		
		Projects p = this.projectsService.getProjectsById(projectId);
			
			boolean archivedStatus = p.getProject_archived();
			
			archivedStatus = !archivedStatus;
		
			p.setProject_archived(archivedStatus);
			
			this.projectsService.updateProject(p);
			
		return "redirect:project_list";
	}	

	@RequestMapping(value = "/verify_project={id}", method = RequestMethod.GET)
	public String verifyProjectById(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
				
		int userId= currentUser.getStaffId();
		model.addAttribute("getCurrentUserId", 			userId);
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
		
		//Projects Attributes
		model.addAttribute("projects", 						new Projects());
		model.addAttribute("selectProjectById", 			this.projectsService.getProjectsById(id));
		model.addAttribute("listProjects", 					this.projectsService.listProjects());
		model.addAttribute("getCurrentProjectId", 			id);

		//Folders Attributes
		model.addAttribute("folders",						new Folders());
		model.addAttribute("listFolders",					this.foldersService.listFolders());
		//model.addAttribute("maxId", 						this.foldersService.maxId());

		//ProjectsFolders Attributes
		model.addAttribute("projectsFolders", 				new ProjectsFolders());
		model.addAttribute("listProjectsFolders", 			this.projectsFoldersService.getListProjectsFoldersByProjectId(id));
		//model.addAttribute("maxId", this.projectFoldersService.maxId());
		
		List<String> fileNameListToMerge = this.projectsFoldersService.getListDescriptionProjectsFoldersByProjectId(id);
		
		currentUser.setFileNameListToMerge(fileNameListToMerge);
		

		return projectFiles + "project_verify";
	}

/*	
	@RequestMapping(value="/merge_project={id}") 
	public void mergeProjectById(@PathVariable("id") String id, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
				
		int userId= currentUser.getStaffId();
//		model.addAttribute("getCurrentUserId", 			userId);
		} catch (NullPointerException e) {
			
			RequestDispatcher rd = request.getRequestDispatcher("../");
			rd.forward(request, response);
			
		}
		
		String projId = id;
		LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
		currentUser.setCurrentProjectId(projId);
		
		RequestDispatcher rd = request.getRequestDispatcher("../services/merge");
		
		rd.forward(request, response);
		
	}
	
	
*/	
}