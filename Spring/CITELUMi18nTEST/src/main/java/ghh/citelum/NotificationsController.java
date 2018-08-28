package ghh.citelum;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ghh.citelum.model.Folders;
import ghh.citelum.model.Notifications;
import ghh.citelum.model.Projects;
import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.model.Staff;
import ghh.citelum.service.FoldersService;
import ghh.citelum.service.NotificationsService;
import ghh.citelum.service.ProjectsFoldersService;
import ghh.citelum.service.ProjectsService;
import ghh.citelum.service.StaffService;
import ghh.citelum.utils.ChapterValue;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.email.SendEmail;;

@Controller
public class NotificationsController {

	private NotificationsService notificationsService;
	private StaffService staffService;
	private ProjectsService projectsService;
	private FoldersService foldersService;
	private ProjectsFoldersService projectsFoldersService;
	
	//======================== Front End Paths ========================
	FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();
	
	private String projectFiles = frontEndFilePaths.getProjectFiles();
	private String userFiles = frontEndFilePaths.getUserFiles();
	private String utilsFiles = frontEndFilePaths.getUtilsFiles();
	private String notificationFiles = frontEndFilePaths.getNotificationFiles();

	//======================== Setters Start ========================
	@Autowired(required=true)
	@Qualifier(value="notificationsService")
	public void setNotificationsService(NotificationsService notificationsService) {
		this.notificationsService = notificationsService;
	}

	@Autowired(required=true)
	@Qualifier(value="staffService")
	public void setStaffService(StaffService staffService) {
		this.staffService = staffService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="projectsService")
	public void setProjectsService(ProjectsService projectsService) {
		this.projectsService = projectsService;
	}

	@Autowired(required=true)
	@Qualifier(value="foldersService")
	public void setFoldersService(FoldersService foldersService) {
		this.foldersService = foldersService;
	}
	
	@Autowired(required=true)
	@Qualifier(value="projectsFoldersService")
	public void setProjectsFoldersService(ProjectsFoldersService projectsFoldersService) {
		this.projectsFoldersService = projectsFoldersService;
	}
	//======================== Setters End ========================

	
	@RequestMapping(value = "/notifications", method = RequestMethod.GET)
	public String notifications(Model model, HttpServletRequest request) {
		try{
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int userId= currentUser.getStaffId();
		
		model.addAttribute("getCurrentUserId", 			userId);
		model.addAttribute("countNotifications", 	this.notificationsService.countNewNotifications(userId));
	//	model.addAttribute("afaagaga", 	this.notificationsService.countNewNotifications(user));
		model.addAttribute("getUserName", this.staffService.getStaffById(userId));
		
//		System.out.println("controller count     " + this.notificationsService.countNewNotifications(userId));
		
		model.addAttribute("listNotifications", 	this.notificationsService.getListReceivedNotificationsByStaffId(userId));
//		model.addAttribute("listById", this.notificationsService.getListReceivedNotificationsByStaffId(id));
		
		//System.out.println("COUNT NOTIFICATIONS                                  " + this.notificationsService.countNewNotifications(user));
		List<Notifications> listNotifications= this.notificationsService.getListReceivedNotificationsByStaffId(userId);
		for ( Notifications notif : listNotifications) {
			if ( notif.isState() == false ) {
			
				notif.setState(true);
			this.notificationsService.updateNotification(notif);
				}
			}
		}catch (NullPointerException e) {
			return "redirect:../";
		}
		
		return notificationFiles + "notifications";
	}
	
	@RequestMapping(value = "/notificationUpdate{user}", method=RequestMethod.GET)
	public @ResponseBody int notificationCount(@PathVariable("user") int user, Model model) {
		
	
		//model.addAttribute("listNotifications2", 	this.notificationsService.getListReceivedNotificationsByStaffId(1));
//		model.addAttribute("listById", this.notificationsService.getListReceivedNotificationsByStaffId(id));
		
//		System.out.println("COUNT NOTIFICATIONS                                  " + this.notificationsService.countNewNotifications(user));
		
		
		return this.notificationsService.countNewNotifications(user);
	}
	
