<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Citelum Proposals</title>

<!-- Bootstrap -->
<link href="template/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="template/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="template/build/css/custom.css" rel="stylesheet">
<link href="../style/styles.css" rel="stylesheet">

<style type="text/css">
      .icon {
        width: 40px;
        border-radius: 100%;
      }
      
      .documentFrame {
      
      border-left:1px solid lightgrey;
      margin-left:-1px;
      
      }
      
      
</style>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div id="collapsable_sidebar" class="collapse in">
				<div class="col-md-3 left_col">
					<div class="left_col scroll-view">
						<div class="navbar nav_title" style="border: 0; height: auto">
							<a href="#" class="site_title"
								style="height: auto; padding: 5px; width: auto;"
								id="citelum_logo_sidebar"><img
								src="../pictures/logo.png"
								style="max-height: 60px; background-color: #ECF0F1; padding: 5px; width: 150px"
								title="Citelum"></a>
							<div class="nav toggle" style="float: right">
								<a id="menu_toggle" style="color: #ECF0F1"><i
									class="fa fa-bars"></i></a>
							</div>
						</div>

						<div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile" style="height: 80px;">
              <div class="profile_pic">
                <img src="../pictures/user.jpg" alt="..." class="img-circle profile_img" style="height:44px; width:44px;">
              </div>
              <div class="profile_info">
                <h2>Michel Henaff</h2>
	
                <span>Proafat Leader</span>
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
                  <li><a><i class="fa fa-edit"></i> Projets<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="project_list.jsp">Liste des projets</a></li>
                      <li><a href="#">Créer un projet</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Notifications</a>

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

<!--

                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Tables</a></li>
                      <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.html">Fixed Footer</a></li>
                    </ul>
                  </li>
-->

                </ul>
              </div>
<!--
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>
              -->

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->

<!--
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
-->

            <!-- /menu footer buttons -->
          </div>
        </div>
</div>
        <!-- top navigation -->
        <div class="top_nav">


          <div class="nav_menu" style="height: auto">
<h1 style="text-align: center">Citelum Proposals</h1>



<!--
            <nav class="" role="navigation">

              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              
<button data-toggle="collapse" data-target="#collapsable_sidebar">Collapsible</button>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>


                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>


              </ul>
            </nav>
-->

          </div>


        </div>
        <!-- /top navigation -->




















			<!-- page content ========================================================= -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Projet : {Nom du projet}</h3>
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
								<div class="x_title">
								
								
								<span>
								
                    <img src="template/production/images/img/info.PNG" class="icon"/>
                    <img src="template/production/images/img/chat.PNG" class="icon"/>
                    <img src="template/production/images/img/attach.PNG" class="icon"/>
                    <a href="project_preview.jsp"><img src="template/production/images/img/flow-tree.PNG" class="icon" /></a>
                    <img src="template/production/images/img/users.PNG" class="icon"/>
                    <a href="project_detail.jsp"><img src="template/production/images/img/document.PNG" class="icon"/></a>
                    <img src="template/production/images/img/export.PNG" class="icon"/>
                    <img src="template/production/images/img/lock.PNG" class="icon"/>
                    <img src="template/production/images/img/lock-open.PNG" class="icon"/>
                    <a href="project_list.jsp"><img src="template/production/images/img/exit.PNG" class="icon"/></a>
                    </span>
                  
                  <div class="clearfix"></div>
								
								<br/>
								

									<!--                     <ul class="nav navbar-right panel_toolbox">
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
                    </ul> -->

									<div class="clearfix"></div>

								</div>
								<div class="x_content">
									<div class="container-fluid">
										<div class="row">
											<div class="col-xs-12 col-lg-4" style="border-right:1px solid lightgrey">
											
												





<!-- <div class="css-treeview">



 =============================================================================  DB data  -->

				<br/><br/><br/>


				HEYYYYYYYYYYYYYYYYYYYYYYYYYY

													<c:if test="${!empty listFolders}">
	<table class="tg">
	<tr>
		<th width="80">Folder ID</th>
		<th width="120">Folder Parent</th>
		<th width="120">Folder Path</th>
		<th width="120">Folder Description</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listFolders}" var="folder">
		<tr>
			<td>${folder.id} </td>
			<td>${folder.path}</td>
			<td>${folder.chapter}</td>
			<td>${folder.description}</td>
			<td><a href="<c:url value='/api/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/api/remove/${person.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>


			not hey anymore

