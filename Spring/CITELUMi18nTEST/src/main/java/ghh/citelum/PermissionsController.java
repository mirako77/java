package ghh.citelum;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ghh.citelum.ControllerUtils.PermissionsControllerMethods;
import ghh.citelum.model.Permissions;
import ghh.citelum.model.Projects;
import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.model.Staff;
import ghh.citelum.service.PermissionsService;
import ghh.citelum.service.ProjectsFoldersService;
import ghh.citelum.service.ProjectsService;
import ghh.citelum.service.StaffService;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.PermissionTypes;

@Controller
public class PermissionsController extends PermissionsControllerMethods {
	
	private PermissionsService 		permissionsService;
	private StaffService 			staffService;
	private ProjectsService 		projectsService;
	private ProjectsFoldersService 	projectsFoldersService;
	
	//======================== Front End Paths ========================
		FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();
		
		private String projectFiles = frontEndFilePaths.getProjectFiles();
		private String userFiles = frontEndFilePaths.getUserFiles();
		private String utilsFiles = frontEndFilePaths.getUtilsFiles();

	//======================== Setters Start ========================
	
	@Autowired(required=true)
	@Qualifier(value="permissionsService")
	public void setPermissionsService(PermissionsService ps) {
		this.permissionsService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="staffService")
	public void setStaffService(StaffService ss) {
		this.staffService = ss;
	}
	
	@Autowired(required=true)
	@Qualifier(value="projectsService")
	public void setProjectsService(ProjectsService ps) {
		this.projectsService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="projectsFoldersService")
	public void setProjectsFoldersService(ProjectsFoldersService pfs) {
		this.projectsFoldersService = pfs;
	}	
	
	//======================== Setters End ========================
	
	@RequestMapping(value = "/checkLogin", method = RequestMethod.GET)
	public String checkLogin(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("*-*-*-**-*-*-**-*-*-**-*-*-**-*-*-**-*-*-**-*-*-**-*-*-**-*-*-**-*-*-*");
		
		//String loginData = (String) request.getSession().getAttribute("sessionTest");
		
		//super.checkIfUserExistsDatabase(request);
//		Permissions databasePermissions = this.permissionsService.get
		
		try {
			
			List<Permissions> permissionsList = this.permissionsService.listPermissions();
			
			request.getSession().setAttribute("permissionsList", permissionsList);
			
			request.getSession().setAttribute("globalAdminLevel", PermissionTypes.getGlobalAdminLevel());
			request.getSession().setAttribute("localAdminLevel", PermissionTypes.getLocalAdminLevel());
			request.getSession().setAttribute("projectManagerLevel", PermissionTypes.getProjectManagerLevel());
			request.getSession().setAttribute("contributeurLevel", PermissionTypes.getContributeurLevel());
			
			LoginCredentials sessionCredentials = (LoginCredentials) request.getSession().getAttribute("loginData");
			
			Staff currentUser = this.staffService.getStaffByLogin( sessionCredentials.getLogin() );
			
			System.out.println( currentUser.getLogin() + " " + currentUser.getPermissions().getDescription() + "    current user" );
			
			Permissions databasePerm = this.permissionsService.getPermissionByRole(currentUser.getPermissions().getRole());
			
			//databasePerm.setPermissionKey("asdsdasdfbhasdfbjhasdfjbasf");
			
			//this.permissionsService.updatePermission(databasePerm);
			
			sessionCredentials.setStaff(			currentUser );
			sessionCredentials.setName( 			currentUser.getName());
			sessionCredentials.setStaffId( 			currentUser.getId() );
			sessionCredentials.setPermission( 		currentUser.getPermissions() );
			sessionCredentials.setPermissionLevel( 	currentUser.getPermissions().getId() );
			sessionCredentials.setCountry( 			currentUser.getCountry() );
			
			//sessionCredentials.setPermissionLevel(currentUser.getPermissions().getId());
			//System.out.println(currentUser.getPermissions() + "      currentUser.getPermissions()");
			//System.out.println(  sessionCredentials.getPermission().getRole()   + "             permission");
			
			request.getSession().setAttribute("currentSessionCredentials", sessionCredentials);
		
		//response.sendRedirect("profile");
		//return loginFiles + "profile";
		return "redirect:../web/user_profile";
		
		} catch (NullPointerException e) {
			
			return "redirect:unauthorized";
		}
		
		
		//return "redirect:profile";
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath());
	}

	
	

}
