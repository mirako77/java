<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--
<%@ page session="false" %>
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<!-- Dropzone.js -->
<link href="${pageContext.request.contextPath}/vendors/dropzone/dist/min/dropzone.min.css"
	rel="stylesheet">


<!--     /Load CSS and scripts common to all pages -->

<!--     Load page specific scripts and css  -->

    <!-- jQuery core 3.2.1 -->
<!--     <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->

<!-- 2 load the theme CSS file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/style.min.css" />
<!--     /Load page specific scripts and css  -->

<style type="text/css">

      .icon {
     	width: 40px;
       	border-radius: 100%;
      }

      .documentFrame {
	      border-left:1px solid lightgrey;
	      margin-left:-1px;
      }

      .hideTreeBtn {
      	margin-bottom:2px
      }

      #currentTast {
	      margin-top: 7px;
      }

      .currentTaskMessage {
      	text-align: center;
      	text-decoration: underline;

      }

      .btn.btn-info:disabled,
       .btn.btn-danger:disabled{
      opacity: 1;
       }

</style>
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
			<h3>Projet : ${selectProjectById.title}</h3>
		</div>
	</div>
	<div class="clearfix"></div>
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">

				<i class="fa fa-edit"></i> Projets > Modifier les fichiers
				 <div class="ln_solid"></div>

					<c:choose>
						<c:when test="${ currentSessionCredentials.permissionLevel <= projectManagerLevel}">

						<!-- 				 project icons admin -->
						<%@ include file="../shared/project_icons_admin.jspf" %>
						<!-- 				 /project icons admin -->

						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					<!--   END Check Logged user and his Permission -->

					<div class="col-md-4">
						<!-- <h3>Base Documentaire</h3>  -->
					</div>
					<div class="col-md-8" style="text-align: center;">
						<h3>Projet en Cours</h3>
					</div>
					<div class="clearfix"></div>
				</div>
				
					<div class="container-fluid">
						<div class="row">
							<div id = "folderList" class="col-xs-12 col-lg-4" style="border-right:1px solid lightgrey">

								<form id="iframeForm" action="../services/load" method="POST" enctype="multipart/form-data" target="frame">
									<center><button hidden=true id="iframeFormBtn" type="submit" name="your_name" value="your_value" class="btn-primary openFile"
									style='background: 595FFF; width: 100px; height: 30px'>Open File</button></center>
								</form><br/>
								<!--
						<button id="btnPro">
						CLICK ME FAST
						</button>
								 -->
<!------------------ JSTREE ------------------------>

