<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
	
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        
        <%@ include file="../shared/sidebar.jspf" %>
        <!-- top navigation -->
        <%@ include file="../shared/top_navigation.jspf" %>
        <!-- /top navigation -->

        <!-- page content ============================================= -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3><i class="fa fa-home"></i> Tableau de bord</h3>
              </div> 
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">                 
                    <h2>Rapport de l'utilisateur</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li> -->
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <!-- end of image cropping -->
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="${pageContext.request.contextPath}/images/staff/${currentSessionCredentials.staff.picture_path}" alt="Avatar" title="Change the avatar">
<!-- 
                          Cropping modal
                          <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content">
                                <form class="avatar-form" action="crop.php" enctype="multipart/form-data" method="post">
                                  <div class="modal-header">
                                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                                    <h4 class="modal-title" id="avatar-modal-label">Avatar</h4>
                                  </div>
                                  <div class="modal-body">
                                    <div class="avatar-body">
                                      Upload image and data
                                      <div class="avatar-upload">
                                        <input class="avatar-src" name="avatar_src" type="hidden">
                                        <input class="avatar-data" name="avatar_data" type="hidden">
                                        <label for="avatarInput">Local upload</label>
                                        <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
                                      </div>
                                      Crop and preview
                                      <div class="row">
                                        <div class="col-md-9">
                                          <div class="avatar-wrapper"></div>
                                        </div>
                                        <div class="col-md-3">
                                          <div class="avatar-preview preview-lg"></div>
                                          <div class="avatar-preview preview-md"></div>
                                          <div class="avatar-preview preview-sm"></div>
                                        </div>
                                      </div>
                                      <div class="row avatar-btns">
                                        <div class="col-md-9">
                                          <div class="btn-group">
                                            <button class="btn btn-primary" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees">Rotate Left</button>
                                            <button class="btn btn-primary" data-method="rotate" data-option="-15" type="button">-15deg</button>
                                            <button class="btn btn-primary" data-method="rotate" data-option="-30" type="button">-30deg</button>
                                            <button class="btn btn-primary" data-method="rotate" data-option="-45" type="button">-45deg</button>
                                          </div>
                                          <div class="btn-group">
                                            <button class="btn btn-primary" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees">Rotate Right</button>
                                            <button class="btn btn-primary" data-method="rotate" data-option="15" type="button">15deg</button>
                                            <button class="btn btn-primary" data-method="rotate" data-option="30" type="button">30deg</button>
                                            <button class="btn btn-primary" data-method="rotate" data-option="45" type="button">45deg</button>
                                          </div>
                                        </div>
                                        <div class="col-md-3">
                                          <button class="btn btn-primary btn-block avatar-save" type="submit">Done</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </form>
                              </div>
                            </div>
                          </div>
                          /.modal
                           -->
                          
                          <!-- Loading state -->
                          <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
                        </div>
                        <!-- end of image cropping -->
                      </div>
                      <h3>${currentSessionCredentials.staff.name}</h3>

                      <ul class="list-unstyled user_data">
                        <li><i class="fa fa-map-marker user-profile-icon"></i> Paris, France
                        </li>

                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i> ${currentSessionCredentials.permission.description }
                        </li>
                      </ul>
                      <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Editer le profil</a>
                      <br />
                      <!-- start skills -->
                      <h4>Compétences</h4>
                      <ul class="list-unstyled user_data">
                        <li>
                          <p>Chef de projet</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
                          </div>
                        </li>
                        <li>
                          <p>Contrat vendeur</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="70"></div>
                          </div>
                        </li>
                        <li>
                          <p>Gestionnaire de données</p>
                          <div class="progress progress_sm">
                            <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="30"></div>
                          </div>
                        </li>
                      </ul>
                      <!-- end of skills -->
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                      <div class="profile_title">
                        <div class="col-md-6">
                          <h2>Rapport d'activité de l'utilisateur</h2>
                        </div>
                        <div class="col-md-6">
                        </div>
                      </div>
                      <!-- start of user-activity-graph -->
                      <br><br>
                      <!-- end of user-activity-graph -->

                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <c:choose>
							<c:when test="${ currentSessionCredentials.permissionLevel != localAdminLevel}">
	                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">notification</a>
	                          </li>
	                          <li role="presentation" class=""><a href="#tab_content2" id="tab" role="tab" data-toggle="tab" aria-expanded="false">Activité récente</a>
	                          </li>
	                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">projet en cours</a>
	                          </li>
							</c:when>
							<c:otherwise>
	                          <li role="presentation" class="active"><a href="#tab_content2" id="tab" role="tab" data-toggle="tab" aria-expanded="true">Activité récente</a>
							</c:otherwise>
						</c:choose>
