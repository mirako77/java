<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Citelum Proposals</title>

    <!-- Bootstrap -->
    <link href="../template/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../template/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../template/build/css/custom.css" rel="stylesheet">
    <link href="../../style/styles.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div id="collapsable_sidebar" class = "collapse in">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0; height: auto">
              <a href="#" class="site_title" style="height: auto;padding: 5px;width: auto;" id="citelum_logo_sidebar"><img src="../../pictures/logo.png" style="max-height:60px; background-color: #ECF0F1; padding: 5px;width: 150px" title="Citelum"></a>
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
                  <li><a><i class="fa fa-sitemap"></i>Librairie des contenus<span class="fa fa-chevron-down"></span></a>
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
   <div class="page-title">
     <div class="title_left">
       <h3>Liste des Projets</h3>
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
       <i class="fa fa-folder"></i><a href="profile" style="font-weight: bold;"> Tableau de bord </a> > Liste des Projets
       <div class="ln_solid"></div>
         <div class="x_title">
           <h2>Actif</h2>
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
          

            <!-- start project list -->

<c:if test="${!empty listProjects}">
	<table class="table table-striped projects">
  		<thead>
    		<tr>
      			<th style="width: 1%"></th>
				<th style="width: 20%">Nom du projet</th>
				<th>Membres de l'équipe</th>
				<th>L'avancement du projet</th>
				<th>Situation</th>
				<th style="width: 20%">Modifier</th>
  			</tr>
		</thead>
		<c:forEach items="${listProjects}" var="projects">
			<tbody>
				<tr>
			    	<td>${projects.id}</td>
					<td>
					  <a>${projects.title}</a><br/>
					</td>
					<td>
					  <ul class="list-inline">
					    <li>
					      <img src="../template/production/images/user.png" class="avatar" alt="Avatar">
					    </li>
					    <li>
					      <img src="../template/production/images/user.png" class="avatar" alt="Avatar">
					    </li>
					    <li>
					      <img src="../template/production/images/user.png" class="avatar" alt="Avatar">
					    </li>
					    <li>
					      <img src="../template/production/images/user.png" class="avatar" alt="Avatar">
					    </li>
					  </ul>
					</td>
					<td class="project_progress">
						<div class="progress progress_sm">
							<div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${projects.project_status}"></div>
						</div>
					<small>${projects.project_status}% Complete</small>
					</td>
					<td>
					  <button type="button" class="btn btn-success btn-xs">Success</button>
					</td>
					<td>
				  		<a href="project${projects.id}_edit" class="btn btn-info"><i class="fa fa-crosshairs "></i> <!-- -Edit --> </a>
				      	<a href="delete_project=${projects.id}" class="btn btn-default"><i class="fa fa-trash"></i></a>
				      	<a href="project${projects.id}" class="btn"><i class="fa fa-archive"></i> <!-- View  --></a>
				    </td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
</c:if><br/>
<a href="project_create" class="btn btn-info btn-xs" style="height: 30px; width: 180px; display:table-cell; vertical-align:middle; text-align:center; float: right; line-height: 25px;">
	<i class="fa fa-pencil" style="display:table-cell; vertical-align:middle; text-align:center; float: left; line-height: 25px;"></i> 
	Créer un nouveau projet 
</a>
<!-- end project list -->


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

    <!-- jQuery -->
    <script src="../template/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../template/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../template/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../template/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../template/build/js/custom.min.js"></script>
    
    <script src="../../scripts/template_manipulation.js"></script>
  </body>
</html>