/*
    This file is part of docx-html-editor.

	docx-html-editor is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package org.plutext.htmleditor;

import java.io.IOException;
import java.io.InputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.Response.Status;

import org.apache.http.impl.client.RedirectLocations;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.io.LoadFromZipNG;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import ghh.citelum.utils.ChapterValue;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.ProjId;
import ghh.citelum.utils.WorkPath;

@Path("/load")
public class Load {

	WorkPath workPath = new WorkPath();
	
	String path = WorkPath.getWorkPath();
	
		ChapterValue chapVal = new ChapterValue();
		String chapValString = chapVal.getChapterValue();
		
		ProjId proj = new ProjId();
		String projString = proj.getProjectId();
		
		
		//==============================================================================    CHANGE PATH HERE ==================================
		//==============================================================================    CHANGE PATH HERE ==================================
		//==============================================================================    CHANGE PATH HERE ==================================

		//String loadPath = path + projString + "\\" + chapValString + ".docx";	  + HEAD

		//==============================================================================    CHANGE PATH HERE ==================================
		//==============================================================================    CHANGE PATH HERE ==================================
		//==============================================================================    CHANGE PATH HERE ==================================
		

	private static final Logger jul = Logger.getLogger(Load.class
			.getName());

	//		static {
	//			jul.info("Servlet loaded");
	//			
	//			Logger.getLogger("com.sun.jersey").setLevel(Level.FINEST);
	//			Logger.getLogger("org.glassfish.jersey").setLevel(Level.FINEST);
	//		}	
	
	@SuppressWarnings("deprecation")
	@POST
	//	@Consumes("multipart/form-data")
	@Produces( {"application/vnd.openxmlformats-officedocument.wordprocessingml.document" , 
	"text/html"})
	public Response processForm(
			@Context  HttpServletRequest request,
			@Context  HttpServletResponse response,
			@Context ServletContext servletContext, 
			@FormDataParam("docxfile") InputStream docxInputStream,
			@FormDataParam("docxfile") FormDataContentDisposition docxFileDetail,
			@FormDataParam("adv") String editorHtml
			) throws Docx4JException, IOException {

		try {

			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			String openFilePath = currentUser.getProjFolderPath();
		
			HttpSession session = request.getSession(true);
			final WordprocessingMLPackage wordMLPackage;
			WordprocessingMLPackage tmpPkg;

			LoadFromZipNG loader = new LoadFromZipNG();

			//JSONParser parser = new JSONParser();

			// pathWar webapps\CitelumApp\
			// String pathWorkspace = "C:\\Users\\Project 08\\workspace\\Git\\CITELUM\\CitelumApp\\WebContent\\";

			// reads the selected file
			String loadPath = openFilePath;
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================
			//Object obj = parser.parse(new FileReader(pathWar + "views\\selectedLoad.txt"));
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================
			//==============================================================================    CHANGE PATH HERE ==================================


			//Object obj = parser.parse(new FileReader(pathWorkspace + "views\\selectedLoad.txt"));

			//JSONObject jsonObject = (JSONObject) obj;

			//String name = (String) jsonObject.get("load");
			//System.out.println(name);

			// Path the Template folder - only missing the selected file name

			tmpPkg = (WordprocessingMLPackage)loader.get(loadPath);


			wordMLPackage = tmpPkg;
			// Store the docx, so we can later inject XHTML into it...
			session.setAttribute("docx", wordMLPackage);

			Editor editor = new Editor();
			Editor.setContextPath(servletContext.getContextPath());

			ResponseBuilder builder;
			if (editorHtml!=null && editorHtml.equals("bare") && chapValString!=null) {
				builder = editor.streamDocxAsHtml(wordMLPackage, session, EditorHTML.BARE, response);
			} else {
				builder = editor.streamDocxAsHtml(wordMLPackage, session, EditorHTML.CKEditor3, response);
			}
			return builder.build();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			response.sendRedirect("../web/saveTemplateFirst");
			throw new WebApplicationException(
					new Docx4JException(e.getMessage(), e), 
					Status.INTERNAL_SERVER_ERROR);

		}   

	}

	/**
	 * header sample
	 * {
	 * 	Content-Type=[image/png], 
	 * 	Content-Disposition=[form-data; name="file"; filename="filename.extension"]
	 * }
	 **/
	private String getFileName(String name) {

		String finalFileName = name.trim().replaceAll("\"", "");

		if (finalFileName.lastIndexOf(".")==-1) {
			return finalFileName;
		} else {
			return finalFileName.substring(0, finalFileName.lastIndexOf(".") ); 
		}
	}	

}