<!--                           <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Profil</a>
                          </li> -->
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          
                          
                          
                       <c:choose>
						<c:when test="${ currentSessionCredentials.permissionLevel != localAdminLevel}">
                          
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <!-- start notifications activity -->
                            <ul class="messages">
                              
                              
                              <c:choose>
								<c:when test="${!empty listNotifications}">
									
										<c:forEach items="${listNotifications}" var="notification">
											<%--
											<c:if test="${ !projects.project_archived }">
												    	
											</c:if>
											 --%>
												<li>${notification.id}  ${notification.notifications}
										</c:forEach>
									
								</c:when>
								<c:otherwise>
									<br/><br/>
									<i>You have no active notifications</i>
								</c:otherwise>
							</c:choose>
                            <!-- end notifications activity -->
                          </div>
                        
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="tab">
                            <!-- start recent activity -->
                          	
                          	</c:when>
                          	<c:otherwise>
                          	<div role="tabpanel" class="tab-pane active fade in" id="tab_content2" aria-labelledby="home-tab">
							</c:otherwise>
						</c:choose> 
						
                            <ul class="messages">
                              <li>
                                <img src="${pageContext.request.contextPath}/images/picture2.jpg" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-info">24</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Andrew Melo</h4>
                                  <blockquote class="message">I just started using sublime as you requested, man this thing is lit </blockquote>
                                  <br />
                                  <p class="url">
                                    <span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
                                    <a href="#"> </a>
                                  </p>
                                </div>
                              </li>
                              <li>
                                <img src="${pageContext.request.contextPath}/images/img.jpg" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-error">21</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Afonso Catrau</h4>
                                  <blockquote class="message">There is a bug with the menu. Go get him! FAST!!.</blockquote>
                                  <br />
                                  <p class="url">
                                    <span class="fs1" aria-hidden="true" data-icon=""></span>
                                    <a href="#" data-original-title=""></a>
                                  </p>
                                </div>
                              </li>
                              <li>
                                <img src="${pageContext.request.contextPath}/images/picture.jpg" class="avatar" alt="Avatar">
                                <div class="message_date">
                                  <h3 class="date text-error">21</h3>
                                  <p class="month">May</p>
                                </div>
                                <div class="message_wrapper">
                                  <h4 class="heading">Francisco Filipe</h4>
                                  <blockquote class="message">whÄt dÖ yÖu mëÄn chÄngë 3ncÖdìng tÖ ♣UTF_8¿¿¿¿</blockquote>
                                  <br />
                                  <p class="url">
                                    <span class="fs1" aria-hidden="true" data-icon=""></span>
                                    <a href="#" data-original-title=""></a>
                                  </p>
                                </div>
                              </li>
                            </ul>
                            <!-- end recent activity -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">

                            <!-- start project list -->
							<c:choose>
								<c:when test="${!empty listProjects}">
									<table class="table table-striped projects">
								  		<thead>
								    		<tr>
								      			<th style="width: 1%"></th>
												<th style="width: 20%">Nom du projet</th>
												<th>Membres de l'équipe</th>
												<th>L'avancement du projet</th>
												<th>Date de remise</th>
								  			</tr>
										</thead>
										<c:forEach items="${listProjects}" var="projects">
										<c:if test="${ !projects.project_archived }">
											<tbody>
												<tr>
											    	<td>${projects.id}</td>
													<td>
													  <a>${projects.title}</a><br/>
													</td>
													<td>
													  <ul class="list-inline">
													    <li>
													      <img src="${pageContext.request.contextPath}/images/user.png" class="avatar" alt="Avatar">
													    </li>
													    <li>
													      <img src="${pageContext.request.contextPath}/images/user.png" class="avatar" alt="Avatar">
													    </li>
													    <li>
													      <img src="${pageContext.request.contextPath}/images/user.png" class="avatar" alt="Avatar">
													    </li>
													    <li>
													      <img src="${pageContext.request.contextPath}/images/user.png" class="avatar" alt="Avatar">
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
													  ${projects.deadline}
													</td>
													
												</tr>
											</tbody>
											</c:if>
										</c:forEach>
									</table>
								</c:when>
								<c:otherwise>
									<br/><br/>
									<i>You have no active projects</i>
								</c:otherwise>
							</c:choose>

                          </div>
