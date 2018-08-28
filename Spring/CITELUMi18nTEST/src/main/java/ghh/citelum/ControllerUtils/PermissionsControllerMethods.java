package ghh.citelum.ControllerUtils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ghh.citelum.model.Staff;
import ghh.citelum.service.PermissionsService;
import ghh.citelum.service.StaffService;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.LoginCredentials;

public abstract class PermissionsControllerMethods {
	
	private PermissionsService permissionsService;
	private StaffService staffService;
	
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
		
	//======================== Setters End ========================
	

	public String checkIfUserExistsDatabase(HttpServletRequest request) {
		
		
		try {

			System.out.println(request.getSession().getAttribute("currentSessionCredentials") + "             REQUEST");
		
			LoginCredentials sessionCredentials = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			System.out.println(sessionCredentials.getName() + "                        nameeeeeeeeeeeeeeeeeeeeeeee");
			Staff currentUser = this.staffService.getStaffByName( sessionCredentials.getName() );
			
			System.out.println(currentUser.getName() + "                      database  nameeeeeeeeeeeeeeeeeeeeeeee");
			
			System.out.println(	currentUser.toString() );

			sessionCredentials.setStaffId( currentUser.getId() );
			
			System.out.println( sessionCredentials.getName()       + "    Name");
			System.out.println( sessionCredentials.getPassword()   + "    Pass");
			System.out.println( sessionCredentials.getStaffId()    + "    StID");
			System.out.println( sessionCredentials.getSessionId()  + "    Ssid");
		
		
		request.getSession().setAttribute("currentSessionCredentials", sessionCredentials);
		
		
		//response.sendRedirect("profile");
		//return loginFiles + "profile";
		return "redirect:profile";
		
		} catch (NullPointerException e) {
			
			System.out.println("boa");
			//return "hey man";
			return "redirect:page_404";
		}
		
	}
}