<br/><br/><br/>






		<form action="../services/load" method="POST" enctype="multipart/form-data" target="frame">
  <button type="submit" name="your_name" value="your_value" class="btn-link">Go</button>
</form>
<br/><br/><br/><br/>


sup
<br/><br/><br/>

<!--  
<c:forEach var="rootCategory" items="${allCategories}" varStatus="rootCategoryLoop">
    <c:if test="${rootCategory.rootCategoryId eq product.rootCategoryId}">
        <c:forEach var="category" items="${rootCategory.categories}" varStatus="categoryLoop">
            <c:if test="${category.categoryId eq product.categoryId}">
                <c:forEach var="subCategory" items="${category.subCategories}" varStatus="subCategoryLoop">
                    <c:choose>
                        <c:when test="${subCategory.subCategoryId eq product.subCategoryId}">
                            <div>${subCategory.subCategoryName}</option>
                        </c:when>
                        <c:otherwise>
                            <div}">${subCategory.subCategoryName}</option>
                        </c:otherwise>
                    </c:choose>  
                </c:forEach>
            </c:if> 
        </c:forEach>
    </c:if>
</c:forEach>
-->

<!--  
<c:forEach var="folder" items="${listFolders}" varStatus="foldersLoop">
	<c:if test="${folder.chapter == 0}">
		<ul>
			<li><input type="checkbox" id="item-0" /><label
				title="1"
				for="item-0">${folder.description}</label>
					
					<c:if test="${folder.chapter == 1 && folder.section == 0}">
						<ul>
							<li><input type="checkbox" id="item-0-0" /><label
								title="1"
								for="item-0">${folder.description}</label>
								
								<c:if test="${folder.sub_section == 0}">
									<ul>
										<li><input type="checkbox" id="item-0-0-0" /><label
											title="1"
											for="item-0">${folder.description}</label>
							
							
							    		</li>
							    	</ul>
							    </c:if>
				    
				
				    		</li>
				    	</ul>
				    </c:if>
    
    

    		</li>
    	</ul>
    </c:if>
    
    
    
    
</c:forEach>

-->


<c:forEach var="chapter" items="${listFolders}" varStatus="foldersLoop">
	<c:if test="${chapter.chapter == 1 && chapter.section == 0 && chapter.sub_section == 0 && chapter.parent == 0}">
		<ul>
						
			<li><input type="checkbox" id="item-0" /><label
				title="1"
				for="item-0">${chapter.description} a</label>
					
					<ul>
						<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
							<c:if test="${section.chapter == 1 && section.section == 1 && section.sub_section == 0 && section.parent == 0}">
									<li><input type="checkbox" id="item-0-0-0" /><label
										title="1"
										for="item-0">${section.description} b</label>
											
										<ul>
											
											<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
												<c:if test="${subSection.chapter == 1 && subSection.section == 1 && subSection.sub_section == 1 && subSection.parent == 0}">
														<li><input type="checkbox" id="item-0-0-0" /><label
															title="1"
															for="item-0">${subSection.description} c</label>
																<ul>
																
																
																
																
																
																	<c:forEach var="subSectionChild" items="${listFolders}" varStatus="subSectionChildLoop">
																		<c:if test="${subSectionChild.chapter == 1 && subSectionChild.section == 1 && subSectionChild.sub_section == 1 && subSectionChild.parent == 1}">
																				<li><a href="#">${subSectionChild.description} d</a>   
																						
																	    		</li>
																	    	
																	    </c:if>
																	    
																	</c:forEach>
																
																</ul>
											    		
											    		</li>
											    	
											    </c:if>
											    
											    <c:if test="${subSection.chapter == 1 && subSection.section == 1 && subSection.sub_section == 0 && subSection.parent == 1}">
													
														<li><a href="#">${subSection.description} d</a>
																
											    		</li>
											    </c:if>
											</c:forEach>

										</ul>
						    		</li>
						    	
						    </c:if>
						    
						    <c:if test="${section.chapter == 1 && section.section == 0 && section.sub_section == 0 && section.parent == 1}">
								
									<li><a href="#">${section.description} e</a>
											
						    		</li>
						    </c:if>
						</c:forEach>
					</ul>
					
				</li>
			

		</ul>
    </c:if>