<!--                           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                            <p>Chef de projet </p>
                          </div> -->
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
    
<!--     Load page-specific scripts -->


    <script>
    
    /*
      $(function() {
        Morris.Bar({
          element: 'graph_bar',
          data: [
            { "period": "Jan", "Hours worked": 80 }, 
            { "period": "Feb", "Hours worked": 125 }, 
            { "period": "Mar", "Hours worked": 176 }, 
            { "period": "Apr", "Hours worked": 224 }, 
            { "period": "May", "Hours worked": 265 }, 
            { "period": "Jun", "Hours worked": 314 }, 
            { "period": "Jul", "Hours worked": 347 }, 
            { "period": "Aug", "Hours worked": 287 }, 
            { "period": "Sep", "Hours worked": 240 }, 
            { "period": "Oct", "Hours worked": 211 }
          ],
          xkey: 'period',
          hideHover: 'auto',
          barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          ykeys: ['Hours worked', 'sorned'],
          labels: ['Hours worked', 'SORN'],
          xLabelAngle: 60,
          resize: true
        });

        $MENU_TOGGLE.on('click', function() {
          $(window).resize();
        });
      });
    */
    </script>

    <!-- datepicker -->
    <script type="text/javascript">
    
    /*
      $(document).ready(function() {

        var cb = function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
          //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
        }

        var optionSet1 = {
          startDate: moment().subtract(29, 'days'),
          endDate: moment(),
          minDate: '01/01/2012',
          maxDate: '12/31/2015',
          dateLimit: {
            days: 60
          },
          showDropdowns: true,
          showWeekNumbers: true,
          timePicker: false,
          timePickerIncrement: 1,
          timePicker12Hour: true,
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          opens: 'left',
          buttonClasses: ['btn btn-default'],
          applyClass: 'btn-small btn-primary',
          cancelClass: 'btn-small',
          format: 'MM/DD/YYYY',
          separator: ' to ',
          locale: {
            applyLabel: 'Submit',
            cancelLabel: 'Clear',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
          }
        };
        $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
        $('#reportrange').daterangepicker(optionSet1, cb);
        $('#reportrange').on('show.daterangepicker', function() {
          console.log("show event fired");
        });
        $('#reportrange').on('hide.daterangepicker', function() {
          console.log("hide event fired");
        });
        $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
          console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
        });
        $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
          console.log("cancel event fired");
        });
        $('#options1').click(function() {
          $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
        });
        $('#options2').click(function() {
          $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
        });
        $('#destroy').click(function() {
          $('#reportrange').data('daterangepicker').remove();
        });
      });
    
    */
    </script>
    <!-- /datepicker -->
  </body>
</html>