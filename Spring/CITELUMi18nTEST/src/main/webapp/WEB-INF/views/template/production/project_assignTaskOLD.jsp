<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link href="../template/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../template/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../template/build/css/custom.css" rel="stylesheet">
<link href="../../style/styles.css" rel="stylesheet">

<!-- 2 load the theme CSS file -->
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/themes/default/style.min.css" />


<style>
.icon {
	width: 40px;
	border-radius: 100%;
}

.activeStaff {
	background: #989898 !important;
	border-color: #989898 !important;
}

.NextPage {
	margin-right: -45px;
	float: right;
}
</style>
</head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div id="collapsable_sidebar" class = "collapse in">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0; height: auto">
              <a href="#" class="site_title" style="height: auto;padding: 5px;width: auto;" id="citelum_logo_sidebar"><img src="${pageContext.request.contextPath}/pictures/logo.png" style="max-height:60px; background-color: #ECF0F1; padding: 5px;width: 150px" title="Citelum"></a>
              <div class="nav toggle" style="float: right">
                <a id="menu_toggle" style="color: #ECF0F1"><i class="fa fa-bars"></i></a>
              </div>
            </div>

           <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile" style="height: 80px;">
              <div class="profile_pic">
                <img src="../../pictures/user.jpg" alt="..." class="img-circle profile_img" style="height:44px; width:44px;">
              </div>
              <div class="profile_info">
                <h2>Michel Henaff</h2>
                <span>Project Leader</span>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
<!--
                <h3>General</h3>
-->
                
                <ul class="nav side-menu">
                  <li><a href="profile"><i class="fa fa-home"></i>Tableau de bord</a>
<!--
                    <ul class="nav child_menu">
                      <li><a href="#">Dashboard</a></li>
                      <li><a href="#">Dashboard2</a></li>
                      <li><a href="#">Dashboard3</a></li>
                    </ul>
-->

                  </li>
                  <li><a><i class="fa fa-edit"></i>Projets<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="project_list">Liste des projets</a></li>
                      <li><a href="project_create">Créer un projet</a></li>  
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i>  Librairie des contenus<span class="fa fa-chevron-down"></span></a>
                  	<ul class="nav child_menu">
                      <li><a href="upload">Base documentaire</a></li>     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i>  Notifications<span class="fa fa-chevron-down"></span></a>
                  	<ul class="nav child_menu">
                      <li><a href="notification1">User 1 (6 Messages)</a></li> 
                      <li><a href="notification2">User 2 (4 Messages)</a></li>     
                    </ul>
                  </li>              

<!--
                    <ul class="nav child_menu">
                      <li><a href="#">General Elements</a></li>
                      <li><a href="#">Media Gallery</a></li>
                      <li><a href="typography.html">Typography</a></li>
                      <li><a href="icons.html">Icons</a></li>
                      <li><a href="glyphicons.html">Glyphicons</a></li>
                      <li><a href="widgets.html">Widgets</a></li>
                      <li><a href="invoice.html">Invoice</a></li>
                      <li><a href="inbox.html">Inbox</a></li>
                      <li><a href="calendar.html">Calendar</a></li>
                    </ul>
-->
                  </li>
                </ul>
              </div>


            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->


            <!-- /menu footer buttons -->
          </div>
        </div>
</div>
        <!-- top navigation -->
        <div class="top_nav">


          <div class="nav_menu" style="height: auto">
<h1 style="text-align: center">Citelum Proposals</h1>


          </div>


        </div>
        <!-- /top navigation -->






			<!-- page content ============================================-->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Projet : ${selectProjectById.title}</h3>
						</div>

						<!--               <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div> -->
					</div>


					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12" style="height: 100%">
							<div class="x_panel">
								<div class="x_title">