	@RequestMapping(value = "/assignMessageCreatorProject={id}", method = RequestMethod.GET)
	public @ResponseBody String createNotification(@PathVariable("id") int id, Model model, HttpServletRequest request) {

		int currentProjectId = id;
		model.addAttribute("getCurrentProjectId", 		currentProjectId);
		
		
	
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String date2 = date.toString();
		try {
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			
		List<Integer> lStaff= this.staffService.getStaffListByProjectId(currentProjectId);
		

		Staff PMStaff = this.projectsService.getProjectsById(currentProjectId).getProjectManager();
//		System.out.println(PMStaff.toString() + " PMStaff.tostring");
		String PMStaffName = this.projectsService.getProjectsById(currentProjectId).getProjectManager().getName();
		

		//checks open project, gets Project Manager Staff
		String currentUserName = currentUser.getName();
		//checks logged in Staff name
		
			for (int i = 0; i < lStaff.size(); i++) {
				Staff staff_receiver = this.staffService.getStaffById(lStaff.get(i));
				//for (Integer i: lStaff) {
				
				List<String> fileName= this.projectsFoldersService.getFileNameAssignedByStaffId(currentProjectId, lStaff.get(i));
				String a =staff_receiver.getName() + ", you have been given the following files: ";
			//	System.out.println("LIST STAFF ID             " + lStaff.get(i));
				for(int j = 0; j <fileName.size(); j++) {
					if (j==(fileName.size()-1)) {
						a = a+fileName.get(j) + ".";
					}
					else {
					a = a+ fileName.get(j)+ ", ";
//					System.out.println("File "+(j+1)+ " Name  -   "+fileName.get(j));
					}
				}
				a = a + "<br/>These files belong to the project: " + this.projectsService.getProjectsById(currentProjectId).getTitle() + 
						"<br/>Project Manager: " + PMStaffName + 
						"<br/>You have been assigned these files by: " +  currentUserName ;
				// The project manager information should be on a new column on the -projects- table
				//the "assigned by" name should be from the person that selected the colaborators, might be redundant if only the PM is allowed to do this task
				
				
				
				Notifications n = new Notifications();
				
				n.setDate(date2);
			
				n.setNotifications(a);
				
				n.setState(false);
				
				n.setStaff_receiver(staff_receiver); 
				
				n.setStaff_sender(currentUser.getStaff()); //defined as the project manager ID, must be changed
				this.notificationsService.addNotification(n);
				
				String message = a;
//				SendEmail mail = new SendEmail();
				List<String> toList = new ArrayList<>();
				toList.add(staff_receiver.getEmail());
				String to[] = toList.toArray(new String[0]);
				String subject = "You have tasks assigned!";
				String body = message;
//				System.out.println("i'm in about to go to senMailFromGmail()");
				SendEmail.sendMail(to, subject, body);
			
			}
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		return "###";
	}

	@RequestMapping(value = "/messageCreatorTaskComplete={id}", method = RequestMethod.GET)
	public @ResponseBody String createNotification2(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String date2 = date.toString();
		model.addAttribute("getCurrentProjectId", 		id);
		try {
		LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			
		Staff PMStaff = this.projectsService.getProjectsById(id).getProjectManager();
		//checks open project, gets Project Manager Staff
		String currentUserName = currentUser.getName();
		//checks logged in Staff name
		int file = currentUser.getProjectFoldersId();
		String fileName = this.projectsFoldersService.getProjectsFoldersById(file).getDescription();
		//checks open file, gets front-end file name
		Staff assignedStaff = this.projectsFoldersService.getProjectsFoldersById(file).getStaff();
		String assignedStaffName = assignedStaff.getName();
		//checks open file line, checks the Staff assigned to it and then gets the name
		String projName = this.projectsFoldersService.getProjectsFoldersById(file).getProject().getTitle();
		if( !currentUserName.equals(assignedStaffName) ) {
			String message = "The task: " + fileName + " has been set as completed. <br/> By " 
							+ currentUserName + "<br/>Project: " + projName+ "<br/>" + date2 ;
//			System.out.println("============================================ Task Complete ============================================");

			Notifications n = new Notifications();
			
			n.setDate(date2);
		
			n.setNotifications(message);
			
			n.setState(false);
			
			//current logged in user IS NOT the contributor assigned to the file
			//the receiver is the person assigned to the task
			n.setStaff_receiver(assignedStaff);
			
			n.setStaff_sender(currentUser.getStaff()); 
			this.notificationsService.addNotification(n);
			
//			SendEmail mail = new SendEmail();
			List<String> toList = new ArrayList<>();
			toList.add(assignedStaff.getEmail());
			String to[] = toList.toArray(new String[0]);
			String subject = "Task set to complete";
			String body = message;
//			System.out.println("i'm in about to go to senMailFromGmail()");
			SendEmail.sendMail(to, subject, body);
			
		} else {
//		System.out.println("============================================ Task Complete ============================================");
		String message = "The task: " + fileName + " has been set as completed. <br/> By " 
				+ currentUserName + "<br/>Project: " + projName + "<br/>" + date2 ;
		Notifications n = new Notifications();
		
		n.setDate(date2);
	
		n.setNotifications(message);
		
		n.setState(false);
		
		//current logged in user IS  the contributor assigned to the file
		//the receiver is the Project Manager
		n.setStaff_receiver(PMStaff);
		
		n.setStaff_sender(currentUser.getStaff());
		this.notificationsService.addNotification(n);
		
//		SendEmail mail = new SendEmail();
		List<String> toList = new ArrayList<>();
		toList.add(PMStaff.getEmail());
		String to[] = toList.toArray(new String[0]);
		String subject = "Task set to complete";
		String body = message;
		
//		System.out.println("i'm in about to go to senMailFromGmail()");
		SendEmail.sendMail(to, subject, body);
		
	}
		} catch (NullPointerException e) {
			return "redirect:../";
		}
	
		return "###";
	}
	@RequestMapping(value = "/messageCreatorTaskIncomplete={id}", method = RequestMethod.GET)
		public @ResponseBody String createNotification3(@PathVariable("id") int id, Model model, HttpServletRequest request) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String date2 = date.toString();
			model.addAttribute("getCurrentProjectId", 		id);
			try {
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			
			Staff PMStaff = this.projectsService.getProjectsById(id).getProjectManager();
			//checks open project, gets Project Manager Staff
			String currentUserName = currentUser.getName();
			//checks logged in Staff name
			int file = currentUser.getProjectFoldersId();
			String fileName = this.projectsFoldersService.getProjectsFoldersById(file).getDescription();
			//checks open file, gets front-end file name
			Staff assignedStaff = this.projectsFoldersService.getProjectsFoldersById(file).getStaff();
			String assignedStaffName = assignedStaff.getName();
			//checks open file line, checks the Staff assigned to it and then gets the name
			String projName = this.projectsFoldersService.getProjectsFoldersById(file).getProject().getTitle();
			if( !currentUserName.equals(assignedStaffName) ) {
				
				
				String message = "The task: " + fileName + " has been set back as incomplete. <br/> By " 
								+ currentUserName+ "<br/>Project: " + projName + "<br/>" + date2 ;
//				System.out.println("============================================ Task Incomplete ============================================");

				Notifications n = new Notifications();
				
				n.setDate(date2);
			
				n.setNotifications(message);
				
				n.setState(false);
				
				//current logged in user IS NOT the contributor assigned to the file
				//the receiver is the person assigned to the task
				n.setStaff_receiver(assignedStaff);
				
				n.setStaff_sender(currentUser.getStaff());
				this.notificationsService.addNotification(n);
				
//				SendEmail mail = new SendEmail();
				List<String> toList = new ArrayList<>();
				String email = assignedStaff.getEmail();
				toList.add(email);
				String to[] = toList.toArray(new String[0]);
				String subject = "Task status reverted to incomplete";
				String body = message;
//				System.out.println("i'm in about to go to senMailFromGmail()");
				SendEmail.sendMail(to, subject, body);
				
			} else {
//			System.out.println("============================================ Task Incomplete ============================================");
			String message = "The task: " + fileName + " has been set back as incompleted. <br/> By " 
					+ currentUserName+ "<br/>Project: " + projName + "<br/>" + date2 ;
			Notifications n = new Notifications();
			
			n.setDate(date2);
		
			n.setNotifications(message);
			
			n.setState(false);
			
			//current logged in user IS  the contributor assigned to the file
			//the receiver is the Project Manager
			n.setStaff_receiver(PMStaff);
			
			n.setStaff_sender(currentUser.getStaff());
			this.notificationsService.addNotification(n);
			
//			SendEmail mail = new SendEmail();
			List<String> toList = new ArrayList<>();
			toList.add(PMStaff.getEmail());
			String to[] = toList.toArray(new String[0]);
			String subject = "Task status reverted to incomplete";
			String body = message;
//			System.out.println("i'm in about to go to senMailFromGmail()");
			SendEmail.sendMail(to, subject, body);
			
		}
			} catch (NullPointerException e) {
				return "redirect:../";
			}
		
			return "###";
	}

	
	@RequestMapping(value = "/delete_notifications={id}", method = RequestMethod.GET)
	public String deleteNotification(@PathVariable("id") int id) throws IOException {

		int notificationId = id;
		
		if(!(notificationId == 0)) {

			this.notificationsService.removeNotification(notificationId);
		}
		
		
		return "redirect:notifications";
	}
	
}
