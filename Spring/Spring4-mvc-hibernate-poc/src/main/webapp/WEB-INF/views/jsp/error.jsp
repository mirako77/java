<%@ include file="header.jsp" %>

   <head>
      <title>Spring Error Page</title>
   </head>

	<div class="container">
	  <div class="jumbotron">
	  	<c:if test="${saveError !=null}">
			<div class="alert alert-danger alert-dismissible">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			  <strong>${saveError}</strong> 
			</div>
		</c:if>
      	<p class="alert alert-warning">An error occured, please contact webmaster.</p>
      </div>
    </div>

   	<hr>
	<footer>
		<p>&copy; http://mickanel.net 2021</p>
	</footer>
   
<%@ include file="footer.jsp" %>