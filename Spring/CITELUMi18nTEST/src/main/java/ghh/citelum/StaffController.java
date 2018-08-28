package ghh.citelum;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ghh.citelum.ControllerUtils.ProjectsControllerMethods;
import ghh.citelum.model.Folders;
import ghh.citelum.model.Notifications;
import ghh.citelum.model.Permissions;
import ghh.citelum.model.Projects;
import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.model.Staff;
import ghh.citelum.service.StaffService;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.PermissionTypes;
import ghh.citelum.service.FoldersService;
import ghh.citelum.service.NotificationsService;
import ghh.citelum.service.PermissionsService;
import ghh.citelum.service.ProjectsFoldersService;
import ghh.citelum.service.ProjectsService;


@Controller
public class StaffController extends ProjectsControllerMethods {
	
	private StaffService staffService;
	private PermissionsService permissionsService;
	private ProjectsFoldersService projectsFoldersService;
	private NotificationsService notificationsService;
	private ProjectsService projectsService;
	
	//======================== Front End Paths ========================
	FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();
	
	private String projectFiles = frontEndFilePaths.getProjectFiles();
	private String userFiles = frontEndFilePaths.getUserFiles();

	
	//======================== Setters Start ========================
	
	@Autowired(required=true)
	@Qualifier(value="staffService")
	public void setStaffService(StaffService ps){
		this.staffService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="permissionsService")
	public void setPermissionsService(PermissionsService ps){
		this.permissionsService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="projectsFoldersService")
	public void setProjectsFoldersService(ProjectsFoldersService pfs){
		this.projectsFoldersService = pfs;
	}
	
	@Autowired(required=true)
	@Qualifier(value="notificationsService")
	public void setNotificationsService(NotificationsService notificationsService) {
		this.notificationsService = notificationsService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="projectsService")
	public void setProjectsService(ProjectsService ps) {
		this.projectsService = ps;
	}
	
	//======================== Setters End ========================
	
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String listPersons(Model model, HttpServletRequest request) {
		
		// check if user has right permissions to view page
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getLocalAdminLevel();
			
			int userId= currentUser.getStaffId();
			
		model.addAttribute("getCurrentUserId", 			userId);

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		// END OF check if user has right permissions to view page
		
		
		model.addAttribute("person", new Staff());
		
		LinkedHashMap<Staff, Integer> map = new LinkedHashMap<Staff,Integer>();
		
		List<Staff> staffList = this.staffService.listStaff();
		
		Iterator<Staff> staffIt = staffList.iterator();
		
		while(staffIt.hasNext()) {
			Staff staff = staffIt.next();
			int staffId = staff.getId();
			
			List<ProjectsFolders> projectsFolders = this.projectsFoldersService.getListProjectsFoldersByStaffId(staffId);
					
			Iterator<ProjectsFolders> pfit = projectsFolders.iterator();
			int staffIncompleteTasks = 0;
			while (pfit.hasNext()) {
				ProjectsFolders projectFolder = pfit.next();
				
				if (!projectFolder.isFinished()){
					staffIncompleteTasks ++;
				}
			}
				map.put(staff, staffIncompleteTasks);
			}
		
		model.addAttribute("listPersonsMap", map);
		model.addAttribute("listPersons", staffList);
		request.getSession().setAttribute("listPersonsMap", map);
		model.addAttribute("listPermissions", this.permissionsService.listPermissions() );
		
		
		return userFiles + "user_list";
	}
	
	
	@RequestMapping(value = "/user_list={permissionId}", method = RequestMethod.GET)
	public String listPersonsByPermissionId(@PathVariable("permissionId") int permissionId, Model model, HttpServletRequest request) {
		
		// check if user has right permissions to view page
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getLocalAdminLevel();
			
			int userId= currentUser.getStaffId();
			
			model.addAttribute("getCurrentUserId", 			userId);

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		// END OF check if user has right permissions to view page
		

		model.addAttribute("person", new Staff());		
		
		model.addAttribute("listPermissions", this.permissionsService.listPermissions() );
			
		LinkedHashMap<Staff, Integer> map = new LinkedHashMap<Staff,Integer>();
		
		List<Staff> staffList = this.staffService.listStaffByPermissionId(permissionId);
		
		Iterator<Staff> staffIt = staffList.iterator();
		
		while(staffIt.hasNext()) {
			Staff staff = staffIt.next();
			int staffId = staff.getId();
			
			List<ProjectsFolders> projectsFolders = this.projectsFoldersService.getListProjectsFoldersByStaffId(staffId);
//			List<Projects> test4 = test3.getProjectsList();
//			System.out.println("Original contents of ProjectList: ");
			Iterator<ProjectsFolders> pfit = projectsFolders.iterator();
			int staffIncompleteTasks = 0;
			while (pfit.hasNext()) {
				ProjectsFolders projectFolder = pfit.next();				
				if (!projectFolder.isFinished()){
					staffIncompleteTasks ++;
				}
			}
				map.put(staff, staffIncompleteTasks);
			}		
		request.getSession().setAttribute("listPersonsMap", map);
		model.addAttribute("listPersonsMap", map);
		model.addAttribute("listPersons", staffList);
		
		return userFiles + "user_list";
	}
	
