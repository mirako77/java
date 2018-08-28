<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
	      float:right;
	      margin-top: 7px;	  	  	    	
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
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">

				<i class="fa fa-folder"></i><a href="user_profile" style="font-weight: bold;">Tableau de bord</a> > <a href="project_list" style="font-weight: bold;">Liste des projets</a> > Open Files
				
				 <div class="ln_solid"></div>

<!-- 				 project icons admin -->
								<%--	<%@ include file="../shared/project_icons_admin.jspf" %> --%>
<!-- 				 /project icons admin -->

					
					<div class="col-md-6">
						<!-- <h3>Base Documentaire</h3>  -->
					</div>
					<div class="col-md-6">
						<h3>Projet en Cours</h3>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="container-fluid">
						<div class="row">
							<div id = "folderList" class="col-xs-12 col-lg-4" style="border-right:1px solid lightgrey">
								
								<form id="iframeForm" action="../services/load" method="POST" enctype="multipart/form-data" target="frameRemove">
									<center><button hidden=true id="iframeFormBtn" type="submit" name="your_name" value="your_value" class="btn-primary openFile" 
									style='background: 595FFF; width: 100px; height: 30px'>Open File</button></center>
								</form><br/>
								<!-- 
						<button id="btnPro">
						CLICK ME FAST
						</button>
								 -->
<!------------------ JSTREE ------------------------>							
								
<div id="jstree_project_database">
	<c:forEach var="root" items="${listProjectsFolders}" varStatus="foldersLoop">
		<c:if test="${root.parent == '#' && root.is_file == 1}">
			<ul>
				<li data-jstree='{"type":"file"}' value="${root.path}" finished="${root.finished}" identity="${root.id}">${root.description}</li>
			</ul>
		</c:if>
		<c:if test="${root.parent == '#' && root.is_file == 0}">
			<ul>
				<li identity="${root.id}">${root.description}
					<ul>
						<c:forEach var="level1" items="${listProjectsFolders}" varStatus="sectionLoop">
							<c:if test="${level1.parent == root.nodeId && level1.is_file == 1}">
								<li data-jstree='{"type":"file"}' value="${level1.path}" finished="${level1.finished}" identity="${level1.id}">${level1.description}</li>
							</c:if>
							<c:if test="${level1.parent == root.nodeId && level1.is_file == 0}">
								<li identity="${level1.id}">${level1.description}
									<ul>
										<c:forEach var="level2" items="${listProjectsFolders}" varStatus="sectionLoop">
											<c:if test="${level2.parent == level1.nodeId && level2.is_file == 1}">
												<li data-jstree='{"type":"file"}' value="${level2.path}" finished="${level2.finished}" identity="${level2.id}">${level2.description}</li>
											</c:if>
											<c:if test="${level2.parent == level1.nodeId && level2.is_file == 0}">
												<li identity="${level2.id}">${level2.description}
													<ul>
														<c:forEach var="level3" items="${listProjectsFolders}" varStatus="sectionLoop">
															<c:if test="${level3.parent == level2.nodeId && level3.is_file == 1}">
																<li data-jstree='{"type":"file"}' value="${level3.path}" finished="${level3.finished}" identity="${level3.id}"> ${level3.description}</li>
															</c:if>
															<c:if test="${level3.parent == level2.nodeId && level3.is_file == 0}">
																<li identity="${level3.id}">${level3.description}
																	<ul>
																		<c:forEach var="level4" items="${listProjectsFolders}" varStatus="sectionLoop">
																			<c:if test="${level4.parent == level3.nodeId && level4.is_file == 1}">
																				<li data-jstree='{"type":"file"}' value="${level4.path}" finished="${level4.finished}" identity="${level4.id}">${level4.description}</li>
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
	<ul class="list-inline pull-right col-md-12 col-lg-12" id="step2">
								<form  action="../services/merge" method="POST">
								<br/><br/><br/>
										
									<li class="col-md-3 col-lg-3 offset-3"><button type="button"
											class="btn btn-info merge">Merge and Preview Document</button></li>
											

											</form>
								</ul>