</c:forEach>

<br/> second try<br/><br/><br/>

<!--  =====================================================================================  -->


<!--  
						<% 
							
						
						
							for(int i = 0; i < 10; i+=1) { %>
					             
					            <% } %>
					        -->


${maxId}




max test  dafag
<br/><br/><br/>
<div id="click" style="background-color=red;" >  
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
</div>

				<form id="01" action="${pageContext.request.contextPath}/loaded" method="post">

    <p>Single-selection radiobuttons.
    <br></br>  
    <div style="background-color=red;" >  
	<input id="11" type="radio" value="1example" name="jsTestValue">1example</option> 
	<br/>
    </div>
    <input id="21" type="radio" value="2merged" name="jsTestValue">2merged</option>
    <input id="31" type="radio" value="3result" name="jsTestValue">3result</option>
<br></br>
</form>

			
			Your selected file is:<c:if test="${not empty message}">
    ${message}
</c:if>
			
				<p>Open it?	
				<form action="services/load" method="post" enctype="multipart/form-data">
				<input type="submit" id="h4x" name="Open" value="Open" /></p>
				</form>	

---------------------------------------------------------------
		
	
	
	
					
<c:forEach var="chapter" items="${listFolders}" varStatus="foldersLoop">
	
	<c:if test="${chapter.parent == 0}">
		
		<ul>	<form id="0a1" action="" method="post">
			<input type="radio" name="item-0" value="chapter" id="1">desc-${chapter.description} 
				ID- ${chapter.id} ta</option>
				<input type="radio" name="item-0" value="chapter.id" id="2">desca-${chapter.description} 
				IDa- ${chapter.id} taa</option>
					<button onclick="myFunction()" submit="submit">Click me</button>
					</form>
					<ul>
						
						
						
					   		<c:forEach var = "y" begin = "0" end = "${maxId}">		<!-- start y loop -->
						
						
						<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
					   		
							
							
							
							<c:if test="${section.parent == chapter.id && section.parent == y && section.is_file == 0}">
							
									<li><input type="checkbox" id="item-0-0-0" /><label
										title="1"
										for="item-0">${section.description} b</label>
											
										<ul>
											
											<c:forEach var = "z" begin = "0" end = "${maxId}">		<!-- Start second z loop -->
											
											
											<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
												<c:if test="${subSection.parent == section.id && subSection.parent == z && subSection.is_file != 1}">
														<li><input type="checkbox" id="item-0-0-0" /><label
															title="1"
															for="item-0">${subSection.description} c</label>
																<ul>
																
																	<c:forEach var = "a" begin = "0" end = "${maxId}">		<!-- Start third a loop -->
																	
																	
																	
																	<c:forEach var="subSectionChild" items="${listFolders}" varStatus="subSectionChildLoop">
																	
																	
																		<c:if test="${subSectionChild.parent == subSection.id && subSectionChild.parent == a && subSectionChild.is_file == 1}">
																				<li><a href="#">${subSectionChild.description} d</a>
																						
																	    		</li>
																	    	
																	    </c:if>
																	    
																	</c:forEach>
																	
																	
																	</c:forEach>  <!-- End third a loop -->
																	
																</ul>
											    		
											    		</li>
											    	
											    </c:if>
											    
											   
											</c:forEach>
											
											</c:forEach>  <!-- End second z loop -->
											
											
											
											<c:forEach var = "b" begin = "0" end = "${maxId}">		<!-- Start second b loop -->
											
											
											<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
												
											    <c:if test="${subSection.parent == section.id && subSection.parent == b && subSection.is_file == 1}">
													
														<li><a href="#">${subSection.description} d</a>
																
											    		</li>
											    </c:if>
											</c:forEach>
											
											</c:forEach>  <!-- End second b loop -->

										</ul>
						    		</li>
						    	
						    </c:if>

									    
						</c:forEach>
						
						
						    </c:forEach>  <!-- end y loop -->
						
						
						
						
						
					   		<c:forEach var = "i" begin = "0" end = "${maxId}">		<!-- start i loop -->
					   		
					   		
					   		
						<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
					   		
							
	    
						    <c:if test="${section.parent == chapter.id && section.parent == i && section.is_file == 1}">
								
									<li><a href="#">${section.description} f</a>
											
						    		</li>
						    </c:if>
						    
						    
						    
						    
						    
						</c:forEach>
						
						
						    </c:forEach>  <!-- end i loop -->
						
						
						
						
					</ul>
					
				</li>
			

		</ul>
		
    </c:if>
	
