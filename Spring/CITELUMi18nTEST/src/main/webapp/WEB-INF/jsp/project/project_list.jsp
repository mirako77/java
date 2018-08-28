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
        <%@ include file="../shared/top_navigation.jspf" %>
        <!-- /top navigation -->

        <!-- page content ============================================-->
<div class="right_col" role="main">
   <div class="page-title">
     <div class="title_left">
       <h3><i class="fa fa-edit"></i> Liste des Projets</h3>
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
       <i class="fa fa-edit"></i> Projets > Liste des Projets

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
                       <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Liste des projects</a>
                       </li>
                       <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Archivées</a>
                       </li>
                     </ul>
                     <div id="myTabContent" class="tab-content">
                       <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

							<!-- start project list -->
							<c:choose>
								<c:when test="${!empty listProjects}">
									<table class="table table-striped projects">
								  		<thead>
								    		<tr>
								      			<th style="width: 1%"></th>
												<th style="width: 20%">Nom du projet</th>
												<th>Membres de l'équipe</th>
												<th>L'avancement du projet</th>
												<th>Date de remise</th>
												<th style="width: 20%">Modifier</th>
								  			</tr>
										</thead>
										<c:forEach items="${projectsMap}" var="projects">
										<c:if test="${ !projects.key.project_archived }">
											<tbody>
												<tr>
											    	<td>${projects.key.id}</td>
													<td>
													  <a>${projects.key.title}</a><br/>
													</td>
													<td>
													  <ul class="list-inline">
													  	<c:forEach items="${projects.key.staffList}" var="person">
														 	<li>
														      <img src="${pageContext.request.contextPath}/images/staff/${person.picture_path}" class="avatar" alt="${person.name}" title="${person.name}">
														    </li>
														 </c:forEach>
													  </ul>
													</td>
													<td class="project_progress">
														<div class="progress progress_sm">
															<div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${projects.key.project_status}"></div>
														</div>
													<small>${projects.key.project_status}% Complete</small>
													</td>
													<td>
													  ${projects.key.deadline}
													</td>
													<td>
														
												  		<a href="project${projects.key.id}" class="btn btn-info" title="Modifier projet"><i class="fa fa-crosshairs "></i> <!-- -Edit --> </a>
													<!--     Check Logged user and his Permission -->
													<c:choose>
														<c:when test="${ currentSessionCredentials.permissionLevel <= projectManagerLevel}">
													      	<a href="delete_project=${projects.key.id}" class="btn btn-default deleteConfirmBox" title="Supprimer le projet"><i class="fa fa-trash"></i></a>
													      	<a href="archive_project=${projects.key.id}" class="btn archiveConfirmBox" title="Projet d'archive"><i class="fa fa-archive"></i> <!-- View  --></a>

														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
														<c:choose>
															<c:when test="${ projects.key.project_status == 100 }">
																<a class="btn btn-default merge" title="download project file" data-projectId="${projects.key.id}"><i class="fa fa-eye"></i></a>
	<%--															
																<a href="verify_project=${projects.key.id}"  class="btn btn-default merge" title="download project file"><i class="fa fa-eye"></i></a>
	--%>												
	<%-- 															<a href="merge_project=${projects.key.id}"  class="btn btn-default merge" title="download project file"><i class="fa fa-eye"></i></a> --%>
															</c:when>
															<c:otherwise>
																<a class="btn btn-default merge" disabled="disabled" title="Download not available because project is not 100% complete" data-projectId="${projects.key.id}"><i class="fa fa-eye"></i></a>
														</c:otherwise>
													</c:choose>
													<!--   END Check Logged user and his Permission -->
												    </td>
												</tr>
											</tbody>
											</c:if>
										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<br/><br/>
									<i>You have no active projects</i>
								</c:otherwise>
							</c:choose>
							
							<!--     Check Logged user and his Permission -->
							<c:choose>
								<c:when test="${ currentSessionCredentials.permissionLevel <= projectManagerLevel}">
								
									<br/>
									<a href="project_create" class="btn btn-info btn-xs" style="height: 30px; width: 180px; display:table-cell; vertical-align:middle; text-align:center; float: right; line-height: 25px;">
										<i class="fa fa-pencil" style="display:table-cell; vertical-align:middle; text-align:center; float: left; line-height: 25px;"></i> 
										Créer un nouveau projet 
									</a>
								
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<!--   END Check Logged user and his Permission -->
							
<!-- end project list -->

                       </div>
                       
<!-- start of second tab -->
                       
                       <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                         <!-- start user projects -->
                         <c:if test="${!empty listProjects}">
								<table class="table table-striped projects">
							  		<thead>
							    		<tr>
							      			<th style="width: 1%"></th>
											<th style="width: 20%">Nom du projet</th>
											<th>Membres de l'équipe</th>
											<th>L'avancement du projet</th>
											<th>Date de remise</th>
											<th style="width: 20%">Modifier</th>
							  			</tr>
									</thead>
									<c:forEach items="${projectsMap}" var="projects">
									<c:if test="${ projects.key.project_archived }">

										<tbody>
											<tr>
										    	<td>${projects.key.id}</td>
												<td>
												  <a>${projects.key.title}</a><br/>
												</td>
												<td>
												  <ul class="list-inline">
												    <c:forEach items="${projects.key.staffList}" var="person">
														 	<li>
														      <img src="${pageContext.request.contextPath}/images/staff/${person.picture_path}" class="avatar" alt="${person.name}" title="${person.name}">
														    </li>
														 </c:forEach>
												  </ul>
												</td>
												<td class="project_progress">
													<div class="progress progress_sm">
														<div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${projects.key.project_status}"></div>
													</div>
												<small>${projects.key.project_status}% Complete</small>
												</td>
												<td>
												  ${projects.key.deadline}
												</td>
												<td>
												
													<!--     Check Logged user and his Permission -->
													<c:choose>
														<c:when test="${ currentSessionCredentials.permissionLevel <= projectManagerLevel}">
													      	<a href="delete_project=${projects.key.id}" class="btn btn-default deleteConfirmBox" title="Supprimer le projet"><i class="fa fa-trash"></i></a>
													      	<a href="archive_project=${projects.key.id}" class="btn unarchiveConfirmBox" title="Projet désarchiver"><i class="fa fa-archive"></i> <!-- View  --></a>
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
											      	<a class="btn btn-default merge" title="download project file" data-projectId="${projects.key.id}"><i class="fa fa-eye"></i></a>
													<!--   END Check Logged user and his Permission -->
											    </td>
											</tr>
										</tbody>
										</c:if>
									</c:forEach>
								</table>
							</c:if><br/>
                         <!-- end user projects -->

                       </div>
<!-- end of second tab -->

                     </div>
                   </div>
<!-- /Tabs -->

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div hidden=true>
	<form id="secretMergeForm" action="../services/merge" method="POST">										
		<button type="button" class="btn btn-info merge">Merge and Preview Document</button>
	</form>
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
			
			$(".merge:not([disabled])").on("click", function () {
				var projectId = this.getAttribute("data-projectid");
//				var projectMergeList = this.getAttribute("data-projectMergeList");
				console.log(projectId);
				
				var information = {id: projectId};
	 			
	     		console.log(projectId);
	     		jQuery.ajax({
			    		url: '${pageContext.request.contextPath}/mergeServlet',
			    		type: "POST",
			    		data: information,
						success: function() { 
							console.log("123");
							
						} 
			    	});
	     		
	     		$("#secretMergeForm").submit();
				
			})
	
	
	</script>

  </body>
</html>