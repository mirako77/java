/**
 * bootstrap-daterangepicker
 * 
 * this file contains the script for generating a date range picker on elements with id = deadline
 */

/* Get the code into yyyy/mm/dd format */

$(document).ready(function() {
	
	function getFormatDate(d){
	    return d.getDate() + '-' + ("0"+(d.getMonth()+1)).slice(-2) + '-' + d.getFullYear()
	}

	
	
	var minDate = getFormatDate(new Date());
	var startDate = '"'+minDate+'"'
	
	console.log(minDate);
	$('#deadline').daterangepicker({
		"locale": {
	        "daysOfWeek": [
	            "Lun",
	            "Mar",
	            "Mer",
	            "Jeu",
	            "ven",
	            "Sam",
	            "Dim"
	        ],
	        "monthNames": [
	            "Janvier",
	            "Février",
	            "Mars",
	            "Avril",
	            "Mai",
	            "Juin",
	            "Juillet",
	            "Août",
	            "Septembre",
	            "Octobre",
	            "Novembre",
	            "Décembre"
	        ]
		},
	
		format : 'DD-MM-YYYY',
		singleDatePicker : true,
		showDropdowns: true,
		calender_style : "picker_5",
		minDate: minDate,
//		startDate: startDate
	}, function(start, end, label) {
		console.log(start.toISOString(), end.toISOString(), label);
	});
	
	$('#deadline').data('daterangepicker').setStartDate(minDate)
});