<c:set var="countRoot" value="0" scope="page" />
<c:set var="countLevel1" value="0" scope="page" />
<c:set var="countLevel2" value="0" scope="page" />
<c:set var="countLevel3" value="0" scope="page" />
<c:set var="countLevel4" value="0" scope="page" />
<div id="jstree_project_database">
	<c:forEach var="root" items="${listProjectsFolders}" varStatus="foldersLoop">
		<c:choose>
		    <c:when test="${ currentUserPermission <= projectManagerLevel}">
		    	<c:set var = "rootDisabled" scope = "request" value = "true"/>
		    </c:when>
		     <c:when test="${ root.staff.name != currentUser }">
		    	<c:set var = "rootDisabled" scope = "request" value = "false"/>
		    </c:when>
		    <c:when test="${root.staff.name == null }">
		    	<c:set var = "rootDisabled" scope = "request" value = "false"/>
		    </c:when>
			<c:otherwise>
				<c:set var = "rootDisabled" scope = "request" value = "true"/>
			</c:otherwise> 
		</c:choose>
		<c:if test="${root.parent == '#' && root.is_file == 1}">
			<c:set var="countLevel1" value="0" scope="page" />
			<c:set var="countLevel2" value="0" scope="page" />
			<c:set var="countLevel3" value="0" scope="page" />
			<c:set var="countLevel4" value="0" scope="page" />
			<c:set var="countRoot" value="${countRoot + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			<ul>
				<li data-jstree='{"type":"file"}' personInCharge="${rootDisabled}" value="${root.path}" finished="${root.finished}" identity=${root.id} treeLevel=0 listNumber="${countRoot}." path="${root.path}">${countRoot}. ${root.description}
				<c:if test="${root.finished == true}">
					<span class="glyphicon glyphicon-ok green"></span>
				</c:if></li>
			</ul>
		</c:if>
		<c:if test="${root.parent == '#' && root.is_file == 0}">
			<c:set var="countLevel1" value="0" scope="page" />
			<c:set var="countLevel2" value="0" scope="page" />
			<c:set var="countLevel3" value="0" scope="page" />
			<c:set var="countLevel4" value="0" scope="page" />
			<c:set var="countRoot" value="${countRoot + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			<ul>
				<li identity="${root.id}" treeLevel=0 listNumber="${countRoot}.">${countRoot}. ${root.description}</span>
					<ul>
						<c:forEach var="level1" items="${listProjectsFolders}" varStatus="sectionLoop">
							<c:choose>
							    <c:when test="${ currentUserPermission <= projectManagerLevel}">
							    	<c:set var = "level1Disabled" scope = "request" value = "true"/>
							    </c:when>
							     <c:when test="${ level1.staff.name != currentUser }">
							    	<c:set var = "level1Disabled" scope = "request" value = "false"/>
							    </c:when>
							    <c:when test="${level1.staff.name == null }">
							    	<c:set var = "level1Disabled" scope = "request" value = "false"/>
							    </c:when>
								<c:otherwise>
									<c:set var = "level1Disabled" scope = "request" value = "true"/>
								</c:otherwise> 
							</c:choose>
							<c:if test="${level1.parent == root.nodeId && level1.is_file == 1}">
								<c:set var="countLevel2" value="0" scope="page" />
								<c:set var="countLevel3" value="0" scope="page" />
								<c:set var="countLevel4" value="0" scope="page" />
								<c:set var="countLevel1" value="${countLevel1 + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
								<li data-jstree='{"type":"file"}' personInCharge="${level1Disabled}" value="${level1.path}" finished="${level1.finished}" identity=${level1.id} treeLevel=1 listNumber="${countRoot}.${countLevel1}." path="${level1.path}">${countRoot}.${countLevel1}. ${level1.description} 
									<c:if test="${level1.finished == true}">
										<span class="glyphicon glyphicon-ok green"></span>
									</c:if>
								</li>
							</c:if>
							<c:if test="${level1.parent == root.nodeId && level1.is_file == 0}">
								<c:set var="countLevel2" value="0" scope="page" />
								<c:set var="countLevel3" value="0" scope="page" />
								<c:set var="countLevel4" value="0" scope="page" />
								<c:set var="countLevel1" value="${countLevel1 + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
								<li identity="${level1.id}" treeLevel=1 listNumber="${countRoot}.${countLevel1}.">${countRoot}.${countLevel1}. ${level1.description}
									<ul>
										<c:forEach var="level2" items="${listProjectsFolders}" varStatus="sectionLoop">
											<c:choose>
											    <c:when test="${ currentUserPermission <= projectManagerLevel}">
											    	<c:set var = "level2Disabled" scope = "request" value = "true"/>
											    </c:when>
											     <c:when test="${ level2.staff.name != currentUser }">
											    	<c:set var = "level2Disabled" scope = "request" value = "false"/>
											    </c:when>
											    <c:when test="${level2.staff.name == null }">
											    	<c:set var = "level2Disabled" scope = "request" value = "false"/>
											    </c:when>
												<c:otherwise>
													<c:set var = "level2Disabled" scope = "request" value = "true"/>
												</c:otherwise>  
											</c:choose>
											<c:if test="${level2.parent == level1.nodeId && level2.is_file == 1}">
												<c:set var="countLevel3" value="0" scope="page" />
												<c:set var="countLevel4" value="0" scope="page" />
												<c:set var="countLevel2" value="${countLevel2 + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
												<li data-jstree='{"type":"file"}' personInCharge="${level2Disabled}" value="${level2.path}" finished="${level2.finished}" identity=${level2.id} treeLevel=2 listNumber="${countRoot}.${countLevel1}.${countLevel2}." path="${level2.path}">${countRoot}.${countLevel1}.${countLevel2}. ${level2.description}
												<c:if test="${level2.finished == true}">
													<span class="glyphicon glyphicon-ok green"></span>
												</c:if>
												</li>
											</c:if>
											<c:if test="${level2.parent == level1.nodeId && level2.is_file == 0}">
												<c:set var="countLevel3" value="0" scope="page" />
												<c:set var="countLevel4" value="0" scope="page" />
												<c:set var="countLevel2" value="${countLevel2 + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
												<li identity="${level2.id}" treeLevel=2 listNumber="${countRoot}.${countLevel1}.${countLevel2}.">${countRoot}.${countLevel1}.${countLevel2}. ${level2.description}
													<ul>
														<c:forEach var="level3" items="${listProjectsFolders}" varStatus="sectionLoop">
															<c:choose>
															    <c:when test="${ currentUserPermission <= projectManagerLevel}">
															    	<c:set var = "level3Disabled" scope = "request" value = "true"/>
															    </c:when>
															     <c:when test="${ level3.staff.name != currentUser }">
															    	<c:set var = "level3Disabled" scope = "request" value = "false"/>
															    </c:when>
															    <c:when test="${level3.staff.name == null }">
															    	<c:set var = "level3Disabled" scope = "request" value = "false"/>
															    </c:when>
																<c:otherwise>
																	<c:set var = "level3Disabled" scope = "request" value = "true"/>
																</c:otherwise> 
															</c:choose>
															<c:if test="${level3.parent == level2.nodeId && level3.is_file == 1}">
																<c:set var="countLevel4" value="0" scope="page" />
																<c:set var="countLevel3" value="${countLevel3 + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
																<li data-jstree='{"type":"file"}' personInCharge="${level3Disabled}" value="${level3.path}" finished="${level3.finished}" identity=${level3.id} treeLevel=3 listNumber="${countRoot}.${countLevel1}.${countLevel2}.${countLevel3}." path="${level3.path}">${countRoot}.${countLevel1}.${countLevel2}.${countLevel3}. ${level3.description}
																<c:if test="${level3.finished == true}">
																	<span class="glyphicon glyphicon-ok green"></span>
																</c:if>
																</li>
															</c:if>
															<c:if test="${level3.parent == level2.nodeId && level3.is_file == 0}">
																<c:set var="countLevel4" value="0" scope="page" />
																<c:set var="countLevel3" value="${countLevel3 + 1}" scope="page"/>    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
																<li identity="${level3.id}" treeLevel=3 listNumber="${countRoot}.${countLevel1}.${countLevel2}.${countLevel3}.">${countRoot}.${countLevel1}.${countLevel2}.${countLevel3}. ${level3.description}
																	<ul>
																		<c:forEach var="level4" items="${listProjectsFolders}" varStatus="sectionLoop">
																			<c:choose>
																			    <c:when test="${ currentUserPermission <= projectManagerLevel}">
																			    	<c:set var = "level4Disabled" scope = "request" value = "true"/>
																			    </c:when>
																			     <c:when test="${ level4.staff.name != currentUser }">
																			    	<c:set var = "level4Disabled" scope = "request" value = "false"/>
																			    </c:when>
																			    <c:when test="${level4.staff.name == null }">
																			    	<c:set var = "level4Disabled" scope = "request" value = "false"/>
																			    </c:when>
																				<c:otherwise>
																					<c:set var = "level4Disabled" scope = "request" value = "true"/>
																				</c:otherwise>  
																			</c:choose>
																			<c:if test="${level4.parent == level3.nodeId && level4.is_file == 1}">
																				<li data-jstree='{"type":"file"}' personInCharge="${level4Disabled}" value="${level4.path}" finished=${level4.finished} identity=${level4.id} path="${level4.path}">${level4.description}
																				<c:if test="${level4.finished == true}">
																					<span class="span22 glyphicon glyphicon-ok green"></span>
																				</c:if>
																				</li>
																			</c:if>
																		</c:forEach>
																	</ul>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</c:if>
	</c:forEach><br/>
