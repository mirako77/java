<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%--
<%@ page session="false"%>
 --%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- Meta, title, CSS, favicons, etc. -->
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Citelum Proposals</title>


<!--     Load CSS and scripts common to all pages -->
<%@ include file="../shared/imports_head.jspf"%>
<!--     /Load CSS and scripts common to all pages -->

<!--     Load page specific scripts and css  -->
<!-- Dropzone.js -->
<link
	href="${pageContext.request.contextPath}/vendors/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
<!--     /Load page specific scripts and css  -->

	  <!-- Entypo Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/entypo/css/entypo.css">


<style type="text/css">

	/*Color variable*/

	:root {
   	--doneStep:#29a929;   /*  var(--doneStep)   */
	}



.icon {
	width: 40px;
	border-radius: 100%;
}


	/*wizard css start*/

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
	/*padding-top: 20px;*/
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

			<!-- 		Sidebar jspf -->
			<%@ include file="../shared/sidebar.jspf"%>

			<!-- 		/Sidebar jspf -->
			<!-- top navigation -->
	        <%@ include file="../shared/top_navigation.jspf" %>
	        <!-- /top navigation -->

			<!-- page content ========================================================= -->

			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3><i class="fa fa-edit"></i> Créer un nouveau projet</h3>
						</div>

					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<i class="fa fa-edit"></i> Projets > Créer un
								projet


								<!-- Smart Wizard -->
								<!--
								<p>This is a basic form wizard example that inherits the
									colors from the selected scheme.</p>
								<div id="wizard" class="form_wizard wizard_horizontal">
									<ul class="wizard_steps">
										<li><a href="#step-1"> <span class="step_no">1</span>
												<span class="step_descr"> Step 1<br /> <small>Step
														1 description</small>
											</span>
										</a></li>
										<li><a href="#step-2"> <span class="step_no">2</span>
												<span class="step_descr"> Step 2<br /> <small>Step
														2 description</small>
											</span>
										</a></li>
										<li><a href="#step-3"> <span class="step_no">3</span>
												<span class="step_descr"> Step 3<br /> <small>Step
														3 description</small>
											</span>
										</a></li>
										<li><a href="#step-4"> <span class="step_no">4</span>
												<span class="step_descr"> Step 4<br /> <small>Step
														4 description</small>
											</span>
										</a></li>
									</ul>
									<div id="step-1"></div>
									<div id="step-2"></div>
									<div id="step-3"></div>
									<div id="step-4"></div>

									<div class="actionBar">
										<a class="buttonNext"> next </a>
									</div>

								</div>



								<br />
								<br />
								<br />
								<br />
								<br />

								-->

								<!-- End SmartWizard Content -->






								<div class="wizard">
									<div class="wizard-inner">
										<div class="connecting-line left" style="margin-left: 13%"></div>
										<div class="connecting-line middle"></div>
										<div class="connecting-line right" style="margin-right: 13%"></div>
										<ul class="nav nav-tabs" role="tablist">

											<li role="presentation" class="active">
												<a href="#step1"
													data-toggle="tab" aria-controls="step1" role="tab"
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

											<li role="presentation" class="disabled"><a
												href="#step2" data-toggle="tab" aria-controls="step2"
												role="tab" title="Step 2"> <span class="round-tab">
														<i class="entypo-flow-tree round-it"></i>
												</span>
												<br/><br/><br/><br/><br/>
												<p>
													Choix des éléments
												</p>
											</a>

											</li>
											<li role="presentation" class="disabled"><a
												href="#step3" data-toggle="tab" aria-controls="step3"
												role="tab" title="Step 3"> <span class="round-tab">
														<i class="entypo-user-add"></i>
												</span>
												<br/><br/><br/><br/><br/>
													<p>
														Choix des Personnes
													</p>
												</a>
											</li>

											<li role="presentation" class="disabled"><a
												href="#complete" data-toggle="tab" aria-controls="complete"
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
											<div class="tab-pane active" role="tabpanel" id="step1">




								<div class="col-xs-12" style="background: none;">


								<!--  Step 1 form start -->
								<br/><br/>
								<div class="x_title">
									<div class="col-md-6">
										<h3 style="margin-left:20%;">Formulaire projet</h3>
									</div>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i	class="fa fa-chevron-up"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />


									<c:url var="addAction" value="/web/submit_form/project_add"></c:url>
									<%@ include file="../shared/project_form.jspf"%>
