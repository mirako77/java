 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>


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

	<!-- jQuery core 3.2.1 -->
<%--     <script src="${pageContext.request.contextPath}/vendors/jquery/jquery-2.2.3/dist/jquery.js"></script> --%>


	<!-- Page styles -->
<!-- confirm
	<link type='text/css' href='${pageContext.request.contextPath}/views/confirmBox/css/demo.css' rel='stylesheet' media='screen' />
-->

	<!-- Confirm CSS files -->
<!-- confirm
	<link type='text/css' href='${pageContext.request.contextPath}/views/confirmBox/css/confirm.css' rel='stylesheet' media='screen' />
-->

    <!-- 2 load the theme CSS file -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/style.min.css" />

<style>

	/*Color variable*/

	:root {
   	--doneStep:#29a929;   /*  var(--doneStep)   */
	}

     .icon {
        width: 40px;
        border-radius: 100%;
      }

   	.file-upload input {
	    display: none;
	}

	.file-upload img {
	    /*width: 80px;*/
	    margin-top: 2px;
	    margin-left: 4px;
	    cursor: pointer;
	}

	.newFolder {
		margin-top: 2px;
	    margin-left: 2px;
	    cursor: pointer;
	}

	.saveButton {
		background: none;
		height: 30px;
		width: 30px;
		padding: 0px;
		margin-left: 10px;
	}

	.saveButton {
		/*color: yellow;*/
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

        <%@ include file="../shared/sidebar.jspf" %>

        <!-- top navigation -->
        <%@ include file="../shared/top_navigation.jspf" %>
        <!-- /top navigation -->

        <!-- page content ============================================-->

<div class="right_col" role="main">
	<div class="page-title">
     	<div class="title_left">
       		<h3>Projet : ${selectProjectById.title}   </h3>
 		</div>
	</div>
	<div class="clearfix"></div>
	<div class="row">
  		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">

  				 <i class="fa fa-edit"></i> Projets > Edit Library


				<div class="wizard">
					<div class="wizard-inner">
						<div class="connecting-line left doneLine" style="margin-left: 13%"></div>
						<div class="connecting-line middle"></div>
						<div class="connecting-line right" style="margin-right: 13%"></div>
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

							<li role="presentation" class="active"><a
								href="#step2" data-toggle="tab" aria-controls="step2"
								role="tab" title="Step 2"> <span class="round-tab doneStep">
										<i class="entypo-flow-tree round-it"></i>
								</span>
								<br/><br/><br/><br/><br/>
								<p>
									Choix des éléments
								</p>
							</a>

							</li>
							<li role="presentation" class="${wizardCompleted}"><a
								href="project${getCurrentProjectId}_addStaff" data-toggle="${tab}" aria-controls="step3"
								role="tab" title="Step 3"> <span class="round-tab">
										<i class="entypo-user-add"></i>
								</span>
								<br/><br/><br/><br/><br/>
									<p>
										Choix des Personnes
									</p>
								</a>
							</li>

							<li role="presentation" class="${wizardCompleted}"><a
								href="project${getCurrentProjectId}_assignTask" data-toggle="${tab}" aria-controls="complete"
								role="tab" title="Complete"> <span class="round-tab">
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









										 <br/><br/>
										 <div class="x_title">
											<div class="col-md-7">
												<h3 style="margin-left:20%;">Base Documentaire</h3>
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

										<div class = "container-fluid">
											<div class = "row" >
												<div class = "col-md-6"><br/>


 <!--======================================== JSTREE ============================================-->

<br/>

							<div id="jstree_template">
								<c:forEach var="chapter" items="${listFolders}" varStatus="foldersLoop">
									<c:if test="${chapter.parent == '#' && chapter.is_file == 0}">
										<ul>
											<li dir="${chapter.dir}">${chapter.description}
												<ul>
													<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
														<c:if test="${section.parent == chapter.node_id && section.is_file == 0}">
															<li dir="${section.dir}">${section.description}
																<ul>
																	<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
																		<c:if test="${subSection.parent == section.node_id && subSection.is_file == 0}">
																			<li dir="${subSection.dir}">${subSection.description}
																				<ul>
																					<c:forEach var="subSectionChild" items="${listFolders}" varStatus="subSectionChildLoop">
																						<c:if test="${subSectionChild.parent == subSection.node_id && subSectionChild.is_file == 1}">
																						<li data-jstree='{"type":"file"}' path="${subSectionChild.path}" dir="${subSectionChild.dir}">${subSectionChild.description}</li>
																						</c:if>
																					</c:forEach>
																				</ul>
																			</li>
																		</c:if>
																	</c:forEach>
																	<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
																		<c:if test="${subSection.parent == section.node_id && subSection.is_file == 1}">
																			<li data-jstree='{"type":"file"}' path="${subSection.path}" dir="${subSection.dir}">${subSection.description}</li>
																		</c:if>
																	</c:forEach>
																</ul>
															</li>
														</c:if>
													</c:forEach>
													<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
														<c:if test="${section.parent == chapter.node_id && section.is_file == 1}">
															<li data-jstree='{"type":"file"}' path="${section.path}" dir="${section.dir}">${section.description}</li>
														</c:if>
													</c:forEach>
												</ul>
											</li>
										</ul>
									</c:if>
									<c:if test="${chapter.parent == '#' && chapter.is_file == 1}">
										<ul>
											<li data-jstree='{"type":"file"}' path="${chapter.path}" dir="${chapter.dir}">${chapter.description}</li>
										</ul>
									</c:if>

								</c:forEach>
							</div>




<!--  =====================================                            =====================================  -->

						</div>
						<div class = "col-md-6" style="height: auto; border-left: 1px solid lightgray">
<!--  =====================================  Right Column Starts here  =====================================  -->

<!-- ==================================== -->



								<div class = "col-md-1" >
									<button title="Ajouter nouveau dossier" id="addFolder" style="background: none; height: 25px; width: 25px; padding: 0px">
										<img class="newFolder" alt="file" src="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/addFolder.png" width="17px">
									</button>
								</div>
								
								<div class = "col-md-1 file-add" style="margin-right: 30px;">
									<button id="addFile" title="Ajouter nouveau fichier" style="margin-left: -20px;background: none; height: 33px; width: 33px; padding: 0px">
									       <img alt="file" src="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/addFile.png" width="22px">
								    </button>
								</div>
								
								<!-- File upload Button Start -->
								<div class = "col-md-8">
	
									<div class="file-upload" style="margin-right: 10px;">
										
									    <button title="Télécharger un nouveau fichier" style="background: none; height: 33px; width: 33px; padding: 0px">
											<label for="file-input" style="width: 20px;">
										        	<img alt="file" src="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/uploadFile.png" width="22px">
										    </label>
									    </button>
									    
										<form name="inputForm" action="${pageContext.request.contextPath}/web/uploadFileProject/uploadFile" method="post" enctype="multipart/form-data">
											<input id="file-input" type="file" name="file" size="50" required="required" onchange="inputForm.submit()"/>
											<!--  Button to allow multiple files to be uploaded at once (messes up the upload to the database system in place) onchange="inputForm.submit()" 
											 <input type="button" id="more_fields" onclick="add();" value="Add More?" />
											 --> 
											 
										</form>
									</div>
								
								</div>
								<!-- File upload Button End -->

								<div class = "col-md-1" >
									<button class="saveButton" id = "saveJSON" title="Enregistrer les modifications" style="background: none; height: 30px; width: 30px; padding: 0px; float: right">
										<i class="glyphicon glyphicon-floppy-disk" style="font-size: 20px"></i>
									</button>
								</div>
								<br/><br/>

<!-- ==================================== -->


								<div id="jstree_project"  style=" min-height: 200px; background: none;">
									<c:forEach var="root" items="${listProjectsFolders}" varStatus="foldersLoop">
										<c:if test="${root.parent == '#' && root.is_file == 0}">
											<ul>
											<li identity="${root.id}">${root.description}
												<ul>
													<c:forEach var="level1" items="${listProjectsFolders}" varStatus="sectionLoop">
														<c:if test="${level1.parent == root.nodeId && level1.is_file == 0}">
															<li identity="${level1.id}">${level1.description}
															<ul>
																<c:forEach var="level2" items="${listProjectsFolders}" varStatus="sectionLoop">
																	<c:if test="${level2.parent == level1.nodeId && level2.is_file == 0}">
																		<li identity="${level2.id}">${level2.description}
																		<ul>
																			<c:forEach var="level3" items="${listProjectsFolders}" varStatus="sectionLoop">
																				<c:if test="${level3.parent == level2.nodeId && level3.is_file == 0}">
																					<li identity="${level3.id}">${level3.description}
																					<ul>
																						<c:forEach var="level4" items="${listProjectsFolders}" varStatus="sectionLoop">
																							<c:if test="${level4.parent == level3.nodeId && level4.is_file == 1}">
																								<li data-jstree='{"type":"file"}' path="${level4.path}" identity="${level4.id}" finished="${level4.finished}">${level4.description}</li>
																							</c:if>
																						</c:forEach>
																					</ul>
																					</li>
																				</c:if>
																				<c:if test="${level3.parent == level2.nodeId && level3.is_file == 1}">
																					<li data-jstree='{"type":"file"}' path="${level3.path}" identity="${level3.id}" finished="${level3.finished}">${level3.description}</li>
																				</c:if>
																			</c:forEach>
																		</ul>
																		</li>
																	 </c:if>
																	 <c:if test="${level2.parent == level1.nodeId && level2.is_file == 1}">
																	 	<li data-jstree='{"type":"file"}' path="${level2.path}" identity="${level2.id}" finished="${level2.finished}">${level2.description}</li>
																	 </c:if>
																</c:forEach>
															</ul>
															</li>
														</c:if>
														<c:if test="${level1.parent == root.nodeId && level1.is_file == 1}">
															<li data-jstree='{"type":"file"}' path="${level1.path}" identity="${level1.id}" finished="${level1.finished}">${level1.description}</li>
														</c:if>
													</c:forEach>
												</ul>
											</li>
											</ul>
										</c:if>
										<c:if test="${root.parent == '#' && root.is_file == 1}">
											<ul>
											<li data-jstree='{"type":"file"}' path="${root.path}" identity="${root.id}" finished="${root.finished}">${root.description}</li>
											</ul>
										</c:if>
									</c:forEach><br/>
								</div><br><br>


<!--  =====================================  Right Column Ends here  =====================================  -->
 <!--======================================== !JSTREE ============================================-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>






								<ul class="list-inline pull-right col-md-12 col-lg-12" id="step2">
								<form  action="../services/merge" method="POST">
								<br/><br/><br/>

										 <li class="col-md-9 col-lg-9"><button type="button"
											class="btn btn-default prevPage">Précédent</button></li>
									<!-- <li class="col-md-6 col-lg-6"><button type="button"
											class="btn btn-default prevPage">Previous</button></li>

									<li class="col-md-3 col-lg-3"><button type="button"
											class="btn btn-info merge">Merge and Preview Document</button></li>
										 -->
									<li class="col-md-3 col-lg-3"><button type="button"
											class="btn btn-primary nextPage">Suivant</button></li>
											</form>
								</ul>

								</div>
								</div>


							</div>
							<div class="tab-pane" role="tabpanel" id="step3">
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









<!-- footer content -->
<footer>
  <div class="pull-right">© 2017 Citelum
  </div>
  <div class="clearfix"></div>
</footer>
<!-- /footer content -->




<!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>

<!--     Load page-specific scripts -->




<!-- confirm
     <script src="${pageContext.request.contextPath}/views/confirmBox/js/confirm.js"></script>
     <script src="${pageContext.request.contextPath}/views/confirmBox/js/jquery.simplemodal.js"></script>
    -->

    <!-- jQuery -->
<%--     <script src="${pageContext.request.contextPath}/vendors/jquery/jquery-3.2.1/dist/jquery.min.js"></script> --%>

    <!-- Custom Theme Scripts -->
<%--     <script src="${pageContext.request.contextPath}/scripts/custom.js"></script> --%>

<%--     <script src="${pageContext.request.contextPath}/scripts/template_manipulation.js"></script> --%>
    <!-- 5 include the minified jstree source -->
  	<script src="${pageContext.request.contextPath}/vendors/jstree/dist/jstree.min.js"></script>

  	<script>
    //WIZARD FORM
    $(document).ready(function () {
        //Initialize tooltips
        $('.nav-tabs > li a[title]').tooltip();

        //Wizard

        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

            var $target = $(e.target);

            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });

    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }
    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }




    </script>


    <script>

  $(function () {

	  //check if task is finished or not
	  var calculateStatus = function() {

			jQuery.ajax({
	    		url: '${pageContext.request.contextPath}/web/project' + ${getCurrentProjectId} + '_calculateStatus',
	    		type: "POST",
	    		async: false,
	    		contentType: 'application/json',
	    		success: function(){
	    			//window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_assignTask";				//Redirect to next page
	    		}
	    	});
		}

	  window.onbeforeunload = function(event) {
		  calculateStatus();

		    var s = "You have unsaved changes. Really leave?";

		    if ( !checkChangesSaved ) {

		    event = event || window.event;
		    if (event) {
		        // This is for IE
		        event.returnValue = s;
		    }

		    // This is for all other browsers
		    return s;
		    }
		}

	  var checkChangesSaved = true;
  		console.log(checkChangesSaved)

  		// JSTREE change Events Start

		$('#jstree_project').on('changed.jstree', function(e, data) {

			if ( data.action === "select_node" || data.action === "deselect_node") {

			} else {
				console.log(data)
				$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
				checkChangesSaved = false;
			}


			//$('.saveButton').find('i').toggleClass('glyphicon-floppy-disk').toggleClass('glyphicon-floppy-saved');


		});

		$('#jstree_project').on('rename_node.jstree', function(e, data) {

				$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
				checkChangesSaved = false;

		});

		$('#jstree_project').on('paste.jstree', function(e, data) {

			$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
			checkChangesSaved = false;

		});

		// JSTREE change Events End



	    /*		Initiate left treeview //*/
	    $('#jstree_template').jstree({
	    	  "core" : {
	    	    "animation" : 0,
	    	    "check_callback" : true,
	    	    "themes" : { "stripes" : true },
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
	    	  "dnd": {
	    		  "always_copy" : true,
	    		  "large_drag_target" : true
	    	  },
	    	  "plugins" : [
	    	    "dnd", "search",
	    	    /*"state",*/ "types", "wholerow", "checkbox", "unique", /*"sort"*/
	    	  ]
	    	});

  		var count = 0;

	    $("#addFolder").click(function () {
	    	count = count +1
	    	checkChangesSaved = false;
	    	var documentName = 'Nouveau Dossier ' + count;

	    	$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
		    $("#jstree_project").jstree('create_node', '#', {'text' : documentName, li_attr : { "path" :  documentName} }, 'last');
			
	    });


	    /*		Initiate right treeview //*/
	    $('#jstree_project').jstree({
	    	"core" : {
    	    "animation" : 0,
    	    //"check_callback" : true,
    	    "check_callback": function (operation, node, node_parent, node_position, more) {
                // operation can be 'create_node', 'rename_node', 'delete_node', 'move_node', 'copy_node' or 'edit'
                // in case of 'rename_node' node_position is filled with the new node name



            },
    	    "themes" : { "stripes" : true },

    	    },

	    	  "types" : {
	    	    "#" : {
	    	      "max_children" : 1000,
	    	      "max_depth" : 4,
	    	    },
	    	    "root" : {
	    	      "icon" : "/static/3.3.4/assets/images/tree_icon.png",
	    	      "valid_children" : ["default", "file"]
	    	    },
	    	    "default" : {
	    	      	"valid_children" : ["default","file"]
	    	    },
	    	    "file" : {
	    	      "icon" : "glyphicon glyphicon-file",
	    	      "valid_children" : []
	    	    }
	    	  },

    	    "dnd": {
    	    	"large_drop_target" : true
    	    },

    	    "plugins" : [
	    	    "dnd", "search",
	    	    /*"state",*/ "types", "wholerow", "checkbox", /*"sort"*/, "contextmenu", "unique"
	    	  ]
    	    });

	    $('#jstree2').jstree({
	    	  "core" : {
	    	    "animation" : 0,
	    	    "check_callback" : true,
	    	    "themes" : { "stripes" : true },

	    	  },
	    	  "types" : {
	    	    "#" : {
	    	      "max_children" : 1,
	    	      "max_depth" : 4,
	    	    },
	    	    "root" : {
	    	      "icon" : "/static/3.3.4/assets/images/tree_icon.png",
	    	      "valid_children" : ["default"]
	    	    },
	    	    "default" : {
	    	      "valid_children" : ["default","file"]
	    	    },
	    	    "file" : {
	    	      "icon" : "glyphicon glyphicon-file",
	    	      "valid_children" : []
	    	    }
	    	  },
	    	  "plugins" : [
	    	    "dnd", "search",
	    	    "state", "types", "wholerow", "checkbox", /*"sort"*/,
	    	  ]
	    	});

	    $(document).on('dnd_start.vakata', function (e, data) {
	        $('#jstree_project').css("background", "#ebebeb");
	        $('#jstree_project').css("border", "1px dashed gray");
	      //  parents = ref.get_node(data.element).parent;
	    });


	    $(document).on('dnd_stop.vakata', function (e, data) {
	    	$('#jstree_project').css("background", "none");
	        $('#jstree_project').css("border", "none");
	        $('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
	        checkChangesSaved = false;
	    });


	    // 7 bind to events triggered on the tree
	    $('#jstree').on("changed.jstree", function (e, data) {
	      console.log(data.selected);
	      var x = data.selected;
	      alert()
	    });
	    // 8 interact with the tree - either way is OK
 	    $("#getJson2").on('click', function () {

 	    	var data = $('#jstree_project').jstree().get_json('#', {flat:true})

 	    	var data2 = {
 	    		"name": "Francisco"
 	    	}
 	    	console.log(data)

 	    	jQuery.ajax({
 	 	    		url: 'http://localhost:8080/CitelumApp/web/addProjectsFoldersListProjectId=${getCurrentProjectId}',
 	 	    		type: "POST",
 	 	    		data: data2,

 	    			success: function(result) {
 	    				//Write your code here
 	    			}
 	 	    	});



	    });
	   
	   	var countFiles = 0;
 	   	$("#addFile").click(function () {
	    	
			countFiles = countFiles +1
	    	checkChangesSaved = false;
	    	$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
		    
	    	var documentName = 'Nouveau fichier (' + countFiles + ")";
	    	
	    	$("#jstree_project").jstree('create_node', '#', {'text' : documentName, "type":"file", li_attr : { "path" :  documentName, "dir" :  "root", "newFile" : true, "identity": -10 } }, 'last');
		    
	    		
	    	
	    	
	    	
	    	    //CRIAR CONTROLLER COM ADD NOVO FICHEIRO PARA PROJECTOS
	    	
	    	
	    	//var data = $('#jstree_template').jstree().get_json('#', {flat:true})
	    	//console.log(data)
		    
		    //Create blank document
		    
		    jQuery.ajax({
	    		url: '${pageContext.request.contextPath}/web/addBlankDocumentFileToProject=${getCurrentProjectId}',
	    		type: "POST", 
	    		data: documentName,
	    		contentType: 'application/json',
	    		//dataType: 'json',
	    		success: function(){
			    	//alert("project Chapters successfully saved")
					console.log('success');
			    	//window.location.replace("${pageContext.request.contextPath}/web/upload");
	    		  }
	    	});
		    
	    	
	     });


 	   $("#saveJSON").on('click', function () {

 		 	checkChangesSaved = true;

 		 	$('.saveButton').find('i').removeClass('glyphicon-floppy-remove').addClass('glyphicon-floppy-saved');

 		  	var data = null;

 		  	$('#jstree_project').jstree(true).settings.core.data;
	    	data = $('#jstree_project').jstree().get_json('#', {flat:true})
	    	console.log(data)


	    	jQuery.ajax({
	 	    		url: '${pageContext.request.contextPath}/web/addProjectsFoldersListProjectId=${getCurrentProjectId}',
	 	    		type: "POST",
	 	    		data: JSON.stringify( { chaptersArray: data } ),
	 	    		contentType: 'application/json',
	 	    		//dataType: 'json',
	 	    		success: function(){
	 	    			//window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_assignTask";				//Redirect to next page
	 	    		  }
	 	    	});


	    	data = null;

 	   });

 	  $(".prevPage").on('click', function() {
 		  if ( !checkChangesSaved ) {
	  		 $("#saveJSON").click();
	  		 console.log("save again")
 		  }

  		window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_edit";				//Redirect to next page

  	  });

 	  $(".merge").on('click', function() {

     		var information = {id: "${getCurrentProjectId}" };


     		jQuery.ajax({
		    		url: '${pageContext.request.contextPath}/mergeServlet',
		    		type: "POST",
		    		data: information,
		    		//contentType: 'application/json',
		    		//dataType: 'json',
					success: function() {


					}
		    	});


      		this.form.submit();

   		//window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_edit";				//Redirect to next page

   	  });


 	  $(".nextPage").on('click', function() {
 		 if ( !checkChangesSaved ) {
	  		 $("#saveJSON").click();
	  		 console.log("save again,,,,,,,,,,,,,,,,,,,,,,,,,,,")
 		  }

 		nextPage();

 	  });

 	  var nextPage = function() {
 		  return window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_addStaff";				//Redirect to next page
 	  }


	  });


	  </script>
  </body>
</html>