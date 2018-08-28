
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Citelum Proposals</title>

	<!-- jQuery core 3.2.1 -->    
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- Bootstrap -->
    <link href="../template/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../template/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../template/build/css/custom.css" rel="stylesheet">
    <link href="../../style/styles.css" rel="stylesheet">
    
    <!-- 2 load the theme CSS file -->
  	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/themes/default/style.min.css" />
    
<style>
      .icon {
        width: 40px;
        border-radius: 100%;
      }
</style>
</head>
<body class="nav-md">


<div class = "col-md-6" style="height: 100%; border-left: 1px solid lightgray">
<br/><br/><br/><br/><br/><br/><br/>								
	
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %> 
<%@ page import = "ghh.citelum.utils.ProjId" %> 
<%@ page import = "ghh.citelum.utils.WorkPath" %> 
<%

   File file ;
   int maxFileSize = 50000 * 1024;
   int maxMemSize = 50000 * 1024;
   ServletContext context = pageContext.getServletContext();
   /*
   String pathWar = "..\\webapps\\CitelumApp\\";

   String pathWorkspaceFrancisco = "C:\\Users\\Francisco\\Work\\1-Projectos\\Citelum Project HN git\\CITELUM\\CitelumApp\\WebContent\\";
   String pathWorkspaceAfonso = "C:\\Users\\Project 08\\workspace\\Git\\CITELUM\\CitelumApp\\WebContent\\";
   String pathWorkspaceAndre = "C:\\amelo\\GHH\\GHH Projects\\Citelum\\Citelum_GHNGit\\CitelumApp\\WebContent\\";
   WorkPath workPath = new WorkPath();
	*/
	String path = WorkPath.getWorkPath();
	
   ProjId proj = new ProjId();
   String projString = proj.getProjectId();
	
   //String filePath = pathWorkspaceAfonso + "folders\\template\\";
   String filePath = path + "template\\";
   

   // String filePath = context.getInitParameter("file-upload");
  
   // Verify the content type
   String contentType = request.getContentType();
  
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      
      try { 
    	  
         // Parse the request to get file items.
        // List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         //Iterator i = fileItems.iterator();

         /*
         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         */
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();

         while ( i.hasNext () ) {
	         //out.println(" START");
        	 FileItem fi = (FileItem)i.next();
        	 
        	 if ( !fi.isFormField () ) {
              // Get the uploaded file parameters
              String fieldName = fi.getFieldName();
              String fileName = fi.getName();
              
              

	          	if (fileName.endsWith(".docx")) {
	            	  
	           		String fileNameWithoutExtension = fileName.substring(0, fileName.length() - 5);
	           		request.setAttribute("name", fileNameWithoutExtension);
	           	   
	           		//out.println(fileNameWithoutExtension);
	           		
	           		file = new File( filePath + fileName) ;

	           		//out.println(file + " -");
	           	   
	           	    if( file.exists() ) {
	           	    	
	           	    	int count = 0;
	           	    	String tag = ".docx";

	           	    	do {
	           	    		++count;
		           	    	String overwriteName = fileNameWithoutExtension + " " + count + tag;
	 	  					File fileRenamed = new File( filePath + overwriteName) ;
	 	  					file.renameTo(fileRenamed);

	 	  					request.setAttribute("name", fileNameWithoutExtension + " " + count);
	
	 	  				}	while ( file.exists() );

	           	    }
	           	    
	           	 	fi.write( file );

	           	  }
        	 
        	 }
        	 //String fileName = fi.getName();
        	 
        	 //out.println(fileName + " HELLO");
         }
         
         
//          while ( i.hasNext () ) {
//             FileItem fi = (FileItem)i.next();
//             if ( !fi.isFormField () ) {
//                // Get the uploaded file parameters
//                String fieldName = fi.getFieldName();
//                String fileName = fi.getName();
               
//                out.println(fileName);	

//                if (fileName.endsWith(".docx")) {
//             	   String fileName1 = fileName.substring(0, fileName.length() - 5);
//             	   request.setAttribute("name", fileName1);
//             	 }
              
//                //request.setAttribute("id", projString);
               
//                boolean isInMemory = fi.isInMemory();
//                long sizeInBytes = fi.getSize();
            
//                // Write the file
//                if( fileName.lastIndexOf("\\") >= 0 ) {
//                   file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
//                   file.getParentFile().mkdirs();
//                } else {
//                   file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                  
//                   if( file.exists() ) {
                	  
// 	                int count = 0;
	                
// 	  					String newPath;
// 	  					String newFileRenamed;
// 	  					String fileRenamedString;
// 	  					int length;
	  					
// 	  				do {
// 	  					if ( count == 0 ) {
// 	  						fileRenamedString = file.getName();
// 	  						length = String.valueOf(count).length();
// 	  						out.println(length + " _________LENGTH 0");
// 	  						newFileRenamed = fileRenamedString.substring(0, fileRenamedString.length() - (length + 5) );
// 	  						newFileRenamed = fileRenamedString.substring(0, fileRenamedString.length() - (length + 5) );
	  						
// 	  						newPath = filePath + request.getAttribute("name") + " " + ++count + ".docx";
	  						
// 	  					} else {
	  						
// 	  						fileRenamedString = file.getName();
// 	  						length = String.valueOf(count).length();
// 	  						out.println(length + " _________LENGTH >0");
// 	  						newFileRenamed = fileRenamedString.substring(0, fileRenamedString.length() - (length + 4) );
// 	  						newPath = filePath + request.getAttribute("name") + " " + ++count + ".docx";
// 		                	request.setAttribute("name", newFileRenamed);
// 	  					}
	  					
// 	  					File fileRenamed = new File( newPath ) ;
	  					
	  					
// 	  					out.println(fileRenamed + "                             ----------------------------------------------");
	                	
// 	                	file.renameTo(fileRenamed);
	                	
// 	                	String newFileRenamed2 = fileRenamed.getName();
	                	
// 	                	request.setAttribute("name", newFileRenamed2);
	                	
// 	                	//String fileRenamedString = fileRenamed.getName();
	                	
// 	                	//String newFileRenamed = fileRenamedString.substring(0, fileRenamedString.length() - 5);
	                	
	                	
// 	                	/*
// 	                	file.renameTo(dest)
// 	  					filename = filename + " " + ++count;
// 	  					*/
	  					
	  					
// 	  				}	while ( file.exists() );
                	  
                	  
                	  
//                   }
                  
                  
                  
                  
//                   file.getParentFile().mkdirs();
//                }
//                fi.write( file ) ;
//                //out.println("Uploaded Filename: " + filePath + 
//                //fileName + "<br>");

//             }
//          }
         
         
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
%>						
<c:url var="addAction" value="/web/uploaded" ></c:url>	
	<form:form id="formid" class="form-horizontal form-label-left" action="${addAction}" method="POST" commandName="folders">

		<form:input type="hidden"  path="is_file" value="1"/>
		
		<form:input type="hidden" path="description" value="${name}"/>
		<form:input type="hidden"  path="parent" value="#"/>
		<form:input type="hidden"  path="path" value="${name}"/>
	</form:form>

		</div>
	</div>
</div>


                          <!--  =====================================  Right Column Ends here  =====================================  -->
						</div>     
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
        <!-- /page content -->  
        
        <!-- footer content -->
        <footer>
        	<div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
        
	</div>
</div>

    <!-- jQuery -->
    <script src="../template/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../template/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../template/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../template/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../template/build/js/custom.min.js"></script>
    
    <script src="../../scripts/template_manipulation.js"></script>
    <!-- 5 include the minified jstree source -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
  
    
	   	<script>

      $(document).ready(function() {
    	  
    	  $('#formid').submit();
          
      });
    	
    </script>
	    
  </body>
</html>