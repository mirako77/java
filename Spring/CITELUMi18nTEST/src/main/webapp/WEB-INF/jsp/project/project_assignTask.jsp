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
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->

<!--     Load CSS and scripts common to all pages -->
    <%@ include file="../shared/imports_head.jspf" %>


<!--     Load page specific scripts and css  -->
<!-- 2 load the theme CSS file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/style.min.css" />

<style>

	:root {
   	--doneStep:#29a929;   /*  var(--doneStep)   */
	}


.icon {
	width: 40px;
	border-radius: 100%;
}

.activeStaff {
	background: #989898 !important;
	border-color: #989898 !important;
}




	/*wizard css start*/
.NextPage {
	float: right;
}

.doneStep {
	border-color: var(--doneStep) !important;
}

.doneLine {
	background: var(--doneStep) !important;
}

.documentFrame {
	border-left: 1px solid lightgrey;
	margin-left: -1px;
}

.wizard {
	margin: 20px auto;
	background: #fff;
}

.wizard .nav-tabs {
	position: relative;
	margin: 40px auto;
	margin-bottom: 0;
	border-bottom-color: #e0e0e0;
}

.wizard>div.wizard-inner {
	position: relative;
}

.connecting-line {
	height: 2px;
	background: #e0e0e0;
	position: absolute;
	width: 25%;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 50%;
	z-index: 1;
}

.wizard .nav-tabs>li.active>a, .wizard .nav-tabs>li.active>a:hover,
	.wizard .nav-tabs>li.active>a:focus {
	color: #555555;
	cursor: default;
	border: 0;
	border-bottom-color: transparent;
}

span.round-tab {
	width: 70px;
	height: 70px;
	line-height: 70px;
	display: inline-block;
	border-radius: 100px;
	background: #fff;
	border: 2px solid #e0e0e0;
	z-index: 2;
	position: absolute;
	left: 0;
	text-align: center;
	font-size: 25px;
	padding-top: 20px;
}

span.round-tab i {
	color: #555555;
}

.wizard li.active span.round-tab {
	background: #fff;
	border: 2px solid #5bc0de;
}

.wizard li.active span.round-tab i {
	color: var(--doneStep);
}

.wizard li.active p {
	color: var(--doneStep) !important;
}

span.round-tab:hover {
	color: #333;
	border: 2px solid #333;
}

.wizard .nav-tabs>li {
	width: 25%;
}

.wizard li:after {
	content: " ";
	position: absolute;
	left: 46%;
	opacity: 0;
	margin: 0 auto;
	bottom: 0px;
	border: 5px solid transparent;
	border-bottom-color: var(--doneStep);
	transition: 0.1s ease-in-out;
}

.wizard li.active:after {
	content: " ";
	position: absolute;
	left: 47.5%;
	opacity: 1;
	margin: 0 auto;
	bottom: 0px;
	border: 10px solid transparent;
	border-bottom-color: var(--doneStep);
}

.wizard .nav-tabs>li a {
	width: 70px;
	height: 70px;
	margin: 20px auto;
	border-radius: 100%;
	padding: 0;
}

.wizard .nav-tabs>li a:hover {
	background: transparent;
}

.wizard .nav-tabs > li p {
	margin-top: 10px;
	width: 100px;
	text-align: center;
	margin-left:-20%;
	color: #555555;
}

.wizard .tab-pane {
	position: relative;
	padding-top: 30px;
}

.wizard h3 {
	margin-top: 0;
}

@media ( max-width : 585px ) {
	.wizard {
		width: 90%;
		height: auto !important;
	}
	span.round-tab {
		font-size: 16px;
		width: 50px;
		height: 50px;
		line-height: 50px;
	}
	.wizard .nav-tabs>li a {
		width: 50px;
		height: 50px;
		line-height: 50px;
	}
	.wizard li.active:after {
		content: " ";
		position: absolute;
		left: 35%;
	}
}

/*wizard css end*/


