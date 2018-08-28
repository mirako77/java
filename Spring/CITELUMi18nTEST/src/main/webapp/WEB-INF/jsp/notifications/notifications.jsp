<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<html lang="en">
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Citelum Proposals</title>

    <!--     Load CSS and scripts common to all pages -->
    <%@ include file="../shared/imports_head.jspf" %>
    
    
<!--     Load page specific scripts and css  -->
  </head>

  <body class="nav-md">
  
  


  

             
    <div class="container body">
      <div class="main_container">
        <%@ include file="../shared/sidebar.jspf" %>
        
        <!-- top navigation -->
        <%@ include file="../shared/top_navigation.jspf" %>
        <!-- /top navigation -->





        <!-- page content ============================================-->
<div class="right_col" role="main">
   <div class="page-title">
     <div class="title_left">
       <h3><i class="fa fa-envelope-o"></i> Notifications</h3>
 
       <br>
     </div>
     <div class="title_right">
       <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
         
       </div>
     </div>
   </div>
   
   <div class="clearfix"></div>

   <div class="row">
     <div class="col-md-12">
       <div class="x_panel">
       <i class="fa fa-envelope-o"></i> Notifications
       <div class="ln_solid"></div>
         <div class="x_title">
           <h2>S'il n'y a pas de messages, créez d'abord un nouveau projet et continuez jusqu'à ce que vous ayez effectivement assigné des fichiers à cet utilisateur</h2>
           <ul class="nav navbar-right panel_toolbox">
             <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
             </li>
             <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
               <ul class="dropdown-menu" role="menu">
                 <li><a href="#">Settings 1</a>
                 </li>
                 <li><a href="#">Settings 2</a>
                 </li>
               </ul>
             </li>
             <li><a class="close-link"><i class="fa fa-close"></i></a>
             </li>
           </ul>
           <div class="clearfix"></div>
         </div>
         <div class="x_content">
         
         
         
         
         


         
         
     
         
          

            <!-- start project list -->


	<table class="table table-striped projects">
  		<thead>
    		<tr>
      			<th style="width: 10%"></th>
				<th style="width: 70%">Message</th>
				<th style="width: 10%">Message Envoyée Par</th>
				<th style="width: 5%">Effacer</th>
  			</tr>
		</thead>
			
		<c:forEach items="${listNotifications}" var="notifications">
			<tbody>
				<tr>
					<td></td>
					<td>
					  <a>${notifications.notifications}</a><br/>
					</td>
					<td>
					${notifications.staff_sender.name}
					</td>
					<td>
				      	<a href="delete_notifications=${notifications.id}"  class="btn btn-default"><i class="fa fa-trash"></i></a>
				      	
				    </td>
				  
				</tr>
			</tbody>
		</c:forEach>
	</table>
<br/>

<!-- end project list -->


          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">© 2017 Citelum
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>

 <!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>
    
    
<!--     Load page-specific scripts -->
  
  </body>
</html>