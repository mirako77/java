package ghh.citelum;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ghh.citelum.service.FoldersService;
import ghh.citelum.service.NotificationsService;
import ghh.citelum.service.ProjectsService;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.PermissionTypes;

@Controller
public class UtilsController {

	private static final Logger logger = LoggerFactory.getLogger(UtilsController.class);

	private FoldersService foldersService;
	private ProjectsService projectsService;
	private NotificationsService notificationsService;

	//======================== Front End Paths ========================
	FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();

	private String projectFiles = frontEndFilePaths.getProjectFiles();
	private String userFiles = frontEndFilePaths.getUserFiles();
	private String utilsFiles = frontEndFilePaths.getUtilsFiles();

	//======================== Setters Start ========================

	@Autowired(required=true)
	@Qualifier(value="foldersService")
	public void setFoldersService(FoldersService fs) {
		this.foldersService = fs;
	}

	@Autowired(required=true)
	@Qualifier(value="projectsService")
	public void setProjectsService(ProjectsService ps) {
		this.projectsService = ps;
	}

	@Autowired(required=true)
	@Qualifier(value="notificationsService")
	public void setNotificationsService(NotificationsService notificationsService) {
		this.notificationsService = notificationsService;
	}

	//======================== Setters End ========================

	@RequestMapping(value = "/page_404", method = RequestMethod.GET)
	public String pageNotFound(Model model) {

		return utilsFiles + "page_404";
	}

	@RequestMapping(value = "/page_403", method = RequestMethod.GET)
	public String pageUnauthorized(Model model) {

		return utilsFiles + "page_403";
	}

	@RequestMapping(value = "/uploadTest", method = RequestMethod.POST)
	//@PostMapping("/uploadTest") // //new annotation since 4.3
	public String uploadTest(@ModelAttribute("fileUploadddd") MultipartFile file, RedirectAttributes redirectAttributes) {

		//MultipartFile multipartFile = uploadedFile.getFile();
		//System.out.println(file.isEmpty() + " ________________________!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		return "redirect:project_template";
	}



	@RequestMapping(value = "/user_profile", method = RequestMethod.GET)
	public String profile(Model model, HttpServletRequest request) {
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getGlobalAdminLevel();

			int globalAdminLevel = 		PermissionTypes.getGlobalAdminLevel();
			int localAdminLevel = 		PermissionTypes.getLocalAdminLevel();
			int projectManagerLevel = 	PermissionTypes.getProjectManagerLevel();
			int contributeurLevel = 	PermissionTypes.getContributeurLevel();

			int userId= currentUser.getStaffId();
			model.addAttribute("getCurrentUserId", 			userId);

			System.out.println("****************************************");
			System.out.println(currentUser.toString() + " TOSTRING ");
			System.out.println(currentUser.getStaffId() +  " STAF ID ---------------------------------------------------");

			if ( currentUserPermission <= globalAdminLevel ) {
				model.addAttribute("listProjects", 					this.projectsService.listProjects());
			} else if (currentUserPermission <= localAdminLevel ) {
				model.addAttribute("listProjects", 					this.projectsService.listProjectsByCountry( currentUser.getCountry() ));
			} else if (currentUserPermission <= projectManagerLevel) {
				model.addAttribute("listProjects", 					this.projectsService.listProjectsByProjectManagerId( currentUser.getStaffId() ));
			} else {
				model.addAttribute("listProjects", 					this.projectsService.listProjectsByStaffId( currentUser.getStaffId() ));
			}

			model.addAttribute("listNotifications", 	this.notificationsService.getListReceivedNotificationsByStaffId(userId));

		} catch (NullPointerException e) {
			return "redirect:../";
		}

		//model.addAttribute("currentUser", currentUser.toString() );

		return userFiles + "user_profile";
	}

	// ckeditor ERROR CATCH
	@RequestMapping(value = "/saveTemplateFirst", method = RequestMethod.GET)
	public String saveTemplateFirst(Model model) {

		System.out.println("ENTREI AQUI   ");
		return utilsFiles + "page_notSaved";
	}


	//*	login-fail
	@RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
	public String unauthorized(Model model) {


		return userFiles + "login-fail";
	}

	// ckeditor
	@RequestMapping(value = "/ckeditor", method = RequestMethod.GET)
	public String ckeditor(Model model) {


		return utilsFiles + "ckeditor";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {

		return userFiles + "main";
	}

	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String main2(Model model) {

		return userFiles + "main2";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return userFiles + "index";
	}





}