</style>
</head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

		<!--       include sidebar.jspf -->
        <%@ include file="../shared/sidebar.jspf" %>

		<!-- top navigation -->
        <%@ include file="../shared/top_navigation.jspf" %>
        <!-- /top navigation -->
			<!-- page content ============================================-->
			<div class="right_col" role="main" style="min-height: auto !important;">

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
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">

							<i class="fa fa-edit"></i> Projets > Assigner des tâches


				<div class="wizard">
					<div class="wizard-inner">
						<div class="connecting-line left doneLine" style="margin-left: 13%"></div>
						<div class="connecting-line middle doneLine"></div>
						<div class="connecting-line right doneLine" style="margin-right: 13%"></div>
						<ul class="nav nav-tabs" role="tablist">

							<li role="presentation" class="">
								<a class="" href="project${getCurrentProjectId}_edit"
									data-toggle="" aria-controls="step1" role="tab"
									title="Step 1">
									<span class="round-tab doneStep">
										<i class="entypo-info round-it"></i>
									</span>
									<br/><br/><br/><br/><br/>
									<p>
										Information générale
									</p>
								</a>
							</li>

							<li role="presentation" class=""><a
								href="project${getCurrentProjectId}_preview" data-toggle="" aria-controls="step2"
								role="tab" title="Step 2"> <span class="round-tab doneStep">
										<i class="entypo-flow-tree round-it"></i>
								</span>
								<br/><br/><br/><br/><br/>
								<p>
									Choix des éléments
								</p>
							</a>

							</li>
							<li role="presentation" class=""><a
								href="project${getCurrentProjectId}_addStaff" data-toggle="" aria-controls="step3"
								role="tab" title="Step 3"> <span class="round-tab doneStep">
										<i class="entypo-user-add"></i>
								</span>
								<br/><br/><br/><br/><br/>
									<p>
										Choix des Personnes
									</p>
								</a>
							</li>

							<li role="presentation" class="active"><a
								href="#complete" data-toggle="tab" aria-controls="complete"
								role="tab" title="Complete"> <span class="round-tab doneStep">
										<i class="entypo-users round-it"></i>
								</span>
								<br/><br/><br/><br/><br/>
									<p>
										Attribution des Tâches
									</p>
							</a></li>
						</ul>
					</div>

					<br/><br/>
						<div class="tab-content">
							<div class="tab-pane" role="tabpanel" id="step1">



								<div class="col-md-10 col-md-offset-1" style="background: none;">

								</div>

								<ul class="list-inline pull-right">
									<li>
										<button type="button" class="btn btn-primary next-step" onclick="createProjectForm.submit()">Save and continue</button>
									</li>
								</ul>
							</div>
							<div class="tab-pane active" role="tabpanel" id="step2">

								<div class="col-md-10 col-md-offset-1" style="background: none;">











									<!-- 				 project icons admin -->
								<%--	<%@ include file="../shared/project_icons_admin.jspf" %>  --%>
									<!-- 				 /project icons admin -->


								<br/><br/>
								<div class="x_title">
									<div class="col-md-7">
										<h3 style="margin-left:20%;">Personnel disponible</h3>
									</div>
									<div class="col-md-4">
										<h3 style="margin-left:20%;">Projet en Cours</h3>
									</div>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

								<div class="container-fluid" style="height: 70%">
									<div class="row">
										<div class="col-md-4"
											style="/*border: 1px solid #ebebeb;*/ padding: 20px;">

											<div>
												<div class="list-group">
													<c:forEach var="staff" items="${listStaffAssignedToProject}"
														varStatus="staffStatus">
														<a href="#" class="list-group-item listNames staffList"
															" id="${staff.id}"><img
															src="${pageContext.request.contextPath}/images/staff/${staff.picture_path}"
															class="icon" /><span style="margin-left: 20px;">${staff.name}</span></a>
													</c:forEach>
												</div>
												<!--
												<br />
												<hr>
												<button id="refresh">reload Chapters</button>
												<hr>
												<div id="banana">YESSSS</div>
												 -->
											</div>
										</div>

										<!--  =====================================  Right Column Starts here  =====================================  -->

										<div class="col-md-8">
											<br />
											<div id="detailframe"
												class="col-xs-12 col-lg-12 documentFrame">
												<iframe name="frame" class="frame"
													src="project${getCurrentProjectId}_assignTaskFrame/${getCurrentProjectId}"
													style="width: 100%; height: 80%; min-height: 500px;"
													width="100%" height="1000px" frameborder="0"></iframe>
											</div>

											<div class="col-md-12" style="background: none;">
												<hr>

											<div class="col-md-7" style="background: none;"></div>
							 				<!--
							 				<button class="LIST">Message creator</button>
											<div class="col-md-2" style="background: none;">
												<button class="NextPage">Send Notification</button>
											</div>
							 				 -->
											<div class="col-md-1" style="background: none;">

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










						<ul class="list-inline pull-right col-md-12 col-lg-12" id="step2">
								<br/><br/><br/>
									<li class="col-md-9 col-lg-9"><button type="button"
											class="btn btn-default prevPage">Précédent</button></li>
									<li class="col-md-3 col-lg-3"><button type="button"
											class="btn btn-primary nextPage">Suivant</button></li>
								</ul>

								</div>
								</div>


							</div>
							<div class="tab-pane" role="tabpanel" id="step3">
								<!--
								<h3>Step 3</h3>
								<p>This is step 3</p>
								<ul class="list-inline pull-right">
									<li><button type="button"
											class="btn btn-default prev-step">Previous</button></li>
									<li><button type="button"
											class="btn btn-default next-step">Skip</button></li>
									<li><button type="button"
											class="btn btn-primary btn-info-full next-step">Save
											and continue</button></li>
								</ul>
								 -->
							</div>
							<div class="tab-pane" role="tabpanel" id="complete">
								<!--
								<h3>Complete</h3>
								<p>You have successfully completed all steps.</p>
							</div>
							<div class="clearfix"></div>
								 -->
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