<%-- 									<c:url var="addAction" value="/web/add_project"></c:url> --%>




								</div>
								<!--  Step 1 form End -->




							</div>















												<ul class="list-inline pull-right">
													<li>
														<button type="button" class="btn btn-primary" onclick="$('.btnForm').click()">Suivant</button>
													</li>
												</ul>
											</div>
											<div class="tab-pane" role="tabpanel" id="step2">
												<h3>Step 2</h3>
												<p>This is step 2</p>
												<ul class="list-inline pull-right">
													<li><button type="button"
															class="btn btn-default prev-step">Previous</button></li>
													<li><button type="button"
															class="btn btn-primary next-step">Save and
															continue</button></li>
												</ul>
											</div>
											<div class="tab-pane" role="tabpanel" id="step3">
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
											</div>
											<div class="tab-pane" role="tabpanel" id="complete">
												<h3>Complete</h3>
												<p>You have successfully completed all steps.</p>
											</div>
											<div class="clearfix"></div>
										</div>

								</div>














								<!--


								<div class="x_title">
									<h2>Formulaire projet</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a></li>
									</ul>
									<div class="clearfix"></div>

								</div>
								<div class="x_content">
									<br />
									<c:url var="addAction" value="/web/add_project"></c:url>
									<form:form id="demo-form2"
										class="form-horizontal form-label-left" action="${addAction}"
										method="POST" commandName="projects">
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">Titre du projet <span
												class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<form:input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" path="title" />
											</div>
										</div>

										<div class="ln_solid"></div>

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">Description <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<form:textarea rows="5" id="last-name" required="required"
													class="form-control col-md-7 col-xs-12" path="description"
													value="asfaga" style="max-width: 100%;" />
											</div>
										</div>

										<div class="ln_solid"></div>


										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">Upload Image</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class=" col-md-7 col-xs-12" type="file"
													accept="image/*" style="padding-top: 8px;">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">Upload File</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input class=" col-md-7 col-xs-12" type="file"
													style="padding-top: 8px;">
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">Deadline <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<form:input type="text" id="deadline" required="required"
													class="form-control col-md-7 col-xs-12" path="deadline"
													placeholder="23/05/2017 - 23 Mai 2017" />
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-success">Submit</button>
											</div>
										</div>
									</form:form>
								</div>


								-->





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
	<%@ include file="../shared/imports_foot.jspf"%>

	<!--     /Load common scripts -->

	<!--     Load page-specific scripts -->

	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>

	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/scripts/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/scripts/datepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Autosize -->
	<script
		src="${pageContext.request.contextPath}/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script
		src="${pageContext.request.contextPath}/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- Dropzone.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/dropzone/dist/min/dropzone.min.js"></script>

	<!--     /Load page-specific scripts -->

	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/scripts/custom_bootstrap-daterangepicker.js"></script>
	<!-- /bootstrap-daterangepicker -->

