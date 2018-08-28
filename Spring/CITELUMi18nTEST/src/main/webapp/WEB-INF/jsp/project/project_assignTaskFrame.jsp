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
.icon {
	width: 40px;
	border-radius: 100%;
}

.assigned > a > i {
	color: red; !important
}

.unassigned > a > i {
	color: green; !important
	-webkit-filter: grayscale(100%); !important
}

</style>
</head>

<body style="background: white;">
	
	<c:set var = "level0FolderCounter" value = "${0}"/>
	<c:set var = "level1FolderCounter" value = "${0}"/>
	<c:set var = "level2FolderCounter" value = "${0}"/>
	<c:set var = "level3FolderCounter" value = "${0}"/>
	
	<c:set var = "rootFileCounter" value = "${0}"/>
	<c:set var = "level1FileCounter" value = "${0}"/>
	<c:set var = "level2FileCounter" value = "${0}"/>
	<c:set var = "level3FileCounter" value = "${0}"/>
	
	<div id="jstree_project_database" style="background: none;">
		<c:forEach var="root" items="${listProjectsFolders}"
			varStatus="rootCaaounter">
			<c:if test="${root.parent == '#' && root.is_file == 0}" >
			<c:set var = "level0FolderCounter" value = "${level0FolderCounter + 1}"/>
				<ul>
					<li class="parentFolder level0FolderNum${level0FolderCounter}" identity="${root.id}">${root.description}
						<ul>
							<c:forEach var="level1" items="${listProjectsFolders}"
								varStatus="sectionLoop">
								<c:if test="${level1.parent == root.nodeId && level1.is_file == 0}">
								<c:set var = "level1FolderCounter" value = "${level1FolderCounter + 1}"/>
									<li class="parentFolder level1FolderNum${level1FolderCounter}" identity="${level1.id}">${level1.description}
										<ul>
											<c:forEach var="level2" items="${listProjectsFolders}"
												varStatus="sectionLoop">
												<c:if test="${level2.parent == level1.nodeId && level2.is_file == 0}">
												<c:set var = "level2FolderCounter" value = "${level2FolderCounter + 1}"/>
													<li class="parentFolder level2FolderNum${level2FolderCounter}" identity="${level2.id}">${level2.description}
														<ul>
															<c:forEach var="level3" items="${listProjectsFolders}"
																varStatus="sectionLoop">
																<c:if test="${level3.parent == level2.nodeId && level3.is_file == 0}">
																<c:set var = "level3FolderCounter" value = "${level3FolderCounter + 1}"/>
																	<li class="parentFolder level3FolderNum${level3FolderCounter}" identity="${level3.id}">${level3.description}
																		<ul>
																			<c:forEach var="level4"
																				items="${listProjectsFolders}"
																				varStatus="sectionLoop">
																				<c:choose>
																				    <c:when test="${ getCurrentStaffId == level4.staff.id}">
																				    	<c:set var = "salary" scope = "session" value = "     current = database level2"/>
																				    	<c:set var = "opened" scope = "session" value = "true"/>
																				    	<c:set var = "selected" scope = "session" value = "true"/>
																				    	<c:set var = "disabled" scope = "session" value = "false"/>
																				    	<c:set var = "state" scope = "session" value = "unassigned"/>
																				        <br />
																				    </c:when>
																				    <c:when test="${level4.staff.id > 0 && getCurrentStaffId != level4.staff.id}">
																				    	<c:set var = "salary" scope = "session" value = "    database > 0 and != current level2"/>
																				    	<c:set var = "opened" scope = "session" value = "false"/>
																				    	<c:set var = "selected" scope = "session" value = "false"/>
																				    	<c:set var = "disabled" scope = "session" value = "true"/>
																				    	<c:set var = "state" scope = "session" value = "assigned"/>
																				        <br />
																				    </c:when>
																				    <c:when test="${level4.staff.id == null}">
																				    	<c:set var = "salary" scope = "session" value = "    database = null level2"/>
																				    	<c:set var = "opened" scope = "session" value = "true"/>
																				    	<c:set var = "selected" scope = "session" value = "false"/>
																				    	<c:set var = "disabled" scope = "session" value = "false"/>
																				    	<c:set var = "state" scope = "session" value = "unassigned"/>
																				        <br />
																				    </c:when>      
																				    <c:otherwise>
																				    	<c:set var = "salary" scope = "session" value = "31"/>
																				    	<c:set var = "opened" scope = "session" value = "true"/>
																				    	<c:set var = "selected" scope = "session" value = "false"/>
																				    	<c:set var = "disabled" scope = "session" value = "false"/>
																				        <br />
																				    </c:otherwise> 
																				</c:choose>
																				<c:if
																					test="${level4.parent == level3.nodeId && level4.is_file == 1}">

																					<li class="level4File ${state}" data-jstree='{"type":"file"}'
																						path="${level4.path}" identity="${level4.id}">${level4.description}</li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</li>
																</c:if>
																<c:choose>
																    <c:when test="${ getCurrentStaffId == level3.staff.id}">
																    	<c:set var = "salary" scope = "session" value = "     current = database level2"/>
																    	<c:set var = "opened" scope = "session" value = "true"/>
																    	<c:set var = "selected" scope = "session" value = "true"/>
																    	<c:set var = "disabled" scope = "session" value = "false"/>
																    	<c:set var = "state" scope = "session" value = "unassigned"/>
																        <br />
																    </c:when>
																    <c:when test="${level3.staff.id > 0 && getCurrentStaffId != level3.staff.id}">
																    	<c:set var = "salary" scope = "session" value = "    database > 0 and != current level2"/>
																    	<c:set var = "opened" scope = "session" value = "false"/>
																    	<c:set var = "selected" scope = "session" value = "false"/>
																    	<c:set var = "disabled" scope = "session" value = "true"/>
																    	<c:set var = "state" scope = "session" value = "assigned"/>
																        <br />
																    </c:when>
																    <c:when test="${level3.staff.id == null}">
																    	<c:set var = "salary" scope = "session" value = "    database = null level2"/>
																    	<c:set var = "opened" scope = "session" value = "true"/>
																    	<c:set var = "selected" scope = "session" value = "false"/>
																    	<c:set var = "disabled" scope = "session" value = "false"/>
																    	<c:set var = "state" scope = "session" value = "unassigned"/>
																        <br />
																    </c:when>      
																    <c:otherwise>
																    	<c:set var = "salary" scope = "session" value = "31"/>
																    	<c:set var = "opened" scope = "session" value = "true"/>
																    	<c:set var = "selected" scope = "session" value = "false"/>
																    	<c:set var = "disabled" scope = "session" value = "false"/>
																        <br />
																    </c:otherwise> 
																</c:choose>
																<c:if
																	test="${level3.parent == level2.nodeId && level3.is_file == 1}">
																	<li class="level3File ${state}" data-jstree='{ "type":"file","opened": ${opened},"selected": ${selected}, "disabled": ${disabled}, "loaded": "true" }' path="${level3.path}" identity="${level3.id}">${level3.description}</li>
																</c:if>
															</c:forEach>
														</ul>
													</li>
												</c:if>
												
												<c:choose>
												    <c:when test="${ getCurrentStaffId == level2.staff.id}">
												    	<c:set var = "salary" scope = "session" value = "     current = database level2"/>
												    	<c:set var = "opened" scope = "session" value = "true"/>
												    	<c:set var = "selected" scope = "session" value = "true"/>
												    	<c:set var = "disabled" scope = "session" value = "false"/>
												    	<c:set var = "state" scope = "session" value = "unassigned"/>
												        <br />
												    </c:when>
												    <c:when test="${level2.staff.id > 0 && getCurrentStaffId != level2.staff.id}">
												    	<c:set var = "salary" scope = "session" value = "    database > 0 and != current level2"/>
												    	<c:set var = "opened" scope = "session" value = "false"/>
												    	<c:set var = "selected" scope = "session" value = "false"/>
												    	<c:set var = "disabled" scope = "session" value = "true"/>
												    	<c:set var = "state" scope = "session" value = "assigned"/>
												        <br />
												    </c:when>
												    <c:when test="${level2.staff.id == null}">
												    	<c:set var = "salary" scope = "session" value = "    database = null level2"/>
												    	<c:set var = "opened" scope = "session" value = "true"/>
												    	<c:set var = "selected" scope = "session" value = "false"/>
												    	<c:set var = "disabled" scope = "session" value = "false"/>
												    	<c:set var = "state" scope = "session" value = "unassigned"/>
												        <br />
												    </c:when>      
												    <c:otherwise>
												    	<c:set var = "salary" scope = "session" value = "31"/>
												    	<c:set var = "opened" scope = "session" value = "true"/>
												    	<c:set var = "selected" scope = "session" value = "false"/>
												    	<c:set var = "disabled" scope = "session" value = "false"/>
												        <br />
												    </c:otherwise> 
												</c:choose>
												<c:if test="${level2.parent == level1.nodeId && level2.is_file == 1}">
													<li class="level2File ${state}" data-jstree='{"type":"file","opened": ${opened},"selected": ${selected}, "disabled": ${disabled}, "loaded": "true" }'
														path="${level2.path}" identity="${level2.id}">${level2.description}</li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:if>				
								<c:choose>
								    <c:when test="${ getCurrentStaffId == level1.staff.id}">
								    	<c:set var = "salary" scope = "session" value = "     current = database level2"/>
								    	<c:set var = "opened" scope = "session" value = "true"/>
								    	<c:set var = "selected" scope = "session" value = "true"/>
								    	<c:set var = "disabled" scope = "session" value = "false"/>
								    	<c:set var = "state" scope = "session" value = "unassigned"/>
								        <br />
								    </c:when>
								    <c:when test="${level1.staff.id > 0 && getCurrentStaffId != level1.staff.id}">
								    	<c:set var = "salary" scope = "session" value = "    database > 0 and != current level2"/>
								    	<c:set var = "opened" scope = "session" value = "false"/>
								    	<c:set var = "selected" scope = "session" value = "false"/>
								    	<c:set var = "disabled" scope = "session" value = "true"/>
								    	<c:set var = "state" scope = "session" value = "assigned"/>
								        <br />
								    </c:when>
								    <c:when test="${level1.staff.id == null}">
								    	<c:set var = "salary" scope = "session" value = "    database = null level2"/>
								    	<c:set var = "opened" scope = "session" value = "true"/>
								    	<c:set var = "selected" scope = "session" value = "false"/>
								    	<c:set var = "disabled" scope = "session" value = "false"/>
								    	<c:set var = "state" scope = "session" value = "unassigned"/>
								        <br />
								    </c:when>      
								    <c:otherwise>
								    	<c:set var = "salary" scope = "session" value = "31"/>
								    	<c:set var = "opened" scope = "session" value = "true"/>
								    	<c:set var = "selected" scope = "session" value = "false"/>
								    	<c:set var = "disabled" scope = "session" value = "false"/>
								        <br />
								    </c:otherwise> 
								</c:choose>
								<c:if test="${level1.parent == root.nodeId && level1.is_file == 1}">
									<li class="level1File ${state}" data-jstree='{"type":"file","opened": ${opened},"selected": ${selected}, "disabled": ${disabled}, "loaded": "true" }' path="${level1.path}" identity="${level1.id}">${level1.description}</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</c:if>
			<c:choose>
			    <c:when test="${ getCurrentStaffId == root.staff.id}">
			    	<c:set var = "salary" scope = "session" value = "     current = database level2"/>
			    	<c:set var = "opened" scope = "session" value = "true"/>
			    	<c:set var = "selected" scope = "session" value = "true"/>
			    	<c:set var = "disabled" scope = "session" value = "false"/>
			    	<c:set var = "state" scope = "session" value = "unassigned"/>
			        <br />
			    </c:when>
			    <c:when test="${root.staff.id > 0 && getCurrentStaffId != root.staff.id}">
			    	<c:set var = "salary" scope = "session" value = "    database > 0 and != current level2"/>
			    	<c:set var = "opened" scope = "session" value = "false"/>
			    	<c:set var = "selected" scope = "session" value = "false"/>
			    	<c:set var = "disabled" scope = "session" value = "true"/>
			    	<c:set var = "state" scope = "session" value = "assigned"/>
			        <br />
			    </c:when>
			    <c:when test="${root.staff.id == null}">
			    	<c:set var = "salary" scope = "session" value = "    database = null level2"/>
			    	<c:set var = "opened" scope = "session" value = "true"/>
			    	<c:set var = "selected" scope = "session" value = "false"/>
			    	<c:set var = "disabled" scope = "session" value = "false"/>
			    	<c:set var = "state" scope = "session" value = "unassigned"/>
			        <br />
			    </c:when>      
			    <c:otherwise>
			    	<c:set var = "salary" scope = "session" value = "31"/>
			    	<c:set var = "opened" scope = "session" value = "true"/>
			    	<c:set var = "selected" scope = "session" value = "false"/>
			    	<c:set var = "disabled" scope = "session" value = "false"/>
			        <br />
			    </c:otherwise> 
			</c:choose>
			<c:if test="${root.parent == '#' && root.is_file == 1}">
				<ul>
					<li class="level0File ${state}" data-jstree='{"type":"file","opened": ${opened},"selected": ${selected}, "disabled": ${disabled}, "loaded": "true" }' path="${root.path}" identity="${root.id}">${root.description}</li>
				</ul>
			</c:if>
		</c:forEach><br/>
		
		
	</div>
	<br/><br/><br/><br/>
		
		
		
		
		
		
		
		