<i class="fa fa-folder"></i><a href="profile" style="font-weight: bold;"> Tableau de bord</a> > <a href="project_list" style="font-weight: bold;">Liste des projets</a> > Assign Colaborators
							
				 <div class="ln_solid"></div>
									<span> 
									<a href="project${getCurrentProjectId}_edit" title="Edit Project"><img src="../template/production/images/img/info.PNG" class="icon"/></a>
									<!-- <img src="../template/production/images/img/chat.PNG" class="icon"/> -->
									<!-- <img src="../template/production/images/img/attach.PNG" class="icon"/> -->
									<a href="project${getCurrentProjectId}_preview" title="Edit Library"><img src="../template/production/images/img/flow-tree.PNG" class="icon" /></a>
									<a href="project${getCurrentProjectId}_assignTask" title="Assign Colaborators"><img src="../template/production/images/img/users.PNG" class="icon"/></a>
									<a href="project${getCurrentProjectId}" title="Open Files"><img src="../template/production/images/img/document.PNG" class="icon"/></a>
									<!-- <img src="../template/production/images/img/export.PNG" class="icon"/> -->
									<!-- <img src="../template/production/images/img/lock.PNG" class="icon"/> -->
									<!-- <img src="../template/production/images/img/lock-open.PNG" class="icon"/> -->

									</span>


									</ul>

									<br> <br>
									<div class="col-md-6">
										<h3>Base Documentaire</h3>
									</div>
									<div class="col-md-6">
										<h3>Projet en Cours</h3>
									</div>
									<div class="clearfix"></div>

								</div>

								<div class="container-fluid" style="height: 70%">
									<div class="row">
										<div class="col-md-4"
											style="border: 1px solid #ebebeb; padding: 20px;">
											<br />
											<div>
												<div class="list-group">
													<c:forEach var="staff" items="${listStaff}"
														varStatus="staffStatus">
														<a href="#" class="list-group-item listNames staffList"
															" id="${staff.id}"><img
															src="../template/production/images/staff/${staff.picture_path}"
															class="icon" /><span style="margin-left: 20px;">${staff.name}</span></a>
													</c:forEach>
												</div>

											</div>
										</div>

										<!--  =====================================  Right Column Starts here  =====================================  -->

										<div class="col-md-8">
											<br /> <br />
											<div id="detailframe"
												class="col-xs-12 col-lg-8 documentFrame">
												<iframe name="frame" class="frame"
													src="../../views/content/project${getCurrentProjectId}_jstree/${getCurrentProjectId}"
													style="width: 100%; height: 80%; min-height: 500px;"
													width="100%" height="1000px" frameborder="0"></iframe>
											</div>
											
											

										</div>

										<!--  =====================================  Right Column Ends here  =====================================  -->


										<div class="col-md-12" style="background: none;">
												<hr>
											<div class="col-md-7" style="background: none;"></div>
											
											<div class="col-md-2" style="background: none;">
							 					<button class="LIST">TEST LIST - THIS IF FOR TESTING THE MESSAGE SYSTEM ONLY</button> 		
												<button class="NextPage">Done</button>											
											</div>
											<div class="col-md-1" style="background: none;">
																						
											</div>
										</div>
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
				<div class="pull-right">� 2017 Citelum</div>
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
	<script
		src="../template/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../template/build/js/custom.min.js"></script>

	<script src="../../scripts/template_manipulation.js"></script>
	<!-- 5 include the minified jstree source -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

	

	<script>
	alert("this is some old stuff boooii - project_assigntask");
		$(".staffList").click(function() {
			$(".staffList").removeClass("activeStaff");
			// $(".tab").addClass("active"); // instead of this do the below 
			$(this).addClass("activeStaff");
		});

		$(".NextPage").click(function(){
			window.location.replace("${pageContext.request.contextPath}/views/content/project${getCurrentProjectId}");
		});
		

		$(".LIST").click(function(){
			
			
			jQuery.ajax({
				url : '${pageContext.request.contextPath}/views/content/assignMessageCreatorProject=${getCurrentProjectId}',
				type : "GET",
				success : function(request) {
					console.log(request )
					//window.location.replace("${pageContext.request.contextPath}/views/content/project${getCurrentProjectId}");
				}
			});
			
			
			
			
			
		});
		
		
		
		
		
		
		
		$(function() {

			$('#jstree_template').jstree({
				"core" : {
					"animation" : 0,
					"check_callback" : true,
					"themes" : {
						"stripes" : true
					},
					"dblclick_toggle" : false,

				},
				"types" : {
					"#" : {
						"max_children" : 5,
						"max_depth" : 4,
						"valid_children" : []
					},
					"root" : {
						"icon" : "/static/3.3.4/assets/images/tree_icon.png",
						"valid_children" : []
					},
					"default" : {
						"valid_children" : []
					},
					"file" : {
						"icon" : "glyphicon glyphicon-file",
						"valid_children" : []
					}
				},
				"dnd" : {
					"always_copy" : true,
					"large_drag_target" : true
				},
				"plugins" : [ "dnd", "search",
				/*"state",*/"types", "wholerow", "checkbox", "unique", /*"sort"*/
				]
			});

			/*		Initiate right treeview //*/

			$('#jstree_project').jstree({
				"core" : {
					"animation" : 0,
					"check_callback" : true,
					"themes" : {
						"stripes" : true
					},
				},
				"types" : {
					"#" : {
						"max_children" : 5,
						"max_depth" : 4,
					},
					"root" : {
						"icon" : "/static/3.3.4/assets/images/tree_icon.png",
						"valid_children" : [ "default", "file" ]
					},
					"default" : {
						"valid_children" : [ "default", "file" ]
					},
					"file" : {
						"icon" : "glyphicon glyphicon-file",
						"valid_children" : []
					}
				},
				"dnd" : {
					"large_drop_target" : true
				},
				"plugins" : [ "dnd", "search",
				/*"state",*/"types", "wholerow", "checkbox", /*"sort"*/
				, "contextmenu", "unique" ]
			})

			$('#jstree2')
					.jstree(
							{
								"core" : {
									"animation" : 0,
									"check_callback" : true,
									"themes" : {
										"stripes" : true
									},

								},
								"types" : {
									"#" : {
										"max_children" : 1,
										"max_depth" : 4,
									},
									"root" : {
										"icon" : "/static/3.3.4/assets/images/tree_icon.png",
										"valid_children" : [ "default" ]
									},
									"default" : {
										"valid_children" : [ "default", "file" ]
									},
									"file" : {
										"icon" : "glyphicon glyphicon-file",
										"valid_children" : []
									}
								},
								"plugins" : [ "dnd", "search", "state",
										"types", "wholerow", "checkbox", /*"sort"*/
										, ]
							});

			$(document).on('dnd_start.vakata', function(e, data) {
				$('#jstree_project').css("background", "#ebebeb");
				$('#jstree_project').css("border", "1px dashed gray");
				//  parents = ref.get_node(data.element).parent;
			});

			$(document).on('dnd_stop.vakata', function(e, data) {
				$('#jstree_project').css("background", "none");
				$('#jstree_project').css("border", "none");
			});

			// 7 bind to events triggered on the tree
			$('#jstree').on("changed.jstree", function(e, data) {
				console.log(data.selected);
				var x = data.selected;
				alert()
			});
			// 8 interact with the tree - either way is OK

			$("#saveJSON")
					.on(
							'click',
							function() {

								var data = null;
								//$('#jstree_project').jstree(true).refresh();
								$('#jstree_project').jstree(true).settings.core.data;
								data = $('#jstree_project').jstree().get_json(
										'#', {
											flat : true
										})

								jQuery
										.ajax({
											url : '${pageContext.request.contextPath}/views/content/assignTasksProjectId=${getCurrentProjectId}',
											type : "POST",
											data : JSON.stringify({
												chaptersArray : data
											}),
											contentType : 'application/json',
											//dataType: 'json',
											success : function() {
												console.log("Project name: ${selectProjectById.title}");
												console.log("Staff selected: nada" )
												//window.location.replace("${pageContext.request.contextPath}/views/content/project${getCurrentProjectId}");
											}
										});

								data = null;
							});



			$(".listNames")
					.click(
							function(evt) {

								var pathId = this.id;
								// Refresh the Iframe
								$('.frame')
										.attr(
												'src',
												function(i, val) {

													val = "../../views/content/project${getCurrentProjectId}_jstree/"
															+ pathId;
													//console.log(val)
													return val;
												});

							});

		});
	</script>
</body>
</html>