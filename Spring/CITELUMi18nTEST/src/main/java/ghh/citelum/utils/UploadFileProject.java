package ghh.citelum.utils;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadFileProject
 */
@WebServlet("/web/uploadFileProject/*")
public class UploadFileProject extends HttpServlet {
	
	private final String UPLOAD_DIRECTORY = "C:\\Citelum\\";
	private static final long serialVersionUID = 1L;
	WorkPath workPath = new WorkPath();	
	private String rootPath = WorkPath.getWorkPath();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFileProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
			@SuppressWarnings("rawtypes")
			Enumeration headerNames = request.getHeaderNames();
			while(headerNames.hasMoreElements()) {
			  String headerName = (String)headerNames.nextElement();
			}
			
			Enumeration params = request.getSession().getAttributeNames();
			while(params.hasMoreElements()){
			 String paramName = (String)params.nextElement();
			}
		
			int projId = (int) request.getSession().getAttribute("sessionProjectId");
			
	        //process only if its multipart content
	        if(ServletFileUpload.isMultipartContent(request)){
	            try {
	                List<FileItem> multiparts = new ServletFileUpload(
	                      new DiskFileItemFactory()).parseRequest(request);
	                
	                String filePath = rootPath + "\\folders\\" +  projId + "\\";
	                		
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        String name = new File(item.getName()).getName();
	                        String fileNameWithoutExtension = item.getName().substring(0, item.getName().length() - 5);
	                        request.getSession().setAttribute("uploadFileName", fileNameWithoutExtension);
	                        item.write(
	                          new File(/*UPLOAD_DIRECTORY*/ filePath /*+ File.separator*/ + name));
	                    }
	                }

	               //File uploaded successfully
	               request.setAttribute("message", "File Uploaded Successfully");
	            } catch (Exception ex) {
	               request.setAttribute("message", "File Upload Failed due to " + ex);
	            }

	        }else{
	            request.setAttribute("message",
	                   "Sorry this Servlet only handles file upload request");
	        }

	        //request.getRequestDispatcher("/result.jsp").forward(request, response);
	        //request.getRequestDispatcher("/../../web/project15_preview").forward(request, response);
	        
	        response.sendRedirect("../../web/project" + projId + "_uploadDocument");
	        
	        /*
			RequestDispatcher rd = request.getRequestDispatcher("../../web/project15_preview");
			rd.forward(request, response);
	        */
			
	
	}

}