</c:forEach>


<!--  ========================================   WORKING LIST DEMO    =============================================  -->
<!--
<br/><br/><br/>
<c:forEach var="chapter" items="${listFolders}" varStatus="foldersLoop">
	
	<c:if test="${chapter.parent == 0}">
		
		<ul>
						
			<li><input type="checkbox" id="item-0" /><label
				title="1"
				for="item-0">${chapter.description} a</label>
					
					<ul>
						<c:forEach var="section" items="${listFolders}" varStatus="sectionLoop">
					   		
					   		<c:forEach var = "i" begin = "0" end = "${maxId}">		
							
							
							
							<c:if test="${section.parent == chapter.id && section.parent == i && section.is_file == 0}">
							
									<li><input type="checkbox" id="item-0-0-0" /><label
										title="1"
										for="item-0">${section.description} b</label>
											
										<ul>
											
											<c:forEach var = "i" begin = "0" end = "${maxId}">		
											
											
											<c:forEach var="subSection" items="${listFolders}" varStatus="subSectionLoop">
												<c:if test="${subSection.parent == section.id && subSection.parent == i && subSection.is_file == 0}">
														<li><input type="checkbox" id="item-0-0-0" /><label
															title="1"
															for="item-0">${subSection.description} c</label>
																<ul>
																
																	<c:forEach var = "i" begin = "0" end = "${maxId}">		
																	
																	
																	
																	<c:forEach var="subSectionChild" items="${listFolders}" varStatus="subSectionChildLoop">
																	
																	
																		<c:if test="${subSectionChild.parent == subSection.id && subSectionChild.parent == i && subSectionChild.is_file == 0}">
																				<li><a href="#">${subSectionChild.description} d</a>
																						
																	    		</li>
																	    	
																	    </c:if>
																	    
																	</c:forEach>
																	
																	
																	</c:forEach>  
																	
																</ul>
											    		
											    		</li>
											    	
											    </c:if>
											    
											    <c:if test="${subSection.parent == section.id && subSection.parent == i && subSection.is_file == 1}">
													
														<li><a href="#">${subSection.description} d</a>
																
											    		</li>
											    </c:if>
											</c:forEach>
											
											</c:forEach>  

										</ul>
						    		</li>
						    	
						    </c:if>
						    
						    <c:if test="${section.parent == chapter.id && section.parent == i && section.is_file == 1}">
								
									<li><a href="#">${section.description} f</a>
											
						    		</li>
						    </c:if>
						    
						    
						    </c:forEach>  
						    
						    
						    
						</c:forEach>
						
					</ul>
					
				</li>
			

		</ul>
		
    </c:if>
	
</c:forEach>

-->

<!--  ========================================  END WORKING LIST DEMO    =============================================  -->

















<br/><br/><br/>
end sup
<br/><br/><br/>


												</div>
											</div>
											<div id="detailframe" class="col-xs-12 col-lg-8 documentFrame" >
												<iframe name="frame" class="frame" src="ckeditor.jsp"
													style="width: 100%; height: 100%; min-height: 800px"
													width="100%" height="1000px" frameborder="0"></iframe>
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
				<div class="pull-right">© 2017 Citelum</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>






	<!-- jQuery -->
	<script src="template/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="template/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="template/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="template/vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="template/build/js/custom.min.js"></script>
	
<script>
$(function() {
    $('#01').each(function() {
        $(this).find('input').click(function() {

            	alert(this.value);
                this.form.submit();
      
        });
     //   $(this).find('input[type=submit]').hide();
    });
});
$(function() {
    $('div').click(function() {
    	//alert("div found");
        $(this).find('li').click(function() {

            	alert("li found");
               // this.form.submit();
      
        });
     //   $(this).find('input[type=submit]').hide();
    });
});
</script>
</body>

</html>


