
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link href="../template/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../template/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../template/build/css/custom.css" rel="stylesheet">
<link href="../../style/styles.css" rel="stylesheet">
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
								id="citelum_logo_sidebar"><img src="../../pictures/logo.png"
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
								<img src="../../pictures/user.jpg" alt="..."
									class="img-circle profile_img"
									style="height: 44px; width: 44px;">
							</div>
							<div class="profile_info">
								<h2>Michel Henaff</h2>
								<span>Project Leader</span>
							</div>
						</div>
						<!-- /menu profile quick info -->

						<br />

						<!-- sidebar menu -->
						<div id="sidebar-menu"
							class="main_menu_side hidden-print main_menu">
							<div class="menu_section">
								<!--
                <h3>General</h3>
-->

								<ul class="nav side-menu">
									<li><a href="profile"><i class="fa fa-home"></i>Tableau
											de bord</a> <!--
                    <ul class="nav child_menu">
                      <li><a href="#">Dashboard</a></li>
                      <li><a href="#">Dashboard2</a></li>
                      <li><a href="#">Dashboard3</a></li>
                    </ul>
--></li>
									<li><a><i class="fa fa-edit"></i> Projets<span
											class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="project_list" target="frame">Liste des projets</a></li>
											<li><a href="project_create" target="frame">Créer un projet</a></li>
										</ul></li>
									<li><a><i class="fa fa-sitemap"></i> Librairie des
											contenus<span class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">
											<li><a href="upload" target="frame">Base documentaire</a></li>
										</ul></li>
									<li><a href="notification"><i class="fa fa-desktop"></i> Notificaations</a> 
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
--></li>
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
				<div class="nav_menu" style="height: 96vh">

					<div id="detailframe" class="col-xs-12 col-md-12 col-lg-12 documentFrame" style="height: 100%">
						<iframe name="frame" class="frame"
							src="../../web/main2"
							style="width: 100%; height: 100%; min-height:700px;" width="100%"
							frameborder="0"></iframe>

					</div>
				</div>
			</div>
			<!-- /top navigation -->







			<!-- footer content -->
			<footer>
				<div class="pull-right">© 2017 Citelum</div>
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
	<!-- morris.js 
    <script src="../template/vendors/raphael/raphael.min.js"></script>
    <script src="../template/vendors/morris.js/morris.min.js"></script>
    -->
	<!-- bootstrap-progressbar -->
	<script
		src="../template/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- bootstrap-daterangepicker 
    <script src="../template/production/js/moment/moment.min.js"></script>
    <script src="../template/production/js/datepicker/daterangepicker.js"></script>
    -->
	<!-- Custom Theme Scripts -->
	<script src="../template/build/js/custom.min.js"></script>

	<script src="../../scripts/template_manipulation.js"></script>

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