<!-- 	Parsley -->
<%-- <script src="${pageContext.request.contextPath}/vendors/parsley/2.7.2/parsley.js"></script> --%>
<!-- 	/Parsley -->

	<!-- bootstrap-wysiwyg -->



	<!-- jQuery Smart Wizard -->
	<script
		src="${pageContext.request.contextPath}/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>




	<script>
      $(document).ready(function() {
        $('#wizard').smartWizard();

        $('.buttonNext').addClass('btn btn-success');
        $('.buttonPrevious').addClass('btn btn-primary');
        $('.buttonFinish').addClass('btn btn-default');
      });
    </script>


    <script type="text/javascript">
	    //	Detect which textarea description is being loaded (database or input and assign the corresponding value)
	    var databaseDescription = document.getElementById("databaseDescription");
	    var previousInputDescription = document.getElementById("previousInputDescription")
	    if(!!databaseDescription){
	    	databaseDescription.defaultValue = "${getCurrentProjectDescription}";
	    } else if (!! previousInputDescription){
	    	previousInputDescription.defaultValue = "${inputProjectDescription}"
	    };
	 	//	/Detect which textarea description is being loaded (database or input and assign the corresponding value)

    </script>


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

        $(".next-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);

        });
        $(".prev-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);

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
      $(document).ready(function() {
        function initToolbarBootstrapBindings() {
          var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
              'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
              'Times New Roman', 'Verdana'
            ],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
          $.each(fonts, function(idx, fontName) {
            fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
          });
          $('a[title]').tooltip({
            container: 'body'
          });
          $('.dropdown-menu input').click(function() {
              return false;
            })
            .change(function() {
              $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
            })
            .keydown('esc', function() {
              this.value = '';
              $(this).change();
            });

          $('[data-role=magic-overlay]').each(function() {
            var overlay = $(this),
              target = $(overlay.data('target'));
            overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
          });

          if ("onwebkitspeechchange" in document.createElement("input")) {
            var editorOffset = $('#editor').offset();

            $('.voiceBtn').css('position', 'absolute').offset({
              top: editorOffset.top,
              left: editorOffset.left + $('#editor').innerWidth() - 35
            });
          } else {
            $('.voiceBtn').hide();
          }
        }

        function showErrorAlert(reason, detail) {
          var msg = '';
          if (reason === 'unsupported-file-type') {
            msg = "Unsupported format " + detail;
          } else {
            console.log("error uploading file", reason, detail);
          }
          $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
            '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
        }

        initToolbarBootstrapBindings();

        $('#editor').wysiwyg({
          fileUploadError: showErrorAlert
        });

        window.prettyPrint;
        prettyPrint();
      });
    </script>
	<!-- /bootstrap-wysiwyg -->


	<!-- Select2 -->
<!-- 	<script>
      $(document).ready(function() {
        $(".select2_single").select2({
          placeholder: "Select a state",
          allowClear: true
        });
        $(".select2_group").select2({});
        $(".select2_multiple").select2({
          maximumSelectionLength: 4,
          placeholder: "With Max Selection limit 4",
          allowClear: true
        });
      });
    </script> -->
	<!-- /Select2 -->


	<!-- jQuery Tags Input -->
	<script>
      function onAddTag(tag) {
        alert("Added a tag: " + tag);
      }

      function onRemoveTag(tag) {
        alert("Removed a tag: " + tag);
      }

      function onChangeTag(input, tag) {
        alert("Changed a tag: " + tag);
      }

      $(document).ready(function() {
        $('#tags_1').tagsInput({
          width: 'auto'
        });
      });
    </script>
	<!-- /jQuery Tags Input -->


	<!-- Parsley -->
