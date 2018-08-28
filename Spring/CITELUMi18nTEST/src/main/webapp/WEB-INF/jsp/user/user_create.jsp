<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Citelum Proposals</title>
<!--     Load CSS and scripts common to all pages -->
    <%@ include file="../shared/imports_head.jspf" %>
<!--     /Load CSS and scripts common to all pages -->

</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
<!-- 		Sidebar jspf -->
			<%@ include file="../shared/sidebar.jspf" %>

<!-- 		/Sidebar jspf -->
			<!-- top navigation -->
	        <%@ include file="../shared/top_navigation.jspf" %>
	        <!-- /top navigation -->



<!-- page content ========================================================= -->

<div class="right_col" role="main">
	<div class="page-title">
		<div class="title_left">
			<h3><i class="fa fa-users"></i> Créer un utilisateur: ${user.name}</h3>
		</div>
		<div class="title_right">
			<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"></div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">


				<i class="fa fa-users"></i> Utilisateurs > Créer 

				<div class="x_title">
					<div class="col-md-6">
						<h3 style="margin-left:20%;">Formulaire de création </h3>
					</div>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content"><br />
<%-- 					<c:url var="addAction" value="/web/edit_project=${getCurrentProjectId}" ></c:url> --%>

					<c:url var="addAction" value="/web/submit_form/user_add" ></c:url>
					<%@ include file="../shared/user_form.jspf"%>






				</div>
				</div>
				</div>
				</div>
				</div>



			<!-- /page content -->
			<!-- footer content -->
			<footer>
				<div class="pull-right">© 2017 Citelum</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

<!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>

<!--     /Load common scripts -->

<!--     Load page-specific scripts -->

	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>

	<!-- bootstrap-daterangepicker -->
	<script src="${pageContext.request.contextPath}/scripts/moment/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/datepicker/daterangepicker.js"></script>

	<!-- bootstrap-wysiwyg -->
	<script src="${pageContext.request.contextPath}/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/google-code-prettify/src/prettify.js"></script>

	<!-- jQuery Tags Input -->
	<script src="${pageContext.request.contextPath}/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>

	<!-- Autosize -->
	<script src="${pageContext.request.contextPath}/vendors/autosize/dist/autosize.min.js"></script>

	<!-- jQuery autocomplete -->
	<script src="${pageContext.request.contextPath}/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>

	<!-- Dropzone.js -->
	<script src="${pageContext.request.contextPath}/vendors/dropzone/dist/min/dropzone.min.js"></script>


</body>
</html>