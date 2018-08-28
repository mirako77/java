package org.plutext.htmleditor;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import ghh.citelum.utils.ChapterValue;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.ProjId;
import ghh.citelum.utils.WorkPath;

@WebServlet("/loaded")
public class Servlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//jsTestValue
		
		String path = WorkPath.getWorkPath();
		String currentPage = request.getParameter("currentPage");
		LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
		
		if ( currentPage.equals("templates") ) {
			
			final String folderPath = request.getParameter("folderPath");    //projId
			final String filePath = request.getParameter("filePath");		//projFolderPath
			
			final String totalFileOpenedPath = path + folderPath + "\\" + filePath + ".docx";
			
			currentUser.setProjFolderPath(totalFileOpenedPath);
			
			System.out.println( totalFileOpenedPath + " totalFileOpenedPath *-*-*-*--*--*-*-*--*" );

		}
		
		if ( currentPage.equals("projects") ) {
			
			final String folderPath = request.getParameter("folderPath");    //projId
			final String filePath = request.getParameter("filePath");		//projFolderPath
			
			final int projFolderID = Integer.parseInt(request.getParameter("PFolderID"));

			final String totalFileOpenedPath = path + folderPath + "\\" + filePath + ".docx";
			
			currentUser.setProjectFoldersId(projFolderID);
			currentUser.setProjFolderPath(totalFileOpenedPath);
			
			
			System.out.println( totalFileOpenedPath + " totalFileOpenedPath *-*-*-*--*--*-*-*--*" );
			
		}
		
		
		request.getSession().setAttribute("currentSessionCredentials", currentUser);
		
		


		ProjId proj = new ProjId();
		//proj.setProjectId(projId);


		// String load2 = request.getParameter("value");
		/*
		String pathWar = "..\\webapps\\CitelumApp\\";

	    String pathWorkspaceFrancisco = "C:\\Users\\Francisco\\Work\\1-Projectos\\Citelum Project HN git\\CITELUM\\CitelumApp\\WebContent\\";
	    String pathWorkspaceAfonso = "C:\\Users\\Project 08\\workspace\\Git\\CITELUM\\CitelumApp\\WebContent\\";
	    String pathWorkspaceAndre = "C:\\amelo\\GHH\\GHH Projects\\Citelum\\Citelum_GHNGit\\CitelumApp\\WebContent\\";

	    System.out.println(load);
		 */
		//System.out.println(load2);

		// gets the selected value from the project file list and prints it to a json file
		// the json will be read by Load.java and used to open the correct template.docx
		/*
		JSONObject writeMe = new JSONObject();
	    	    writeMe.put("load", load);
		 */

/*

		try {
			//Writing File
			// pathWar
			// pathWorkspace


			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================
			//FileWriter file= new FileWriter(pathWorkspaceFrancisco + "views\\selectedLoad.txt");
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================





			//System.out.println(load);
			request.setAttribute("message", projFolderID);
			//request.getRequestDispatcher("views/ckeditor.jsp").forward(request, response);
			//request.getRequestDispatcher("web/project_detail").forward(request, response);


			//response.sendRedirect("web/project_detail");

			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);

		}
		catch (IOException e) {
			e.printStackTrace();
		}
*/
	}

}