<!------------------ JSTREE ------------------------>

							</div>
							<div id="detailframe" class="col-xs-12 col-lg-8 documentFrame" >
							
								<div class="col-md-1">
									
								
								<button id = "toggle_folders" title ="Hide list" type= "button" class = "btn"> <span class="hideTreeBtn glyphicon glyphicon-chevron-left"></span></button>
								

								</div>
								
								
								<div class="col-md-10">
									<span id="currentTast"></span>
								</div>
								
								<div class="col-md-1">
									
									<!--  									<button id="taskCompleted" title ="Tâche terminée" type="button" class="btn btn-info">
										<span class="span1 glyphicon glyphicon-tasks"></span>
										

										<span class="span2 glyphicon glyphicon-ok"></span>
										
									</button>
											-->
																	
								</div>
								
									<iframe name="frameRemove" class="frame" src="ckeditor" style="width: 100%; height: 100%; min-height: 800px"
									width="100%" height="1000px" frameborder="0"></iframe>
								
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


		var taskSelected = "";

		$("#jstree_project_database").bind("select_node.jstree", function(evt, data){
       		if (data.node.type === "file") {
       		
       			var information = { PFolderID: data.node.li_attr.identity, folderPath: "folders\\" + "${getCurrentProjectId}", filePath: data.node.li_attr.value, currentPage: "projects" };
           		console.log(information.filePath + "   *//*/*/*//*/*/**/*/*/*/*/*");
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

        		//console.log( $("#jstree_project_database").jstree("get_selected",true)[0].text )
        	
    	    	taskSelected = $("#jstree_project_database").jstree("get_selected",true)[0].text;
	        	$("#currentTast").html("Tâche courante: " + taskSelected)
        		
	        	console.log( $("#jstree_project_database").jstree("get_selected",true)[0] )
	        	
	        	// changes the button status
				var checkFinished = $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished;
	        	buttonStatus(checkFinished);
	        		
       		}

        });
			
		var buttonStatus = function(checkFinished) {
			
        	
        	console.log( checkFinished  + " inside func check")
    	
        	// changes the button status
    		if ( checkFinished == "true" ) {

    			$("#taskCompleted .span2").removeClass('glyphicon-remove');
    			$("#taskCompleted .span2").addClass('glyphicon-ok');
    			$("#taskCompleted").addClass('btn-info');
    			$("#taskCompleted").removeClass('btn-danger');
    			
    		} else {

    			$("#taskCompleted .span2").removeClass('glyphicon-ok');
    			$("#taskCompleted .span2").addClass('glyphicon-remove');
    			$("#taskCompleted").removeClass('btn-info');
    			$("#taskCompleted").addClass('btn-danger');
    		}
			
			
		}
			
		$("#taskCompleted").on("click", function() {
			

			
			//console.log(  $("#jstree_project_database").jstree('get_selected') )
			
			var taskCompleted = $("#jstree_project_database").jstree("get_selected",true)[0];
			

			
			jQuery.ajax({ 
 	    		url: '${pageContext.request.contextPath}/web/project1_taskCompleted',
 	    		type: "POST", 
 	    		data: JSON.stringify(
 	    				taskCompleted
				),
 	    		//data: JSON.stringify( { chaptersArray: data } ),
 	    		contentType: 'application/json',
 	    		//dataType: 'json',
 	    		success: function(){
 	    			//window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_assignTask";				//Redirect to next page
 	    		  }
 	    	});
			
			

			
						
			console.log( $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished + "     first Status" )
			
			var stat = $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished
			
			console.log("-1-1-1-1-1-1-1-1-1")
			
			if( stat == "true") {
					
					console.log("a")
					$("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished = "false";
					//console.log( " first it : true")
					//console.log($("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished)
				
				} else {
					
					
					console.log("b")
					//console.log( " first it : false")
					$("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished = "true";
					//console.log($("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished)
				}
			console.log("-2-2-2-2-2-2-2-2-2")
			

			
			
			console.log( $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished + "     second Status" )
			
			console.log("=======================================")
			
			var checkFinished = $("#jstree_project_database").jstree("get_selected",true)[0].li_attr.finished;
        	buttonStatus(checkFinished);
			
		});

	 	  $(".merge").on('click', function() {
	 	   		
	     		var information = {id: "${getCurrentProjectId}" };
	 			
	     		console.log("${getCurrentProjectId}");
	     		jQuery.ajax({
			    		url: '${pageContext.request.contextPath}/mergeServlet',
			    		type: "POST",
			    		data: information,
						success: function() { 
							console.log("123");
							
						} 
			    	});
	  
	  
	      		this.form.submit();
	  
	   	  });
    });
</script>
</body>
</html>
