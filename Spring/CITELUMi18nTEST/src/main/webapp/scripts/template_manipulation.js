$(function () {
	
	
	/* Set sidebar to appropriate mode based on window width as soon as DOM is loaded */
	sidebarMode();
	
    /* Update sidebar to appropriate mode based on window width upon resize */ 
	$(window).on('resize', function() {
		sidebarMode();
	})
	
	
	// ********************** DEFINE FUNCTIONS ********************/
	
	//*	Define function to switch sidebar modes according to window width */
	function sidebarMode() {
		if($(window).width() < 991) {
			$('body').addClass('nav-sm');
			$('body').removeClass('nav-md');
		
		}else{
	        $('body').addClass('nav-md');
	        $('body').removeClass('nav-sm');
	    };
	};
	
	
	// ***************** END OF DEFINE FUNCTIONS *****************/
});