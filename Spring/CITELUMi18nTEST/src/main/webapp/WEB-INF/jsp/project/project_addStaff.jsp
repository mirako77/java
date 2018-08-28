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

/*Checklist css start*/
.v-center {
  min-height:200px;
  display: flex;
  justify-content:center;
  flex-flow: column wrap;

}

.btnCenter {
	margin-right: auto;
}

/*Checklist css end*/

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


								<i class="fa fa-edit"></i> Projets > Modifier le personnel

				<div class="wizard">
					<div class="wizard-inner">
						<div class="connecting-line left doneLine" style="margin-left: 13%"></div>
						<div class="connecting-line middle doneLine"></div>
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
							<li role="presentation" class="active"><a
								href="#step3" data-toggle="tab" aria-controls="step3"
								role="tab" title="Step 3"> <span class="round-tab doneStep">
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
										<button type="button" class="btn btn-primary next-step" onclick="createProjectForm.submit()">Suivant</button>
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
										<h3 style="margin-left:20%;">Personnel affecté au projet</h3>
									</div>
									<ul class="nav navbar-right panel_toolbox col-md-1" style="float:right">
										<li><a class="collapse-link"><i class="fa fa-chevron-up" style="margin-left:30px;"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

								<div class="container" style="height: 100%%; margin: 0px;">
									<div class="row">
										<div class="col-md-12"
											style="/*border: 1px solid #ebebeb;*/">

												<br/>
											  		<div class="col-sm-5 ">
											          <div class="list-group" id="list1">
											          	<a href="#" class="list-group-item active">List 1 <input title="toggle all" type="checkbox" class="all pull-right"></a>
											         	 <c:forEach var="staff" items="${listStaff}" varStatus="staffStatus">
											         	 	<%--
											         	 	<c:forEach var="staff" items="${listStaffAssignedToProject}" varStatus="staffStatus">

											         	 		<c:if test="${listStaff.id != listStaffAssignedToProject.id}">

		          												</c:if>
		          											</c:forEach>
											         	 	 --%>

														        	<a id="${staff.id}" href="#" class="list-group-item">
															          	<img src="${pageContext.request.contextPath}/images/staff/${staff.picture_path}"
																			 class="icon" />
																	 	<span style="margin-left: 20px;">
																	 		${staff.name}
																	 	</span>
																		<input type="checkbox" class="pull-right">
																	</a>

														</c:forEach>
											          </div>
											        </div>
											        <div class="col-md-2 v-center">
											     		<button title="Send to list 2" class="btn btn-default center-block add btnCenter"><i class="glyphicon glyphicon-chevron-right"></i></button>
											            <button title="Send to list 1" class="btn btn-default center-block remove btnCenter"><i class="glyphicon glyphicon-chevron-left"></i></button>
											        </div>
											        <div class="col-sm-5">
											    	  <div class="list-group" id="list2">
											          <a href="#" class="list-group-item active">List 2 <input title="toggle all" type="checkbox" class="all pull-right"></a>


											    	  	<c:forEach var="staff" items="${listStaffAssignedToProject}"
																	varStatus="staffStatus">

												        	<a id="${staff.id}" href="#" class="list-group-item">
													          	<img src="${pageContext.request.contextPath}/images/staff/${staff.picture_path}"
																	 class="icon" />
															 	<span style="margin-left: 20px;">
															 		${staff.name}
															 	</span>
																<input type="checkbox" class="pull-right">
															</a>

														</c:forEach>

											    	  <!--
											          <a href="#" class="list-group-item">Alpha <input type="checkbox" class="pull-right"></a>
											          <a href="#" class="list-group-item">Charlie <input type="checkbox" class="pull-right"></a>
											          <a href="#" class="list-group-item">Bravo <input type="checkbox" class="pull-right"></a>
											    	   -->
											          </div>
											        </div>


										</div>

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

	/********************************* Check List Js ***************************************/

	$('.add').click(function(){
	    $('.all').prop("checked",false);
	    var items = $("#list1 input:checked:not('.all')");
	    var n = items.length;
	  	if (n > 0) {
	      items.each(function(idx,item){
	        var choice = $(item);
	        choice.prop("checked",false);
	        choice.parent().appendTo("#list2");
	      });
	  	}
	    else {
	  		alert("Choose an item from list 1");
	    }
	});

	$('.remove').click(function(){
	    $('.all').prop("checked",false);
	    var items = $("#list2 input:checked:not('.all')");
		items.each(function(idx,item){
	      var choice = $(item);
	      choice.prop("checked",false);
	      choice.parent().appendTo("#list1");
	    });
	});

	/* toggle all checkboxes in group */
	$('.all').click(function(e){
		e.stopPropagation();
		var $this = $(this);
	    if($this.is(":checked")) {
	    	$this.parents('.list-group').find("[type=checkbox]").prop("checked",true);
	    }
	    else {
	    	$this.parents('.list-group').find("[type=checkbox]").prop("checked",false);
	        $this.prop("checked",false);
	    }
	});

	$('[type=checkbox]').click(function(e){
	  e.stopPropagation();
	});

	/* toggle checkbox when list group item is clicked */
	$('.list-group a').click(function(e){

	    e.stopPropagation();
	    e.preventDefault();

	  	var $this = $(this).find("[type=checkbox]");
	    if($this.is(":checked")) {
	    	$this.prop("checked",false);
	    }
	    else {
	    	$this.prop("checked",true);
	    }

	    if ($this.hasClass("all")) {
	    	$this.trigger('click');
	    }
	});


	$('.bossBtn').click(function(){
	    //$('.all').prop("checked",false);

	    var items = $("#list2 a:not('.active')");

	    console.log(items.length)




	    /*
		var list = [];

		items.each(function(idx,item){

			console.log(item.id)

			list.push(item.id)

	      //var choice = $(item);
	      //choice.prop("checked",false);
	      //choice.parent().appendTo("#list1");

	    });

		console.log(list)

		jQuery.ajax({
			url : '${pageContext.request.contextPath}/web/addStaffToProject=${getCurrentProjectId}',
			type : "POST",
			data : JSON.stringify({
				idStaffList :  list
			}),
			contentType : 'application/json',
			//dataType: 'json',
			success : function() {

				console.log('success');

			}
		});
		*/










	});







	/********************************* Project WorkFlow Wizard ***************************************/

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


	var addStaffToProject = function(items) {

		var list = [];

		items.each(function(idx,item){

			console.log(item.id)

			list.push(item.id)

	      //var choice = $(item);
	      //choice.prop("checked",false);
	      //choice.parent().appendTo("#list1");

	    });

		console.log(list)

		jQuery.ajax({
			url : '${pageContext.request.contextPath}/web/addStaffToProject=${getCurrentProjectId}',
			type : "POST",
			data : JSON.stringify({
				idStaffList :  list
			}),
			contentType : 'application/json',
			//dataType: 'json',
			success : function() {

				console.log('success');
				window.location.href= "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_assignTask";
			}
		});

			console.log("YES")

	}



		$(".NextPage").click(function(e){

			var items = $("#list2 a:not('.active')");

			if ( items.length == 0) {
				alert("Please select at least one Contributeur")
				e.preventDefault();

			} else {

				addStaffToProject(items);

			}



		});

		$(".prevPage").on('click', function() {
	  		 $("#saveJSON").click();

	  		window.location.href = "${pageContext.request.contextPath}/web/project${getCurrentProjectId}_preview";				//Redirect to next page

	  	});







	</script>
</body>
</html>