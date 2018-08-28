<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	<style>
	
		.btn-info {
			/*background: #2a3f54;*/
			margin-bottom: 5px !important;*/
		}
		
	</style>
	

  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@ include file="../shared/sidebar.jspf" %>
        
        <!-- top navigation -->
        <div class="top_nav">


          <div class="nav_menu" style="height: auto">
<h1 style="text-align: center">Citelum Proposals</h1>
          </div>

        </div>
        <!-- /top navigation -->

        <!-- page content ============================================-->
<div class="right_col" role="main">
   <div class="page-title">
     <div class="title_left">
       <h3>Liste des base documentaires</h3>
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
       <i class="fa fa-folder"></i><a href="profile">Tableau de bord</a>
       <div class="ln_solid"></div>
         <div class="x_title">
           <h2>Actif</h2>
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
          

<!-- Tabs -->
		<div class="" role="tabpanel" data-example-id="togglable-tabs">
                     <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                       <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Liste des base documentaires</a>
                       </li>
                     </ul>
                     <div id="myTabContent" class="tab-content">
                       <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

<!-- start project list -->
														
							
							<c:if test="${!empty listTemplate}">
								<table class="table table-striped projects">
							  		<thead>
							    		<tr>
							      			<th style="width: 1%"></th>
											<th style="width: 50%">Nom </th>
											<th style="width: 25%">country</th>
											<th style="width: 25%">Modifier</th>
							  			</tr>
									</thead>
									<c:forEach items="${listTemplate}" var="template">
									
										<tbody>
											<tr>
										    	<td>${template.id}</td>
												<td>
												  <a>${template.template_name}</a><br/>
												</td>
												<td>
												  ${template.country}
												</td>
												<td>
											  		<a href="project_template" class="btn btn-info" title="Access Template"><i class="fa fa-crosshairs "></i> <!-- -Edit --> </a>
											      	<a href="delete_template=${template.id}" class="btn btn-default deleteConfirmBox" title="Supprimer Template"><i class="fa fa-trash"></i></a>
											    </td>
											</tr>
										</tbody>
										
									</c:forEach>
								</table>
							</c:if><br/>
							<a href="template_create" class="btn btn-info btn-xs" style="height: 30px; width: 180px; display:table-cell; vertical-align:middle; text-align:center; float: right; line-height: 25px;">
								<i class="fa fa-pencil" style="display:table-cell; vertical-align:middle; text-align:center; float: left; line-height: 25px;"></i> 
								Create new Template
							</a>
<!-- end project list -->

                       </div>
                     </div>
                   </div>
<!-- /Tabs -->

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


	<script>
	
	console.log( "${sessionTest}" + " projectList" )

			
			$('.deleteConfirmBox').confirmModal({
				confirmTitle     : 'Supprimer le projet',
				confirmMessage   : 'Êtes-vous sûr de vouloir supprimer le projet sélectionné?',
				confirmOk        : 'Oui',
				confirmCancel    : 'Non',
				confirmDirection : 'aaaaaaaaaaaaaaaaaaaaaaaaa',
				// confirm style has already btn- before    --> btn-#confirmStyle#
				confirmStyle     : 'info',
				/*confirmCallback  : "k",*/
				confirmDismiss   : true,
				confirmAutoOpen  : false
			});
			
			$('.archiveConfirmBox').confirmModal({
				confirmTitle     : "Projet d'archive",
				confirmMessage   : 'Êtes-vous sûr de vouloir archiver le projet sélectionné?',
				confirmOk        : 'Oui',
				confirmCancel    : 'Non',
				confirmDirection : 'aaaaaaaaaaaaaaaaaaaaaaaaa',
				// confirm style has already btn- before    --> btn-#confirmStyle#
				confirmStyle     : 'info',
				/*confirmCallback  : "k",*/
				confirmDismiss   : true,
				confirmAutoOpen  : false
			});
			
			$('.unarchiveConfirmBox').confirmModal({
				confirmTitle     : "Projet désarchiver",
				confirmMessage   : 'Êtes-vous sûr de vouloir désarchiver le projet sélectionné?',
				confirmOk        : 'Oui',
				confirmCancel    : 'Non',
				confirmDirection : 'aaaaaaaaaaaaaaaaaaaaaaaaa',
				// confirm style has already btn- before    --> btn-#confirmStyle#
				confirmStyle     : 'info',
				/*confirmCallback  : "k",*/
				confirmDismiss   : true,
				confirmAutoOpen  : false
			});
			
			
	
	
	</script>

  </body>
</html>