	@RequestMapping(value = "/user{id}_edit")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.staffService.getStaffById(id));
//        model.addAttribute("listPersons", this.staffService.listStaff());
        
        model.addAttribute("listPermissions",				this.permissionsService.listPermissions() );
                
        model.addAttribute("getUserEditId", id);
        System.out.println("/user{id}_edit");
        
        
        return userFiles + "user_edit";
    }
	
    @RequestMapping(value = "/edit_user={id}")
    public String editUser(@PathVariable("id") int id, @ModelAttribute("user") Staff formStaff,HttpServletRequest request){
    	
		// check if user has right permissions to view page
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getLocalAdminLevel();
			

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		// END OF check if user has right permissions to view page
    	
    	System.out.println("/edit_user={id}");
    	Staff databaseStaff = this.staffService.getStaffById(id);
    	
    	String permission = request.getParameter("formPermissions");
    	
    	int permissionId = Integer.parseInt(permission);
    	
    	Permissions formPermission = this.permissionsService.getPermissionById(permissionId);
    	
    	databaseStaff.setName(formStaff.getName());
    	databaseStaff.setCountry(formStaff.getCountry());
    	databaseStaff.setPermissions(formPermission);
    	databaseStaff.setEmail(formStaff.getEmail());
//    	databaseStaff.setPicture_path(formStaff.getPicture_path());
    	
    	
    	this.staffService.updateStaff(databaseStaff);
    	
//    	model.addAttribute("person", this.staffService.getStaffById(id));
//      model.addAttribute("listPersons", this.staffService.listStaff());
    	System.out.println("/edit_user={id}2");
    	return "redirect:../user_list";
    }
	
    @RequestMapping(value = "/user_create")
    public String userCreate(HttpServletRequest request, Model model) {
    	
		// check if user has right permissions to view page
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getLocalAdminLevel();
			
			int userId= currentUser.getStaffId();
			
			model.addAttribute("getCurrentUserId", 			userId);
			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		// END OF check if user has right permissions to view page
    	
		//Projects Attributes
		model.addAttribute("user", 							new Staff());
		model.addAttribute("listPermissions",				this.permissionsService.listPermissions() );

		return userFiles + "user_create";
    	
    }
    
    @RequestMapping(value = "/add_user", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") Staff formStaff, HttpServletRequest request, Model model) {
    	
		// check if user has right permissions to view page
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getLocalAdminLevel();
			

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../../";
		}
		
		// END OF check if user has right permissions to view page
    	