<!-- 	<script>
      $(document).ready(function() {
        $.listen('parsley:field:validate', function() {
          validateFront();
        });
        $('#demo-form2 .btn').on('click', function() {
          $('#demo-form2').parsley().validate();
          validateFront();
        });
        var validateFront = function() {
          if (true === $('#demo-form2').parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
          } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
          }
        };
      });

      $(document).ready(function() {
        $.listen('parsley:field:validate', function() {
          validateFront();
        });
        $('#demo-form2 .btn').on('click', function() {
          $('#demo-form2').parsley().validate();
          validateFront();
        });
        var validateFront = function() {
          if (true === $('#demo-form2').parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
          } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
          }
        };
      });
      try {
        hljs.initHighlightingOnLoad();
      } catch (err) {}
    </script> -->
	<!-- /Parsley -->


	<!-- Autosize -->
	<script>
      $(document).ready(function() {
        autosize($('.resizable_textarea'));
      });
    </script>
	<!-- /Autosize -->

	<!-- jQuery autocomplete -->
	<script>
      $(document).ready(function() {
        var countries = { AD:"Andorra",A2:"Andorra Test",AE:"United Arab Emirates",AF:"Afghanistan",AG:"Antigua and Barbuda",AI:"Anguilla",AL:"Albania",AM:"Armenia",AN:"Netherlands Antilles",AO:"Angola",AQ:"Antarctica",AR:"Argentina",AS:"American Samoa",AT:"Austria",AU:"Australia",AW:"Aruba",AX:"Åland Islands",AZ:"Azerbaijan",BA:"Bosnia and Herzegovina",BB:"Barbados",BD:"Bangladesh",BE:"Belgium",BF:"Burkina Faso",BG:"Bulgaria",BH:"Bahrain",BI:"Burundi",BJ:"Benin",BL:"Saint Barthélemy",BM:"Bermuda",BN:"Brunei",BO:"Bolivia",BQ:"British Antarctic Territory",BR:"Brazil",BS:"Bahamas",BT:"Bhutan",BV:"Bouvet Island",BW:"Botswana",BY:"Belarus",BZ:"Belize",CA:"Canada",CC:"Cocos [Keeling] Islands",CD:"Congo - Kinshasa",CF:"Central African Republic",CG:"Congo - Brazzaville",CH:"Switzerland",CI:"Côte d’Ivoire",CK:"Cook Islands",CL:"Chile",CM:"Cameroon",CN:"China",CO:"Colombia",CR:"Costa Rica",CS:"Serbia and Montenegro",CT:"Canton and Enderbury Islands",CU:"Cuba",CV:"Cape Verde",CX:"Christmas Island",CY:"Cyprus",CZ:"Czech Republic",DD:"East Germany",DE:"Germany",DJ:"Djibouti",DK:"Denmark",DM:"Dominica",DO:"Dominican Republic",DZ:"Algeria",EC:"Ecuador",EE:"Estonia",EG:"Egypt",EH:"Western Sahara",ER:"Eritrea",ES:"Spain",ET:"Ethiopia",FI:"Finland",FJ:"Fiji",FK:"Falkland Islands",FM:"Micronesia",FO:"Faroe Islands",FQ:"French Southern and Antarctic Territories",FR:"France",FX:"Metropolitan France",GA:"Gabon",GB:"United Kingdom",GD:"Grenada",GE:"Georgia",GF:"French Guiana",GG:"Guernsey",GH:"Ghana",GI:"Gibraltar",GL:"Greenland",GM:"Gambia",GN:"Guinea",GP:"Guadeloupe",GQ:"Equatorial Guinea",GR:"Greece",GS:"South Georgia and the South Sandwich Islands",GT:"Guatemala",GU:"Guam",GW:"Guinea-Bissau",GY:"Guyana",HK:"Hong Kong SAR China",HM:"Heard Island and McDonald Islands",HN:"Honduras",HR:"Croatia",HT:"Haiti",HU:"Hungary",ID:"Indonesia",IE:"Ireland",IL:"Israel",IM:"Isle of Man",IN:"India",IO:"British Indian Ocean Territory",IQ:"Iraq",IR:"Iran",IS:"Iceland",IT:"Italy",JE:"Jersey",JM:"Jamaica",JO:"Jordan",JP:"Japan",JT:"Johnston Island",KE:"Kenya",KG:"Kyrgyzstan",KH:"Cambodia",KI:"Kiribati",KM:"Comoros",KN:"Saint Kitts and Nevis",KP:"North Korea",KR:"South Korea",KW:"Kuwait",KY:"Cayman Islands",KZ:"Kazakhstan",LA:"Laos",LB:"Lebanon",LC:"Saint Lucia",LI:"Liechtenstein",LK:"Sri Lanka",LR:"Liberia",LS:"Lesotho",LT:"Lithuania",LU:"Luxembourg",LV:"Latvia",LY:"Libya",MA:"Morocco",MC:"Monaco",MD:"Moldova",ME:"Montenegro",MF:"Saint Martin",MG:"Madagascar",MH:"Marshall Islands",MI:"Midway Islands",MK:"Macedonia",ML:"Mali",MM:"Myanmar [Burma]",MN:"Mongolia",MO:"Macau SAR China",MP:"Northern Mariana Islands",MQ:"Martinique",MR:"Mauritania",MS:"Montserrat",MT:"Malta",MU:"Mauritius",MV:"Maldives",MW:"Malawi",MX:"Mexico",MY:"Malaysia",MZ:"Mozambique",NA:"Namibia",NC:"New Caledonia",NE:"Niger",NF:"Norfolk Island",NG:"Nigeria",NI:"Nicaragua",NL:"Netherlands",NO:"Norway",NP:"Nepal",NQ:"Dronning Maud Land",NR:"Nauru",NT:"Neutral Zone",NU:"Niue",NZ:"New Zealand",OM:"Oman",PA:"Panama",PC:"Pacific Islands Trust Territory",PE:"Peru",PF:"French Polynesia",PG:"Papua New Guinea",PH:"Philippines",PK:"Pakistan",PL:"Poland",PM:"Saint Pierre and Miquelon",PN:"Pitcairn Islands",PR:"Puerto Rico",PS:"Palestinian Territories",PT:"Portugal",PU:"U.S. Miscellaneous Pacific Islands",PW:"Palau",PY:"Paraguay",PZ:"Panama Canal Zone",QA:"Qatar",RE:"Réunion",RO:"Romania",RS:"Serbia",RU:"Russia",RW:"Rwanda",SA:"Saudi Arabia",SB:"Solomon Islands",SC:"Seychelles",SD:"Sudan",SE:"Sweden",SG:"Singapore",SH:"Saint Helena",SI:"Slovenia",SJ:"Svalbard and Jan Mayen",SK:"Slovakia",SL:"Sierra Leone",SM:"San Marino",SN:"Senegal",SO:"Somalia",SR:"Suriname",ST:"São Tomé and Príncipe",SU:"Union of Soviet Socialist Republics",SV:"El Salvador",SY:"Syria",SZ:"Swaziland",TC:"Turks and Caicos Islands",TD:"Chad",TF:"French Southern Territories",TG:"Togo",TH:"Thailand",TJ:"Tajikistan",TK:"Tokelau",TL:"Timor-Leste",TM:"Turkmenistan",TN:"Tunisia",TO:"Tonga",TR:"Turkey",TT:"Trinidad and Tobago",TV:"Tuvalu",TW:"Taiwan",TZ:"Tanzania",UA:"Ukraine",UG:"Uganda",UM:"U.S. Minor Outlying Islands",US:"United States",UY:"Uruguay",UZ:"Uzbekistan",VA:"Vatican City",VC:"Saint Vincent and the Grenadines",VD:"North Vietnam",VE:"Venezuela",VG:"British Virgin Islands",VI:"U.S. Virgin Islands",VN:"Vietnam",VU:"Vanuatu",WF:"Wallis and Futuna",WK:"Wake Island",WS:"Samoa",YD:"People's Democratic Republic of Yemen",YE:"Yemen",YT:"Mayotte",ZA:"South Africa",ZM:"Zambia",ZW:"Zimbabwe",ZZ:"Unknown or Invalid Region" };

        var countriesArray = $.map(countries, function(value, key) {
          return {
            value: value,
            data: key
          };
        });

        // initialize autocomplete with custom appendTo
        $('#autocomplete-custom-append').autocomplete({
          lookup: countriesArray,
          appendTo: '#autocomplete-container'
        });
      });
    </script>
	<!-- /jQuery autocomplete -->


</body>
</html>