</div><br/><br/>



<!------------------ JSTREE ------------------------>

							</div>
							<div id="detailframe" class="col-xs-12 col-lg-8 documentFrame" >

								<div class="col-md-1">
									<button id = "toggle_folders" title ="Hide list" type= "button" class = "btn"> <span class="hideTreeBtn glyphicon glyphicon-chevron-left"></span></button>
								</div>

								
								
								<div class="col-md-7 currentTaskMessage" style="margin-top: 5px;">
								
									<span id="currentTast"></span>
								</div>
								 
								<div class="col-md-2">
								
								
								<form  action="../services/merge" method="POST">
										
									<button type="button" class="btn btn-primary merge"><span class="span1 glyphicon glyphicon-tasks"></span> Previsualiser</button>
								
								</form>
								</div>		
										
								<div class="col-md-2">
									
									<!-- <button id="taskCompleted" title ="Tâche terminée" type="button" class="btn btn-info">
										<span>Valider</span>
									</button> -->
									<button id="taskCompleted" title ="Tâche terminée" type="button" class="btn btn-info" style="margin-left: 20px"><span>Valider</span>
										<span class="span1 glyphicon glyphicon-tasks" style="padding-left: 10px;"></span>
										<!-- <span class="glyphicon glyphicon-paste"></span> -->

										<span class="span2 glyphicon glyphicon-ok"></span>
										
									</button>
								</div>
			
									<iframe name="frame" id="frame" class="frame" src="ckeditor" style="width: 100%; height: 100%; min-height: 800px"

									width="100%" height="1000px" frameborder="0"></iframe>


							<div id="saveAlert" style="position:fixed; bottom:10%; left:53%; font-size: 15px; display: none; color: white; background-color: #5cb85c; border-color: #4cae4c; padding:6px 12px; border-radius: 4px;">Fichier Enregistré</div>
							
							
							
							</div>
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

	<!-- jQuery -->