//    	System.out.println(formStaff.toString());
    	
		
		
		try {
			
			System.out.println(formStaff.getLogin() + " user in form");
			Staff user = this.staffService. getStaffByLogin(formStaff.getLogin());
			System.out.println(user.getLogin() + "User exists in database");
			
			String existentUser = "User already exists in database";
			
			model.addAttribute("existentUser", 		existentUser);
			model.addAttribute("user", 				new Staff());
			model.addAttribute("listPermissions",	this.permissionsService.listPermissions() );
			
			user = null;
			
			return userFiles + "user_create";
			
		} catch (NullPointerException e) {
			//return "../user_create";
			System.out.println("User doesnt exist in database");
			
		}

    	String permission = request.getParameter("formPermissions");
    	
    	int permissionId = Integer.parseInt(permission);
    	
    	Permissions formPermission = this.permissionsService.getPermissionById(permissionId);
    	
    	formStaff.setPermissions(formPermission);
    	formStaff.setPicture_path("default.jpg");
    	
		if(formStaff.getId() == 0) {
			this.staffService.addStaff(formStaff);;
		} else {
			this.staffService.updateStaff(formStaff);;
		}

//		int id = formStaff.getId();
//		logger.info(id);

		return "redirect:../user_list";
    }
	

	@RequestMapping("/delete_user={id}")
    public String removeUser(@PathVariable("id") int id, HttpServletRequest request){
		
//		@SuppressWarnings("unchecked")
//		LinkedHashMap<Staff, Integer> listPersonsMap = (LinkedHashMap<Staff, Integer>) request.getAttribute("listPersonsMap");
		
		
//		Staff staff = this.staffService.getStaffById(id);
		
		
		// check if user has right permissions to perform action
		
				try {
					//Get logged user
					LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
					int currentUserPermission = currentUser.getPermissionLevel();
					int requiredPermission = PermissionTypes.getLocalAdminLevel();
					

					if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) || currentUser.getStaff().getId() == id ) {
						return "redirect:page_403";
					};
					
					
				} catch (NullPointerException e) {
					return "redirect:../../";
				}
				
				// END OF check if user has right permissions to view page
		
		
		List<ProjectsFolders> staffProjectsFoldersList = this.projectsFoldersService.getListProjectsFoldersByStaffId(id);

		Iterator<ProjectsFolders> pfit = staffProjectsFoldersList.iterator();
		
		int staffIncompleteTasks = 0;
		while (pfit.hasNext()) {
			ProjectsFolders projectFolder = pfit.next();				
			if (!projectFolder.isFinished()){
				staffIncompleteTasks ++;
				return "redirect:/user_list";
			}
		};
		
		if (staffIncompleteTasks !=0) {
			return "redirect:/user_list";
		}
		

		
//		List<ProjectsFolders> staffProjectsFoldersList = this.projectsFoldersService.getListProjectsFoldersByStaffId(id);
		
		for ( ProjectsFolders pf : staffProjectsFoldersList) {
//			System.out.println(pf.getDescription() + " getDescription");
//			System.out.println(pf.getStaff().getName() + " getStaff().getName()");
//			System.out.println(pf.getProject().getDescription() + " getProject().getDescription()");
			pf.setStaff(null);
			
			this.projectsFoldersService.updateProjectFolder(pf);
			
		}
		
		List<Notifications> receivedNotifications = this.notificationsService.getListReceivedNotificationsByStaffId(id);
		
		for ( Notifications received : receivedNotifications ) {
			
			this.notificationsService.removeNotification(received.getId());

		}
		
		List<Notifications> sentNotifications = this.notificationsService.getListSentNotificationsByStaffId(id);
		
		for (Notifications sent : sentNotifications) {
			
			this.notificationsService.removeNotification(sent.getId());
		}		
		
        this.staffService.removeStaff(id);
        return "redirect:/web/user_list";
    }    
    
	
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Staff());
		model.addAttribute("listPersons", this.staffService.listStaff());
		return "person";
	}
	
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Staff p){
		
		if(p.getId() == 0){
			//new person, add it
			this.staffService.addStaff(p);
		}else{
			//existing person, call update
			this.staffService.updateStaff(p);
		}
		
		return "redirect:/web/persons";
		

	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.staffService.removeStaff(id);
        return "redirect:/web/persons";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson3(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.staffService.getStaffById(id));
        model.addAttribute("listPersons", this.staffService.listStaff());
        return "person";
    }
	
}