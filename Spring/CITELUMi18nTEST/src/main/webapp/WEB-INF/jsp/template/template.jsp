<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- @ page session="false"--%>


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
<!--     /Load CSS and scripts common to all pages -->

<!--     Load page specific scripts and css  -->
	<!-- jQuery core 3.2.1 -->    
<!--     <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->

    <!-- 2 load the theme CSS file -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/style.min.css" />
<!--     /Load page specific scripts and css  -->
  <style>
    .icon {
	    width: 40px;
	    border-radius: 100%;
	}
      
   	.file-upload input {
	    display: none;
	}
	
	.file-upload img {
	    /*width: 80px;*/
	    margin-top: 1px;
	    margin-left: 0px;
	    cursor: pointer;
	}
	
	.file-add img {
	    /*width: 80px;*/
	    margin-top: 1px;
	    margin-left: 0px;
	    cursor: pointer;
	    margin-left
	}
	
	.newFolder {
		margin-top: 0px;
	    margin-left: 2px;
	    cursor: pointer;
	}
	
	.saveButton {
		background: red; 
		height: 30px; 
		width: 30px; 
		padding: 0px;
		margin-left: 10px;
	}
	
	.saveButton > i {
		/*color: yellow;*/
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

        <!-- page content ============================================-->

<div class="right_col" role="main">
	<div class="page-title">
		<div class="title_left">
        	<h3><i class="fa fa-sitemap"></i> Librairie des Contenus</h3>
      		</br>
      	</div>
    	<div class="title_right">
			<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"></div>
		</div>  	
    </div>
    <div class="clearfix"></div>
    	<div class="col-md-12 col-sm-12 col-xs-12" style="height: 100%">
    		<div class="x_panel">
    		<i class="fa fa-sitemap"></i> Librairie des Contenus > Base Documentaire	
    		 <div class="ln_solid"></div>
    			<div class="x_title">


    			<div class="col-md-4" style="text-align: center;">
    			<h3>Ajouter des fichiers</h3>
    			</div>
    				<div class="col-md-8" style="text-align: center;">
				    <h3>Base Documentaire</h3>
				    </div>
				    
				    <div class="clearfix"></div>
				</div>
				<div class = "container-fluid" style="height: 100%">
<!-- ==================================== -->


	<div id = "folderList" class = "col-md-4" style="height: 100%; border-right:1px solid lightgrey;">		
	<div class="col-md-12" style="margin-bottom: 5px;">
	
	<div class = "col-md-1" style="margin-right: 5px;">
		<button title="Ajouter nouveau dossier" id="addFolder" style="margin-left: -20px;background: none; height: 33px; width: 33px; padding: 0px">
			<img class="newFolder" alt="file" src="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/addFolder.png" width="24px">
		</button>
	</div>
	
	<div class = "col-md-1 file-add" style="margin-right: 30px;">
		<button id="addFile" title="Ajouter nouveau fichier" style="margin-left: -20px;background: none; height: 33px; width: 33px; padding: 0px">
		       <img alt="file" src="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/addFile.png" width="22px">
	    </button>
	</div>
	
	<div class = "col-md-8">
	
	<div class="file-upload" style="margin-right: 10px;">
		
	    <button title="Télécharger un nouveau fichier" style="background: none; height: 33px; width: 33px; padding: 0px">
			<label for="file-input" style="width: 20px;">
		        	<img alt="file" src="${pageContext.request.contextPath}/vendors/jstree/dist/themes/default/uploadFile.png" width="22px">
		    </label>
	    </button>
	    
		<form name="inputForm" action = "${pageContext.request.contextPath}/web/uploadme" method = "post" enctype = "multipart/form-data">
		<input id="file-input" type = "file" name = "file" size = "50" required="required" onchange="inputForm.submit()"/>
		<!--  Button to allow multiple files to be uploaded at once (messes up the upload to the database system in place) 
		 <input type="button" id="more_fields" onclick="add();" value="Add More?" />
		 --> 
		</form>
	</div>
	
	
	</div>

	<div class = "col-md-1" >
		<button class="saveButton" id = "saveJSON" title="Enregistrer les modifications" style="background: none; height: 33px; width: 33px; padding: 0px">
			<i class="glyphicon glyphicon-floppy-disk" style="font-size: 20px"></i>					
		</button>
	</div>

	</div>
	<br/><br/>

<!-- ==================================== -->

						<div  class = "">
						<!-- 
						<form hidden=true action="../services/load" method="POST" enctype="multipart/form-data" target="frame">
									<center><button type="submit" name="your_name" value="your_value" class="btn-primary openFile" 
									style='background: 595FFF; width: 100px; height: 30px'>Open File</button></center>
								</form>
								
						 -->
								
						<form id="iframeForm" action="../services/load" method="POST" enctype="multipart/form-data" target="frame">
									<center><button hidden=true id="iframeFormBtn" type="submit" name="your_name" value="your_value" class="btn-primary openFile" 
									style='background: 595FFF; width: 100px; height: 30px'>Open File</button></center>
								</form>
								
				<!------------------ JSTREE ------------------------>	





<div id="jstree_template"  style=" min-height: 200px; background: none;">
    <c:forEach var="root" items="${listFolders}" varStatus="foldersLoop">
        <c:if test="${root.parent == '#' && root.is_file == 0}">
            <ul>
            <li identity="${root.id}" dir="${root.dir}" path="${root.path}">${root.description}
                <ul>
                <c:forEach var="level1" items="${listFolders}" varStatus="sectionLoop">
                    <c:if test="${level1.parent == root.node_id && level1.is_file == 0}">
                        <li identity="${level1.id}" dir="${root.description}">${level1.description}
                            <ul>
                                <c:forEach var="level2" items="${listFolders}" varStatus="sectionLoop">
                                    <c:if test="${level2.parent == level1.node_id && level2.is_file == 0}">
                                        <li identity="${level2.id}" dir="${root.description}">${level2.description}
                                        <ul>
                                            <c:forEach var="level3" items="${listFolders}" varStatus="sectionLoop">
                                                <c:if test="${level3.parent == level2.node_id && level3.is_file == 0}">
                                                    <li identity="${level3.id}" dir="${root.description}">${level3.description}
                                                    <ul>
                                                        <c:forEach var="level4" items="${listFolders}" varStatus="sectionLoop">
                                                            <c:if test="${level4.parent == level3.node_id && level4.is_file == 1}">
                                                                <li data-jstree='{"type":"file"}' path="${level4.path}" identity="${level4.id}" dir="${root.description}" copied=false copiedDir="null">${level4.description}</li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                    </li>
                                                </c:if>
                                                <c:if test="${level3.parent == level2.node_id && level3.is_file == 1}">
                                                    <li data-jstree='{"type":"file"}' path="${level3.path}" identity="${level3.id}" dir="${root.description}" copied=false copiedDir="null">${level3.description}</li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                        </li>
                                     </c:if>
                                     <c:if test="${level2.parent == level1.node_id && level2.is_file == 1}">
                                        <li data-jstree='{"type":"file"}' path="${level2.path}" identity="${level2.id}" dir="${root.description}" copied=false copiedDir="null">${level2.description}</li>
                                     </c:if>
                                </c:forEach>
                            </ul>
                            </li>
                        </c:if>
                        <c:if test="${level1.parent == root.node_id && level1.is_file == 1}">
                            <li data-jstree='{"type":"file"}' path="${level1.path}" identity="${level1.id}" dir="${root.description}" copied=false copiedDir="null">${level1.description}</li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
            </ul>
        </c:if>
        <c:if test="${root.parent == '#' && root.is_file == 1}">
            <ul>
            <li data-jstree='{"type":"file"}' path="${root.path}" identity="${root.id}" dir='root' copied=false copiedDir="null">${root.description}</li>
            </ul>
        </c:if>
    </c:forEach><br/>
</div>


































<!--  

	<div id="jstree_template" style="margin-top: 10px;">
	<c:forEach var="chapter" items="${listFolders}" varStatus="foldersLoop">
		<c:if test="${chapter.parent == '#' && chapter.is_file == 0}">	
			<ul>
				<li>${chapter.description}
				<ul>		
						<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
							<c:if test="${section.parent == chapter.node_id && section.is_file == 0}">
								<li>${section.description}
								<ul>
										<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
											<c:if test="${subSection.parent == section.node_id && subSection.is_file == 0}">
												<li>${subSection.description}
												<ul>	
														<c:forEach var="subSectionChild" items="${listFolders}" varStatus="subSectionChildLoop">
															<c:if test="${subSectionChild.parent == subSection.node_id && subSectionChild.is_file == 1}">
															<li  data-jstree='{"type":"file"}' path="${subSectionChild.description}">${subSectionChild.description}</li>
															</c:if>
														</c:forEach>
													</ul>
												</li>
											</c:if>
										</c:forEach>
										<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
											<c:if test="${subSection.parent == section.node_id && subSection.is_file == 1}">
												<li  data-jstree='{"type":"file"}' path="${subSection.description}">${subSection.description}</li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:if>
						</c:forEach> 
						<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
							<c:if test="${section.parent == chapter.node_id && section.is_file == 1}">
								<li  data-jstree='{"type":"file"}' path="${section.description}">${section.description}</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</c:if>	
		<c:if test="${chapter.parent == '#' && chapter.is_file == 1}">
			<ul>
				<li  data-jstree='{"type":"file"}' path="${chapter.description}">${chapter.description}</li>
			</ul>
		</c:if>
	
	</c:forEach>	 

					
					

					
								
	</div>

-->					

</div>



<!-- <div class = "col-md-6" style="height: 100%">						
Nothing is working here	
<center><input type = "radio"  class="btn btn-primary" value = "Enregistrer nouveau chapitre" /></center>
</form>
</div> -->
</div>


							
						
<!--  =====================================  Right Column Starts here  =====================================  -->

<div id="detailframe" class="col-xs-12 col-lg-8 documentFrame" >
<button id = "toggle_folders" title ="Hide list" type= "button" class = "btn"> <span class="glyphicon glyphicon-chevron-left"></span></button>
								<br/><br/>
	<!-- name="frameRemove"  --- removes save button from the editor -->							
<iframe name="frame" class="frame" src="ckeditor" style="width: 100%; height: 100%; min-height: 800px"

								width="100%" height="1000px" frameborder="0"></iframe>	
</div>


								



                          <!--  =====================================  Right Column Ends here  =====================================  -->
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
    </div>

<!--     Load common scripts -->
    <%@ include file="../shared/imports_foot.jspf" %>
    
<!--     /Load common scripts -->

    <!-- 5 include the minified jstree source -->
	<script src="${pageContext.request.contextPath}/vendors/jstree/dist/jstree.min.js"></script>
  
    
<script>
// function to allow more upload sections
function add() {
	var newspan = document.createElement('span');
	newspan.innerHTML ='<input type="file" name="file" size="50" /> <br/>';
    document.getElementById('wrapper').appendChild(newspan);
}
</script>
<script>
  $(function () {
 	
	  
	  window.onbeforeunload = function(event) {
		    var s = "You have unsaved changes. Really leave?";

		    if ( !checkChangesSaved ) {
		    	
		    event = event || window.event;
		   
		    if (event) {
		        // This is for IE
		       // event.returnValue = s;
		    }

		    // This is for all other browsers
		    return s;
		    }
		}
	  
	  var checkChangesSaved = true;
	  
	  // JSTREE change Events Start

		$('#jstree_template').on('changed.jstree', function(e, data) {
			
			if ( data.action === "select_node" || data.action === "deselect_node") {

			} else {

				$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
				checkChangesSaved = false;		
			}			
			
		});
		
		$('#jstree_template').on('rename_node.jstree', function(e, data) {
			
				$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
				checkChangesSaved = false;
				
		});
		
		$('#jstree_template').on('paste.jstree', function(e, data) {
			
			$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
			checkChangesSaved = false;
			
		});
		
		$('#jstree_template').on('copy_node.jstree', function(e, data) {
			
			//$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
			//checkChangesSaved = false;
			
			//console.log(e)
			console.log(data)
			var getCurrentDir = data.original.li_attr.dir
			var getParentNode = $('#jstree_template').jstree(true).get_node(data.node.parent)
			
			if ( getCurrentDir == "root" ) {
				getCurrentDir = data.original.text.trim();
			}
			
			if ( data.node.type == "file" ) {
				getCurrentDir = "rootFile"
			}
			
			console.log(getCurrentDir + " getCurrentDir")
			data.node.li_attr.copied = true;
			data.node.li_attr.identity = 0;
			console.log(data)
			data.node.li_attr.copiedDir = getCurrentDir		
			
			var changeDir = getParentNode.li_attr.dir;
			
			if ( changeDir == "root" ) {
				changeDir = getParentNode.text.trim();
			}
			
			data.node.li_attr.dir = changeDir;
			
			
			for ( i = 0; i < data.node.children_d.length; i++) {
				console.log(i)
				
				var node = $('#jstree_template').jstree(true).get_node(data.node.children_d[i])
				
				node.li_attr.identity = 0
				node.li_attr.copied = true;
				node.li_attr.dir = changeDir;
				node.li_attr.copiedDir = getCurrentDir	
				console.log(changeDir)
				console.log(data.node.children_d[i] + " log")
			}
			
			console.log("***********************")
			
			//node.li_attr.identity = 0
			
			
			//console.log(node)
			
			
		});
		
		
		
		
		// JSTREE change Events End
		
	  $('#jstree_template').jstree({
		  "core" : {
	    	    "animation" : 0,
	    	    "themes" : { "stripes" : true },
	    	    "dblclick_toggle" : false,
	    	    "valid_children" : ["default", "file"],
	    	    "check_callback": true
	    	  },
	    	  "types" : {
	    	    "#" : {
	    	      "max_children" : 1000,
	    	      "max_depth" : 4,
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
    		  "large_drag_target" : true,
    		  "large_drop_target" : true
    	  },
    	  "plugins" : [
    	    "dnd", "search",
    	    /*"state"*/, "checkbox", "types", "wholerow", "unique" /*"sort"*/, "contextmenu"
    	  ],
    	  "contextmenu" : { 
    		  items : function (o) { // Could be an object directly
    				// TODO: in "_disabled" call this._check()
    				return {
    					
    					"rename" : {
    						"separator_before"	: false,
    						"separator_after"	: false,
    						"label"				: "Rename",
    						"action"			: function (data) {
    							var inst = $.jstree.reference(data.reference),
    								obj = inst.get_node(data.reference);
    							inst.edit(obj);
    						}
    					},
    					"remove" : {
    						"separator_before"	: false,
    						"icon"				: false,
    						"separator_after"	: false,
    						"label"				: "Delete",
    						"action"			: function (data) {
    							var inst = $.jstree.reference(data.reference),
    								obj = inst.get_node(data.reference);
    							inst.delete_node(obj);
    						}
    					},
    					"ccp" : {
    						"separator_before"	: true,
    						"icon"				: false,
    						"separator_after"	: false,
    						"label"				: "Edit",
    						"action"			: false,
    						"submenu" : {
    							"cut" : {
    								"separator_before"	: false,
    								"separator_after"	: false,
    								"label"				: "Cut",
    								"action"			: function (data) {
    									var inst = $.jstree.reference(data.reference),
    										obj = inst.get_node(data.reference);
    									inst.cut(obj);
    								}
    							},
    							"copy" : {
    								"separator_before"	: false,
    								"icon"				: false,
    								"separator_after"	: false,
    								"label"				: "Copy",
    								"action"			: function (data) {
    									var inst = $.jstree.reference(data.reference),
    										obj = inst.get_node(data.reference);
    									inst.copy(obj);
    								}
    							},
    							"paste" : {
    								"separator_before"	: false,
    								"icon"				: false,
    								"_disabled"			: !(this.can_paste()),
    								"separator_after"	: false,
    								"label"				: "Paste",
    								"action"			: function (data) {
    									var inst = $.jstree.reference(data.reference),
    										obj = inst.get_node(data.reference);
    									inst.paste(obj);
    								}
    							}
    						}
    					}
    				};
    			}
          }
    	});
	
	$('#jstree_template').on('ready.jstree', function() {
	    $("#jstree_template").jstree("open_all");          
	});
	  

	  var countFolders = 0;
	    
	    $("#addFolder").click(function () {
	    	
	    	countFolders = countFolders +1
	    	checkChangesSaved = false;
	    	$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
		    $("#jstree_template").jstree('create_node', '#', {'text' : 'Nouveau Dossier (' + countFolders + ")", li_attr : { "dir" :  "new folder dir", "path" :  'Nouveau Dossier (' + countFolders + ")" } }, 'last');
		    
	    });
	    
	    var countFiles = 0;  
	    
		$("#addFile").click(function () {
	    	
			countFiles = countFiles +1
	    	checkChangesSaved = false;
	    	$('.saveButton').find('i').removeClass('glyphicon-floppy-disk').addClass('glyphicon-floppy-remove');
		    
	    	var documentName = 'Nouveau fichier (' + countFiles + ")";
	    	
	    	$("#jstree_template").jstree('create_node', '#', {'text' : documentName, "type":"file", li_attr : { "path" :  documentName, "dir" :  "root", "newFile" : true } }, 'last');
		    
	    	//var data = $('#jstree_template').jstree().get_json('#', {flat:true})
	    	//console.log(data)
		    
		    //Create blank document
		    /*
		    jQuery.ajax({ 
 	    		url: '${pageContext.request.contextPath}/web/addBlankDocumentFile',
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
		    */
	    	
	    });
	    
		$("#saveJSON").click(function () {
			checkChangesSaved = true;
			
			$('.saveButton').find('i').removeClass('glyphicon-floppy-remove').addClass('glyphicon-floppy-saved');
			
			
 		  	var data = null;
 		  	$('#jstree_template').jstree(true).settings.core.data;

	    	data = $('#jstree_template').jstree().get_json('#', {flat:true})
	    	
	   		console.log(data)
	   		
	   		
	   		
	    	jQuery.ajax({ 
	 	    		url: '${pageContext.request.contextPath}/web/updateBaseDocumentaire',
	 	    		type: "POST", 
	 	    		data: JSON.stringify( { foldersArray: data } ),
	 	    		contentType: 'application/json',
	 	    		async: false,
	 	    		//dataType: 'json',
	 	    		success: function(){
				    	//alert("project Chapters successfully saved")
						console.log('success');
				    	//window.location.replace("${pageContext.request.contextPath}/web/upload");
	 	    		  }
	 	    	});
			
			
			
			
			
			

	    	location.reload();
			//$.jstree.reference($("#jstree_template")).refresh(-1);
	    	
			//$('#jstree_template').jstree(true).redraw(true);
			console.log("-----------break------------------")
			console.log(data)
	    	data = null;
 	   
 	   });	  
 	   
 	   
		$("#jstree_template").bind("select_node.jstree", function(evt, data){ 	
				if (data.node.type === "file") {
				
				/*
				console.log(data.node.parents.length)
				console.log(data.node.parents[data.node.parents.length-2])
				console.log(data.node)

*/
	
				console.log("--11111----")
				var nodeName;
				var templateName;
				var information
				
				if ( data.node.parents.length > 1 ) {
				
					nodeName = data.node.parents[data.node.parents.length-2]
					console.log(data.node.parents)
					templateName = $('#jstree_template').jstree(true).get_node(nodeName).text.trim()
					information = { filePath: data.node.li_attr.path, folderPath: "template\\" + templateName, currentPage: "templates" };
					
					
					console.log( templateName  + " templateName")
					
				
				} else {
					
					information = { filePath: data.node.li_attr.path, folderPath: "template", currentPage: "templates" };
					
				}
				
				
				
				
				

				
				//var information = { name: data.node.li_attr.path, id: "template\\" +templateName };
				
				console.log(information.name)
				
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
		
				}
		});
/*
		$("#jstree_template").bind("select_node.jstree", function(evt, data){
			
				if (data.node.type === "file") {
				
					var information = { PFolderID: data.node.li_attr.identity, id: "template", PFolderPath: data.node.li_attr.path };
		       		
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
					
				
			} 
		});
*/

 	});
  
	    </script>
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
					//console.log("HEY");
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
	   });
		</script>
  </body>
</html>