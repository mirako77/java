package ghh.citelum.utils;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ghh.citelum.service.PermissionsService;

/**
 * Servlet implementation class FormValidation
 */
@WebServlet("/web/submit_form/*")
//@Path("/web/submit_form/{value}")
public class FormValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] invalidCharacters =  {"\\", "\"", ";", "<", ">", "/", "&", "#", "?", "=", "*", "[", "]", "{", "}", "')", "--"};
	private Object permissionsService;
//	private boolean titleEmpty;
//	private boolean descriptionEmpty;
//	private boolean titleValid;
//	private boolean descriptionValid;
//	private String title;
//	private String description;
//	private String deadline;
//	private String titleEmptyMessage;
//	private String titleInvalidMessageIntro;
//	private String invalidChars;
//	private String descriptionEmptyMessage;
//	private Object invalidDescriptionIntro;
//	private String formSuccessDestination;
//	private String formFailDestination;
//	private String id;
//	private boolean deadlineValid;
//	private String invalidDeadlineMessage;

	
	@Autowired(required=true)
	@Qualifier(value="permissionsService")
	public void setPermissionsService(PermissionsService ps){
		this.permissionsService = ps;
	}
	

	/**
     * @see HttpServlet#HttpServlet()
     */
    public FormValidation() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private boolean isStringValid(String inputString) {
    	if (stringContainsItemFromList(inputString, invalidCharacters)) {
    		return false;
//    	} else if (isStringEmpty(inputString)){
//    		return false;
    	} else {
    		return true;   		
    	}
    };
    
    private boolean isStringEmpty(String inputString) {
    	String trimmedInput = inputString.trim();
    	if (trimmedInput == null || trimmedInput.equals("")){
    		return true;
    	}
		return false;
    };
    
    private boolean isDeadlineValid (String deadline) {
    	boolean isDeadlineValid = false;
    	if (deadline.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")) {
//    		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//    		sdf.setLenient(false);
    		
    		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

    		try {
    			LocalDate inputDate = LocalDate.parse(deadline, formatter);
    			//if not valid, it will throw DateTimeParseException

    			// verify if deadline is not before current date
    			LocalDate currentDate = LocalDate.now();
    			isDeadlineValid = (inputDate.isAfter(currentDate) || inputDate.isEqual(currentDate));

    		} catch (DateTimeParseException e) {

    			isDeadlineValid = false;
    		}
    		
    	} else {
    		isDeadlineValid = false;
    		
    	}
    	
    	return isDeadlineValid;
    };
    
    private void validateProject (HttpServletRequest request, HttpServletResponse response, String actionRequest ) throws ServletException, IOException {
				// read projectform fields
    			String title = request.getParameter("title");
    			String description = request.getParameter("description");
    			String deadline = request.getParameter("deadline");
    			String id = request.getParameter("id");
    			String formSuccessDestination = null;
    			String formFailDestination = null;
    			
    			// set attributes with input values
    			request.setAttribute("inputProjectName", title);
    			request.setAttribute("inputProjectDescription", description);
    			request.setAttribute("id", id);
    			request.setAttribute("inputDeadline", deadline);
    			

				// check if command is add new project or edit existing
    			if (actionRequest.equals("project_add")) {
    				System.out.println("add detected");
    				formSuccessDestination = "/web/add_project";
    				formFailDestination = "../../web/project_create";
    				request.setAttribute("submitType", "newProject");
    			} else if (actionRequest.equals("project_edit")) {
    				System.out.println("edit detected");
    				formSuccessDestination = "/web/edit_project="+ id;
    				formFailDestination = "../../web/project" + id + "_edit";
    				request.setAttribute("submitType", "editProject");
    			} else {
    				System.out.println("nbone detected");
//    				doGet(request, response);
    			};
    		

    			
    			
    			boolean titleEmpty = true;
    			boolean descriptionEmpty = true;
    			
    			boolean titleValid = false;
    			boolean descriptionValid = false;
    			boolean deadlineValid = false;
    			
    			// set messages defaults
    			
//    			boolean validInput = true;
    			String invalidChars = String.join(" ", invalidCharacters);
//    			String newline = System.lineSeparator();
    			
    			
    			// Check if title is empty, invalid or valid and define error messages
    			if (isStringEmpty(title)) {
    				titleEmpty = true;
    				String titleEmptyMessage =  "You must enter a project title!";
    				request.setAttribute("titleEmptyMessage", titleEmptyMessage);
    			} else if (!isStringValid(title)) {
    				titleEmpty = false;
    				titleValid = false;
    				String titleInvalidMessageIntro = "The following characters are not valid:";
//    				request.setAttribute("inputTitle", title);
    				request.setAttribute("titleInvalidMessageIntro", titleInvalidMessageIntro);
    				request.setAttribute("invalidChars", invalidChars);
    			} else {
    				titleEmpty = false;
    				titleValid = true;
    			}
    			
    			// Check if description is empty, invalid or valid and define error messages
    			if (isStringEmpty(description)) {
    				descriptionEmpty = true;
    				String descriptionEmptyMessage = "You must enter a project description!";
    				request.setAttribute("descriptionEmptyMessage", descriptionEmptyMessage);
    			} else if (!isStringValid(description)) {
    				descriptionEmpty = false;
    				descriptionValid = false;
    				String invalidDescriptionIntro = "The following characters are not valid:";
//    				request.setAttribute("inputDescription", description);
    				request.setAttribute("invalidDescriptionIntro", invalidDescriptionIntro);
    				request.setAttribute("invalidChars", invalidChars);
    			} else {
    				descriptionEmpty = false;
    				descriptionValid = true;
    			};
    			
    			// Check if deadline is invalid or valid and define error messages
    			if (isDeadlineValid(deadline)) {
    				deadlineValid = true;
    			} else {
    				String invalidDeadlineMessage = "Deadline must be in dd-MM-yyyy format (23-11-2017) and after current day";
    				request.setAttribute("invalidDeadlineMessage", invalidDeadlineMessage);
    			}
    			
    			request.setAttribute("titleEmpty", titleEmpty);
    			request.setAttribute("descriptionEmpty", descriptionEmpty);
    			
    			if (titleValid && descriptionValid && deadlineValid) {
//    				request.getSession().setAttribute("project_name", title);
//    				request.getSession().setAttribute("project_description", description);
//    				request.getSession().setAttribute("deadline", deadline);
    				
    				RequestDispatcher rd = getServletContext().getRequestDispatcher(formSuccessDestination);
//    				response.sendRedirect(formSuccessDestination);
//    				response.sendRedirect("web/profile");
    				rd.forward(request, response);
    				
    				
    			} else {
//    				String location = response.encodeRedirectURL("../../web/profile");
//    				response.sendRedirect(location);
    				RequestDispatcher rd = request.getRequestDispatcher(formFailDestination);
    				rd.forward(request, response);
    				//			request.getRequestDispatcher("/web/project_create").forward(request, response);
    			}
    }
    
    
    
    
    private void validateUser (HttpServletRequest request, HttpServletResponse response, String actionRequest ) throws ServletException, IOException {
		// read projectform fields
		String userLogin = request.getParameter("login");
		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");
		String country = request.getParameter("country");
//		String permission = request.getParameter("formPermissions");
//		int permissionId = Integer.parseInt(permission);
		
		String userId = request.getParameter("id");
		String formSuccessDestination = null;
		String formFailDestination = null;
		
//		Permissions formPermissions = ((PermissionsService) this.permissionsService).getPermissionById(permissionId);
//		Permissions userPermissions = new Permissions();
//		
//		userPermissions.setId(permissionId);
		
		// set attributes with input values
		request.setAttribute("inputUserLogin", userLogin);
		request.setAttribute("inputUserName", userName);
		request.setAttribute("inputUserEmail", userEmail);
		request.setAttribute("inputCountry", country);
		request.setAttribute("id", userId);
//		request.setAttribute("inputPermissionId", permission);
//		request.setAttribute("inputPermissions", formPermissions);
		

		// check if command is add new project or edit existing
		if (actionRequest.equals("user_add")) {
			System.out.println("add detected");
			formSuccessDestination = "/web/add_user";
			formFailDestination = "../../web/user_create";
			request.setAttribute("submitType", "newStaff");
		} else if (actionRequest.equals("user_edit")) {
			System.out.println("edit detected");
			formSuccessDestination = "/web/edit_user="+ userId;
			formFailDestination = "../../web/user" + userId + "_edit";
			request.setAttribute("submitType", "editUser");
		} else {
			System.out.println("nbone detected");
//			doGet(request, response);
		};
	

		
		
		boolean userLoginEmpty = true;
		boolean userNameEmpty = true;
		boolean userEmailEmpty = true;
		boolean countryEmpty = true;
//		boolean permissionsEmpty = true;
		
		boolean userLoginValid = false;
		boolean userNameValid = false;
		boolean userEmailValid = false;
		boolean countryValid = false;
//		boolean permissionsValid = true;
		
		// set messages defaults
		
//		boolean validInput = true;
		String invalidChars = String.join(" ", invalidCharacters);
//		String newline = System.lineSeparator();
		
		// Check if login is empty, invalid or valid and define error messages
		if (isStringEmpty(userLogin)) {
			userLoginEmpty = true;
			String userLoginEmptyMessage =  "You must enter a login!";
			request.setAttribute("userLoginEmptyMessage", userLoginEmptyMessage);
		} else if (!isStringValid(userLogin)) {
			userLoginEmpty = false;
			userLoginValid = false;
			String userLoginInvalidMessageIntro = "The following characters are not valid:";
//					request.setAttribute("inputTitle", title);
			request.setAttribute("userLoginInvalidMessageIntro", userLoginInvalidMessageIntro);
			request.setAttribute("invalidChars", invalidChars);
		} else {
			userLoginEmpty = false;
			userLoginValid = true;
		}

		// Check if username is empty, invalid or valid and define error messages
		if (isStringEmpty(userName)) {
			userNameEmpty = true;
			String userNameEmptyMessage =  "You must enter a username!";
			request.setAttribute("usernameEmptyMessage", userNameEmptyMessage);
		} else if (!isStringValid(userName)) {
			userNameEmpty = false;
			userNameValid = false;
			String userNameInvalidMessageIntro = "The following characters are not valid:";
//			request.setAttribute("inputTitle", title);
			request.setAttribute("userNameInvalidMessageIntro", userNameInvalidMessageIntro);
			request.setAttribute("invalidChars", invalidChars);
		} else {
			userNameEmpty = false;
			userNameValid = true;
		}
		
		// Check if email is empty, invalid or valid and define error messages
		if (isStringEmpty(userEmail)) {
			userEmailEmpty = true;
			String userEmailEmptyMessage =  "You must enter a username!";
			request.setAttribute("userEmailEmptyMessage", userEmailEmptyMessage);
		} else if (!isStringValid(userEmail)) {
			userEmailEmpty = false;
			userEmailValid = false;
			String userEmailInvalidMessageIntro = "The following characters are not valid:";
//			request.setAttribute("inputTitle", title);
			request.setAttribute("userEmailInvalidMessageIntro", userEmailInvalidMessageIntro);
			request.setAttribute("invalidChars", invalidChars);
		} else {
			userEmailEmpty = false;
			userEmailValid = true;
		}
		
		// Check if country is empty, invalid or valid and define error messages
		if (isStringEmpty(country)) {
			countryEmpty = true;
			String countryEmptyMessage = "You must enter a country!";
			request.setAttribute("countryEmptyMessage", countryEmptyMessage);
		} else if (!isStringValid(country)) {
			countryEmpty = false;
			countryValid = false;
			String invalidCountryIntro = "The following characters are not valid:";
//			request.setAttribute("inputDescription", description);
			request.setAttribute("invalidCountryIntro", invalidCountryIntro);
			request.setAttribute("invalidChars", invalidChars);
		} else {
			countryEmpty = false;
			countryValid = true;
		};
		
/*		// Check if permissions is invalid or valid and define error messages
		if (isStringEmpty(permissions)) {
			permissionsEmpty = true;
			String permissionsEmptyMessage = "You must enter a permission!";
			request.setAttribute("permissionsEmptyMessage", permissionsEmptyMessage);
		} else if (!isStringValid(permissions)) {
			permissionsEmpty = false;
			permissionsValid = false;
			String invalidPermissionsIntro = "The following characters are not valid:";
//			request.setAttribute("inputDescription", description);
			request.setAttribute("invalidPermissionsIntro", invalidPermissionsIntro);
			request.setAttribute("invalidChars", invalidChars);
		} else {
			permissionsEmpty = false;
			permissionsValid = true;
		};
		
		*/
		request.setAttribute("userLoginEmpty", userLoginEmpty);
		request.setAttribute("userNameEmpty", userNameEmpty);
		request.setAttribute("countryEmpty", countryEmpty);
		
		if (userNameValid && countryValid && userLoginValid) {
			System.out.println("fomrValid! Let's GO!");
//			request.getSession().setAttribute("project_name", title);
//			request.getSession().setAttribute("project_description", description);
//			request.getSession().setAttribute("deadline", deadline);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(formSuccessDestination);
			//System.out.println("fomrValid! Let's GO!2");
//			response.sendRedirect(formSuccessDestination);
//			response.sendRedirect("web/profile");
			
			
/*			
			@SuppressWarnings("rawtypes")
			Enumeration headerNames = request.getHeaderNames();
			while(headerNames.hasMoreElements()) {
			  String headerName = (String)headerNames.nextElement();
			  System.out.println("Header Name - " + headerName + ", Value - " + request.getHeader(headerName));
			}
			
			Enumeration params = request.getParameterNames(); 
			while(params.hasMoreElements()){
			 String paramName = (String)params.nextElement();
			 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
			}
			*/
			
			rd.forward(request, response);
			
			
		} else {
//			String location = response.encodeRedirectURL("../../web/profile");
//			response.sendRedirect(location);
			System.out.println("fomr InValid! :(");
			RequestDispatcher rd = request.getRequestDispatcher(formFailDestination);
			rd.forward(request, response);
			//			request.getRequestDispatcher("/web/project_create").forward(request, response);
		}
}
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		response.sendRedirect(formDestination);
//		response.sendRedirect(response.encodeRedirectURL(request.getContextPath()+"/submit_form/add"));
//		System.out.println(request.getContextPath());
//		System.out.println(request.getServletPath());
//		getServletContext().getRequestDispatcher(formDestination).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String[] pathInfo = request.getPathInfo().split("/");
		String actionRequest = pathInfo[1];	//	project_add
		String[] actionInfo = actionRequest.split("_");
		String formType = actionInfo[0];
		String action = actionInfo[1];
		