<!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>


<!--     Load page-specific scripts -->
	<!-- 5 include the minified jstree source -->
	<script src="${pageContext.request.contextPath}/vendors/jstree/dist/jstree.min.js"></script>

	<script>

	//Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();

    //Form Wizard

    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);

        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });


	/*************************************TESTING*********************************************/

	$(".LIST").click(function(){
		jQuery.ajax({
			url : '${pageContext.request.contextPath}/web/assignMessageCreatorProject=${getCurrentProjectId}',
			type : "GET",
			success : function(request) {
				//console.log(request )
			}
		});

	});

	/*************************************TESTING*********************************************/

		$(".staffList").click(function(e) {
			$(".staffList").removeClass("activeStaff");
			// $(".tab").addClass("active"); // instead of this do the below
			$(this).addClass("activeStaff");
			e.stopPropagation();
		    e.preventDefault();
		});

		$(".NextPage").click(function(){
			jQuery.ajax({
				url : '${pageContext.request.contextPath}/web/assignMessageCreatorProject=${getCurrentProjectId}',
				type : "GET",
				success : function(request) {
					//console.log(request )
				}
			});
			jQuery.ajax({
				url : '${pageContext.request.contextPath}/web/wizardCompletedProjectId=${getCurrentProjectId}',
				type : "GET",
				success : function(request) {
					//console.log(request )
				}
			});
			window.location.href= "${pageContext.request.contextPath}/web/project${getCurrentProjectId}";

		});

		$(".prevPage").on('click', function() {
	  		$("#saveJSON").click();

	  		window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_addStaff";				//Redirect to next page

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
				//console.log(data.selected);
				var x = data.selected;

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
								//console.log(data)
								/*
								for ( i = 0; i < data.length ; i++) {


									var id = data[i].id;
									var parent = data[i].parent
									var text = data[i].text
									var type = data[i].type

									data4 = {
											'id': id,
											'parent': parent,
											'text': text,
											'type': type
									}

									dataTest = "id:" + id + " " + "parent: " + parent + " " +  "text:" + text + " " +  "type:" + type

								}
								 */

								//{ "left": 13 , "right" : 7 }
								//{ coiso: [ { name: "Francisco", adress: "AAAAAAAA" }, { name: "Filipe", adress: "BBBBBBBB" } ] }
								jQuery
										.ajax({
											url : '${pageContext.request.contextPath}/web/assignTasksProjectId=${getCurrentProjectId}',
											type : "POST",
											data : JSON.stringify({
												chaptersArray : data
											}),
											contentType : 'application/json',
											//dataType: 'json',
											success : function() {
												//alert("project Chapters successfully saved")
												//console.log('success');
												//window.location.replace("${pageContext.request.contextPath}/web/project${getCurrentProjectId}");
											}
										});
								//JSON.stringify(data2)

								data = null;

							});

			$(function() {
				$("#refresh").click(function(evt) {
					//$("#detailframe").document.location.reload();
					$('.frame').attr('src', function(i, val) {
						console.log("VAL  " + val)

						return val;
					});
				})
			})

			$(".listNames")
					.click(
							function(evt) {
								//var data = null;
								//$('#jstree_project').jstree(true).refresh();

								//console.log("ok    " + $(".frame").contents().find("#jstree_project_database"))

								//var jstree = $(".frame").contents().find("#jstree_project_database")

								//console.log(jstree.jstree(true).settings.core.data)

								//$('#jstree_project_database').jstree(true).settings.core.data;
								//data = $('#jstree_project_database').jstree().get_json('#', {flat:true})

								/*
								//Ajax POST to the back end
								jQuery.ajax({
									url: '${pageContext.request.contextPath}/web/assignTasksProjectId=${getCurrentProjectId}',
									type: "POST",
									data: JSON.stringify( { chaptersArray: data } ),
									contentType: 'application/json',
									//dataType: 'json',
									success: function(){
								    	//alert("project Chapters successfully saved")
										console.log('success');
								    	window.location.replace("${pageContext.request.contextPath}/web/project${getCurrentProjectId}");
									  }
								});
								 */
								//console.log(this.id)

								var pathId = this.id;
								// Refresh the Iframe
								$('.frame')
										.attr(
												'src',
												function(i, val) {

													val = "project${getCurrentProjectId}_assignTaskFrame/"
															+ pathId;
													//console.log(val)
													return val;
												});

							});
			//Click first element in staff list on load
			$(".list-group .listNames:first").click();

		});
	</script>
</body>
</html>