<!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>
    
    
<!--     Load page-specific scripts -->
	<!-- 5 include the minified jstree source -->
	<script src="${pageContext.request.contextPath}/vendors/jstree/dist/jstree.min.js"></script>
	<script>
		$('.list-group').on('click', function() {
			$this = $(this);

			$('.active').removeClass('active');
			$this.toggleClass('active')

			function simpleFunc(someargument) { //value of this argument depends on clicked item and can be (foo|bar|foobar ) etc
				document.write(someargument) // here whould be written some text (foo|bar|foobar ) etc
			}
		})
	</script>
	
	<script>
		$(function() {

			
			
			/*		Initiate left treeview //*/
			
			//============================================= START JSTREE DATABASE CONFIGURATIONS =============================================
			
				//$('#jstree_PLACEBO').jstree({});
				
			// open all nodes  ------
			var tree = $("#jstree_project_database");
			    tree.bind("loaded.jstree", function (event, data) {
			        tree.jstree("open_all");
			    });
			 // open all nodes  ------    

			$('#jstree_project_database').jstree({
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
					"large_drop_target" : false
				},
				rules : { clickable : ["file"]},

				"plugins" : [ /*"dnd",*/ "search",
				/*"state",*/"types", "wholerow", "checkbox", /*"sort"*/
				, /*"contextmenu",*/ "unique", "conditionalselect" ],
				  conditionalselect : function (node) { return this.is_leaf(node); }

			}).bind("loaded.jstree", function (event, data) {
			    $(this).jstree("open_all");
			});
			
			// make folders unclickable  ------
			(function ($, undefined) {
			    "use strict";
			    $.jstree.defaults.conditionalselect = function () { return true; };
			    $.jstree.plugins.conditionalselect = function (options, parent) {
			        // own function
			        this.activate_node = function (obj, e) {
			            if(this.settings.conditionalselect.call(this, this.get_node(obj))) {
			                parent.activate_node.call(this, obj, e);
			            }
			        };
			    };
			})(jQuery);
			// make folders unclickable  ------

			$("#jstree_project_database").find(' .parentFolder > a > .jstree-checkbox').remove()   // remove folder checkboxes
			
			//============================================= END JSTREE DATABASE CONFIGURATIONS =============================================
			
			
			//============================================= START CHECK PROJECT JSTREE STATUS ==============================================
			/*
			if ( !${getProjectTemplateState} ) {
		
				var data = null;
	 		  	
	 		  	$('#jstree_project_database').jstree(true).settings.core.data;
		    	data = $('#jstree_project_database').jstree().get_json('#', {flat:true})
				
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
			*/
			//============================================= END CHECK PROJECT JSTREE STATUS ==============================================
				
				
	
				
				
				
			$("button").click(function(){
				

					 var root = $("#jstree_project_database .root > a");
					 
					 root.each(function(idx, li) {
						 var product = $(li);

							 console.log(product.hasClass("jstree-clicked") )
					     	 console.log(idx)
					     	 console.log("000000000")

					 });

				
				
				// Level 0 files --> ROOT FILES
					console.log("INICIO DO FOR root files" )					 
						
					var rootPosition = $("#jstree_project_database .level0File" );
					
					rootPosition.each(function(idx, li) {

						console.log( $(li).find("a").text() )
						console.log( $(li).find("a").hasClass("jstree-clicked") )
	
					});
					console.log("FIM DO FOR root files")
					
				console.log("===========================================BREAK 1")
				// Level 1 files --> inside ROOT Folders
				
					console.log("COUNT:      " + ${level0FolderCounter} )
				var numOfFoldersInLevel0 = ${level0FolderCounter};
				
				for ( i = 1; i <= numOfFoldersInLevel0; i++) {
					
					console.log("INICIO DO FOR - Level 1 files" )					 
						
					var position = $("#jstree_project_database .level0FolderNum" + i + " .level1File" );
					
					position.each(function(idx, li) {
						console.log("iteration:      " + i)
						console.log( $(li).find("a").text() )
						console.log( $(li).find("a").hasClass("jstree-clicked") )
	
	
					});
					console.log("FIM DO FOR - Level 1 files")
				
				}
				
				console.log("===========================================BREAK 2")
				// Level 2 files --> inside LEVEL1 Folders
				
					console.log("COUNT:      " + ${level1FolderCounter} )
				var numOfFoldersInLevel1 = ${level1FolderCounter};
				
				for ( i = 1; i <= numOfFoldersInLevel1; i++) {
					
					console.log("INICIO DO FOR - Level 2 files" )						 
						
					var position = $("#jstree_project_database .level1FolderNum" + i + " .level2File" );
					
					position.each(function(idx, li) {
						console.log(i)
						console.log( $(li).find("a").text() )
						console.log( $(li).find("a").hasClass("jstree-clicked") )
	
	
					});
					console.log("FIM DO FOR - Level 2 files")
				}
				
				console.log("===========================================BREAK 3")
				// Level 3 files --> inside LEVEL2 Folders
				
					console.log("COUNT:      " + ${level2FolderCounter} )
				var numOfFoldersInLevel2 = ${level2FolderCounter};
				
				for ( i = 1; i <= numOfFoldersInLevel2; i++) {
					
					console.log("INICIO DO FOR - Level 2 files" )						 
						
					var position = $("#jstree_project_database .level2FolderNum" + i + " .level3File" );
					
					position.each(function(idx, li) {
						console.log(i)
						console.log( $(li).find("a").text() )
						console.log( $(li).find("a").hasClass("jstree-clicked") )
	
	
					});
					console.log("FIM DO FOR - Level 2 files")
				}
				
				console.log("===========================================BREAK 4")
				// Level 4 files --> inside LEVEL3 Folders
				
				console.log("COUNT:      " + ${level3FolderCounter} )
				var numOfFoldersInLevel3 = ${level3FolderCounter};
				
				for ( i = 1; i <= numOfFoldersInLevel3; i++) {
					
					console.log("INICIO DO FOR - Level 3 files" )						 
						
					var position = $("#jstree_project_database .level3FolderNum" + i + " .level4File" );
					
					position.each(function(idx, li) {
						console.log(i)
						console.log( $(li).find("a").text() )
						console.log( $(li).find("a").hasClass("jstree-clicked") )
	
	
					});
					console.log("FIM DO FOR - Level 3 files")
				}
				

				
				
				});
			
			
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
								"plugins" : [ /*"dnd",*/ /*"search",*/ "state",
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
								//console.log(data)


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
	
			
			//jstree_project_database  ON CHANGE EVENT

			$(function() {
				$('#jstree_project_database').on('changed.jstree', function(e, data) {
					
					$("#jstree_project_database").find(' .parentFolder > a > .jstree-checkbox').remove()   // remove folder checkboxes
					
					
					
					$('#jstree_project_database').jstree(true).settings.core.data;
			    	information = $('#jstree_project_database').jstree().get_json('#', {flat:true})
					//console.log(information)
					
					//Ajax POST to the back end
					jQuery.ajax({ 
		 	    		url: '${pageContext.request.contextPath}/web/assignTasksProjectId=${getCurrentProjectId}/user=${getCurrentStaffId}',
		 	    		type: "POST", 
		 	    		data: JSON.stringify( { chaptersArray: information } ),
		 	    		contentType: 'application/json',
		 	    		//dataType: 'json',
		 	    		success: function(){
					    	//alert("project Chapters successfully saved")
		 	    			//console.log('success');
					    	//window.location.replace("${pageContext.request.contextPath}/web/project${getCurrentProjectId}");
		 	    		  }
		 	    	});
	
					//console.log(data.node.id);
				});
			});
			
			

		});
	</script>

</body>
</html>