<!-- 	<script src="../template/vendors/jquery/dist/jquery.min.js"></script> -->
<!-- jQuery core 3.2.1 -->
<!--     <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->


	<!-- 5 include the minified jstree source -->
	<script src="${pageContext.request.contextPath}/vendors/jstree/dist/jstree.min.js"></script>

	<script>
		
	$(function () {
		
		 $(".merge").on('click', function() {
		   		
	     		var information = {id: "${getCurrentProjectId}" };
	 			
	     		
	     		jQuery.ajax({
			    		url: '${pageContext.request.contextPath}/mergeServlet',
			    		type: "POST",
			    		data: information,
						success: function() { 
						} 
			    	});
	
	      		this.form.submit();
 		  
	   	  });
	
		$('#toggle_folders').on('click', toggleFolders);

		function fadeFolders() {
			if ($('#toggle_folders').attr("title") === "Hide list") {
				//$('#folderList').fadeOut("slow", updFrame);
				$('#folderList').hide(500, function(){
					console.log("HEY");
					updFrame();
				})

			} else {
				//$('#folderList').fadeIn("slow");
				//$('#folderList').show("100");

				updFrame();
				$('#folderList').show(500, function(){
					console.log("HEY");
				})
			}
	//		$('#folderList').fadeToggle("slow", updFrame);
		};

		function updButton() {
			if ($('#toggle_folders').attr("title") === "Hide list") {
				$('#toggle_folders').attr("title", "Show list");
				$('#toggle_folders').html('<span class="glyphicon glyphicon-chevron-right"></span>')

			} else {
				$('#toggle_folders').attr("title", "Hide list");
				$('#toggle_folders').html('<span class="glyphicon glyphicon-chevron-left"></span>')
			};
		};

		function updFrame () {

			$('#detailframe').toggleClass("col-lg-8");

			if ($('#detailframe').hasClass("col-lg-8")) {
				$('#detailframe').css({"border-left": "1px solid lightgrey"})
			} else {
				$('#detailframe').css({"border-left": "none"})
			}

		}

		function toggleFolders() {
			fadeFolders();
			updButton();
		}


//*********** 		START OF script to build the treeview with jstree	**************
		$('#jstree').jstree({
	    	  "core" : {
	    	    "animation" : 0,
	    	    "check_callback" : true,
	    	    "themes" : { "stripes" : true },
	    	    "dblclick_toggle" : false,

	    	  },
	    	  "types" : {
	    	    "#" : {
	    	      "max_children" : 1,
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
	    		  "always_copy" : true
	    	  },
	    	  "plugins" : [
	    	    "dnd", "search",
	    	    "state", "types", "wholerow", "unique", "sort"
	    	  ]
	    	});

		$('#jstree_project_database').jstree({
	    	  "core" : {
	    	    "animation" : 0,
	    	    "check_callback" : true,
	    	    "themes" : { "stripes" : true },
	    	    "dblclick_toggle" : false,

	    	  },
	    	  "types" : {
	    	    "#" : {
	    	      "max_children" : 1,
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
	    		  "always_copy" : true
	    	  },
	    	  "plugins" : [
	    	    "dnd", "search",
	    	    /*"state"*/, "types", "wholerow", "unique" /*"sort"*/
	    	  ]
	    	});

		$('#jstree_project_database').on('ready.jstree', function() {
		    $("#jstree_project_database").jstree("open_all");
		});


//*********** 		END OF script to build the treeview with jstree	**************

//============================================= START CHECK PROJECT JSTREE STATUS ==============================================

		if ( !${getProjectTemplateState} ) { 

			var data = null;

 		  	$('#jstree_project_database').jstree(true).settings.core.data;
	    	data = $('#jstree_project_database').jstree().get_json('#', {flat:true})
			console.log(data)
			jQuery.ajax({
 	    		url: '${pageContext.request.contextPath}/web/changeProjectTemplateStatus=${getCurrentProjectId}',
 	    		type: "POST",
 	    		data: JSON.stringify( { chaptersArray: data } ),
 	    		contentType: 'application/json',
 	    		//dataType: 'json',
 	    		success: function(){
			    	//alert("project Chapters successfully saved")

 	    			console.log('updated');
 	    			//window.location.replace("${pageContext.request.contextPath}/web/project${getCurrentProjectId}");
			    	//window.location.reload();
 	    		  }
 	    	});
		}

//============================================= END CHECK PROJECT JSTREE STATUS ==============================================

	var buttonStatus = function(checkFinished) {


        	console.log( checkFinished  + " inside func check")
			var myIframe = document.getElementById('frame');
        	
        	// changes the button status
    		if ( checkFinished == "true" ) {
    			
    			// TO HIDE THE SAVE BUTTON
    			$(".frame").contents().find("#removeMe").hide();
    			//console.log(" check finished " + checkFinished +" save button hidden ----------+++--------------");
    			
    			$(".span22").removeClass('glyphicon-remove');
    			$(".span22").addClass('glyphicon-ok');
    			
    			$("#taskCompleted .span2").removeClass('glyphicon-remove');
    			$("#taskCompleted .span2").addClass('glyphicon-ok');
    			$("#taskCompleted").addClass('btn-info');
    			$("#taskCompleted").removeClass('btn-danger');
    			
    			myIframe.addEventListener("load", function() {
   					$(".frame").contents().find("#removeMe").hide();
   				});

    		} else if ( checkFinished == "false" ) {
    			//USED TO REVEAL THE SAVE BUTTON
    			$(".frame").contents().find("#removeMe").show();
    			//console.log(" check finished " + checkFinished +" save button shown ----------+++-------------");
    			
    			$("#taskCompleted .span2").removeClass('glyphicon-ok');
    			$("#taskCompleted .span2").addClass('glyphicon-remove');
    			$("#taskCompleted").removeClass('btn-info');
    			$("#taskCompleted").addClass('btn-danger');
    			//console.log( "inside flase statement - before jquery")
    			
    			myIframe.addEventListener("load", function() {
   					$(".frame").contents().find("#removeMe").show();
   				});

    		}else {

    			$(".frame").contents().find("#removeMe").hide();
    		}
        	

		}
		var taskSelected = "";

		$("#jstree_project_database").bind("select_node.jstree", function(evt, data){
       		if (data.node.type === "file") {
				
       			console.log(data.node.li_attr.personincharge)
       			var myIframe = document.getElementById('frame');
       			
       			if ( data.node.li_attr.personincharge == "false" ) {
       				
       				$("#taskCompleted").hide();
       				
       				myIframe.addEventListener("load", function() {
       					$(".frame").contents().find("#removeMe").hide();
       				});
       				
       				console.log(1)
       			} else {
       				
       				$("#taskCompleted").show();
       				
       				myIframe.addEventListener("load", function() {
       					$(".frame").contents().find("#removeMe").show();
       				});
       				
       				console.log(2)
       				
       			}
       			
       			
       			
       		//var information = { name: data.node.li_attr.value, id: "folders\\" +  "${getCurrentProjectId}" };         HEAD

       		var information = { PFolderID: data.node.li_attr.identity, folderPath: "folders\\" + "${getCurrentProjectId}", filePath: data.node.li_attr.path, currentPage: "projects" };
       		
        		jQuery.ajax({
		    		url: '${pageContext.request.contextPath}/loaded',
		    		type: "POST",
		    		data: information,
		    		//contentType: 'application/json',
		    		//dataType: 'json',
					success: function(result) {
						//Write your code here
						//console.log("hey dude")

					}
		    	});

        		$("#iframeFormBtn").click();

    	    	taskSelected = $("#jstree_project_database").jstree("get_selected",true)[0].text;
	        	$("#currentTast").html("Tâche courante: " + taskSelected)

	        	//console.log( $("#jstree_project_database").jstree("get_selected",true)[0] )
				
	        	// changes the button status
				var checkFinished = $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished;
	        	buttonStatus(checkFinished);
	        	
       		}
        });

	

		var projectStatusChanged = false;
		$("#taskCompleted").on("click", function() {

			projectStatusChanged = true;
			console.log(projectStatusChanged + "     status")

			var taskCompleted = $("#jstree_project_database").jstree("get_selected",true)[0];

			jQuery.ajax({
 	    		url: '${pageContext.request.contextPath}/web/project${getCurrentProjectId}_taskCompleted',
 	    		type: "POST",
 	    		data: JSON.stringify(
 	    				taskCompleted
				),
 	    		contentType: 'application/json',
 	    		success: function(){
 	    		  }
 	    	});

			var stat = $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished

			if( stat == "true") {
					$("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished = "false";
				} else {
					$("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished = "true";
				}

			var checkFinished = $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished;
        	buttonStatus(checkFinished);
        	
    			//console.log(clickFinished)
    			if ( checkFinished == "true" ) {
    				jQuery.ajax({
        				url : '${pageContext.request.contextPath}/web/messageCreatorTaskComplete=${getCurrentProjectId}',
        				type : "GET",
        				success : function(request) {
        				}
        			});
    			} else {
    				jQuery.ajax({
        				url : '${pageContext.request.contextPath}/web/messageCreatorTaskIncomplete=${getCurrentProjectId}',
        				type : "GET",
        				success : function(request) {
        					//console.log(request )
        				}
        			});
    			}
		});

		var calculateStatus = function() {

			jQuery.ajax({
 	    		url: '${pageContext.request.contextPath}/web/project${getCurrentProjectId}_calculateStatus',
 	    		type: "POST",
 	    		async: false,
 	    		contentType: 'application/json',
 	    		success: function(){
 	    			//window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_assignTask";				//Redirect to next page
 	    		}
 	    	});
		}

		window.onbeforeunload = function(event) {

			if ( projectStatusChanged ) {
				calculateStatus();
			}

		}
 
    });



</script>


<script type="text/javascript">

//Automatic save and when saved brings out the alert
$( document ).ready(function() {
		
	setInterval(saveLoop, 600000);
	function saveLoop() {
		$(".frame").contents().find("#removeMe").click(); 
	}

});

$('#frame').load(function(){
    var iframe = $('#frame').contents();
    iframe.find("#removeMe").click(function(){
    	$("#saveAlert").fadeIn(2000).fadeOut(2000);
    });
});
</script>
</body>
</html>
