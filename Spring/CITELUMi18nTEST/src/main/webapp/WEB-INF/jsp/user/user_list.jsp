<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "UTF-8">
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
       <h3><i class="fa fa-users"></i> Liste des Utilisateurs</h3>
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
       <i class="fa fa-users"></i> Utilisateurs > Liste des utilisateurs

       <div class="ln_solid"></div>
         <div class="x_title">
<!--            <h2>Actif</h2> -->
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
                       <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Liste des Utilisateurs</a>
                       </li>
                     </ul>
                     <div id="myTabContent" class="tab-content">
                       <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

<!-- start user list -->

							<c:choose>
								<c:when test="${!empty listPersons}">
									<table class="table table-striped projects">
								  		<thead>
								    		<tr>
								      			<th class = "col-xs-1">Identifiant</th>
												<th class = "col-xs-2">Login</th>
												<th class = "col-xs-2">Nom</th>
												<th class = "col-xs-1">Avatar</th>
												<th class = "col-xs-1">Email</th>
												<th class = "col-xs-2">Description</th>
												<th class = "col-xs-2">Pays</th>
												<th class = "col-xs-1">Action</th>
								  			</tr>
										</thead>
																												
										<c:forEach items="${listPersonsMap}" var="person">
<%-- 										<c:if test="${ !projects.project_archived }"> --%>
											<tbody>
												<tr>
											    	<td>${person.key.id}</td>
													<td>
													  <a>${person.key.login}</a><br/>
													</td>
													<td>
													  <a>${person.key.name}</a><br/>
													</td>
													<td>
<!-- 													  <ul class="list-inline"> -->
<!-- 													    <div> -->
													      <img src="${pageContext.request.contextPath}/images/staff/${person.key.picture_path}" class="avatar" alt="Avatar">
<!-- 													    </div> -->
<!-- 													  </ul> -->
													</td>
													<td>
													  <a>${person.key.email}</a><br/>
													</td>
													<td >
														${person.key.permissions.description}
													</td>
													<td>
													  ${person.key.country}
													</td>
													<td>
													<c:if test="${person.key.permissions.id >= currentSessionCredentials.permission.id && currentSessionCredentials.permission.id <= 2}">
												  		<a href="user${person.key.id}_edit" class="btn btn-info" title="Modifier utilisateur"><i class="fa fa-crosshairs "></i> <!-- -Edit --> </a>
													</c:if>
													<!--     Check Logged user and his Permission -->
													<c:if test="${currentSessionCredentials.permissionLevel <= globalAdminLevel}">
														<c:choose>
															<c:when test="${person.value == 0 && person.key.id != currentSessionCredentials.staff.id}">
													      		<a href="delete_user=${person.key.id}" class="btn btn-default deleteConfirmBox" title="Supprimer un utilisateur"><i class="fa fa-trash"></i></a>
															</c:when>
															<c:when test="${person.key.id == currentSessionCredentials.staff.id}">
													      		<a href="#" class="btn btn-default deleteConfirmBox" title="
Vous ne pouvez pas vous supprimer!" disabled="disabled"><i class="fa fa-trash"></i></a>
															</c:when>
															<c:otherwise>
																<a href="#" class="btn btn-default deleteConfirmBox" title="Cet utilisateur est affecté à ${person.value} tâche(s) inachevée(s)" disabled="disabled"><i class="fa fa-trash"></i></a>
															</c:otherwise>
														</c:choose>
													</c:if>
													<!--   END Check Logged user and his Permission -->
												    </td>
												</tr>
											</tbody>
<%-- 											</c:if> --%>
										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<br/><br/>
									<i>Vous n'avez pas de projet actif</i>
								</c:otherwise>
							</c:choose>

							<!--     Check Logged user and his Permission -->
							<c:choose>
								<c:when test="${ currentSessionCredentials.permissionLevel <= localAdminLevel}">

									<br/>
									<a href="user_create" class="btn btn-info btn-xs" style="height: 30px; width: 180px; display:table-cell; vertical-align:middle; text-align:center; float: right; line-height: 25px;">
										<i class="fa fa-pencil" style="display:table-cell; vertical-align:middle; text-align:center; float: left; line-height: 25px;"></i>
										Créer un nouvel utilisateur
									</a>

								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<!--   END Check Logged user and his Permission -->

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
 			
			$('.deleteConfirmBox:not([disabled])').confirmModal({
				confirmTitle     : 'Supprimer un utilisateur',
				confirmMessage   : 'Êtes-vous sûr de vouloir supprimer cet utilisateur ?',
				confirmOk        : 'Oui',
				confirmCancel    : 'Non',
				confirmDirection : 'aaaaaaaaaaaaaaaaaaaaaaaaa',
				// confirm style has already btn- before    --> btn-#confirmStyle#
				confirmStyle     : 'info',
//				confirmCallback  : "k",
				confirmDismiss   : true,
				confirmAutoOpen  : false
			});
			 
			 
/* 			
			$('.deleteConfirmBox').click(function (data) {
				data.preventDefault();
//				data.stopPropagation();
				console.log($(this))
				$(this)[0].confirmModal({
					confirmTitle     : 'Supprimer un utilisateur',
					confirmOk        : 'Oui',
					confirmCancel    : 'Non',
					confirmStyle     : 'info',
					confirmDismiss   : true,
					confirmAutoOpen  : false
					});
			
				console.log($('.deleteConfirmBox').confirmModal());			
			})
			 */

	</script>

</body>
</html>