//		System.out.println(actionRequest);
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getContextPath());
//		for (int i = 0; i < pathInfo.length; i++) {
//            System.out.println(pathInfo[i]);
//            System.out.println(request.getPathInfo());
//		}
//		
		if (formType.equals("project")) {
			validateProject(request, response, actionRequest);
		} else if (formType.equals("user")) {
			validateUser(request, response, actionRequest);
		}
	
		
/*****		WORKS 2017-07-31 11:16	******/
//		if (isStringValid(title)
//				&& isStringValid(description)) {
//			request.getSession().setAttribute("project_name", title);
//			request.getSession().setAttribute("project_description", description);
//			request.getSession().setAttribute("deadline", deadline);
//			
//			String destination = "/web/add_project";
//			
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
//			rd.forward(request, response);
//		} else if (isStringEmpty(title) || isStringEmpty(description)) {
//			request.setAttribute("titleEmpty", "You must enter a project title");
//			request.setAttribute("descriptionEmpty", "You must enter a project description");
//		};
//			
//			request.setAttribute("message", "The following characters are not valid: " + str);
//			request.setAttribute("invalidTitle", title);
//			request.setAttribute("invalidDescription", "Your description: " + description);
//			request.getRequestDispatcher("/web/project_create").forward(request, response);

/*****		/WORKS 2017-07-31 11:16	******/		
		//doGet(request, response);
	}
	
	public static boolean stringContainsItemFromList(String inputStr, String[] items) {
	   // return Arrays.stream(items).parallel().anyMatch(inputStr::contains);
		for(int i =0; i < items.length; i++)
	    {
	        if(inputStr.contains(items[i]))
	        {
	            return true;
	        }
	    }
	    return false;
	}

}
