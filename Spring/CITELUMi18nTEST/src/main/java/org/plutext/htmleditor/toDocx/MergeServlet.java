package org.plutext.htmleditor.toDocx;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.plutext.htmleditor.Merge;

import ghh.citelum.model.Projects;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.ProjId;
import ghh.citelum.utils.WorkPath;


@WebServlet("/mergeServlet")
public class MergeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	WorkPath workPath = new WorkPath();	
	String path = WorkPath.getWorkPath();

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        final String projId = request.getParameter("id");

	        @SuppressWarnings("unchecked")
	        int idInt = Integer.parseInt(projId);
			
	        @SuppressWarnings("unchecked")
			LinkedHashMap<Projects, List<String>> projectsMap = (LinkedHashMap<Projects, List<String>>) request.getSession().getAttribute("projectsMap");
	        //final String merge = request.getParameter("down");
	        	        
	        LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
	        
	        currentUser.setCurrentProjectId(projId);

	        for (Projects project : projectsMap.keySet()) {
	        	if (project.getId() == idInt) {
	        		List<String> filesToMerge = projectsMap.get(project);
	        		
	        		currentUser.setFileNameListToMerge(filesToMerge);
	        	}
	        }
	        
//	    	currentUser.setFileNameListToMerge(test2);
	    	
           String referer = request.getHeader("Referer");
		   response.sendRedirect(referer);
	  }
}