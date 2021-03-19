<%@ include file="header.jsp"%>

<div class="container-fluid">

  <div class="row">
  	<div class="col-md-2">
  	</div>
  	<div class="col-md-6">
  		 <h2>Edit Customer : ${customer.customerName }</h2>
			<form class="form-horizontal"  action="<%=contextPath%>/app/market/editCustomerAction" method="post" role="form">
				<input type="hidden" value="${customer.customerId }"	 name="customerId" id="customerId">
				<input type="hidden" value="${customer.createdDate	 }"	 name="createdDate" id="createdDate">
				<div class="form-group">
					<label for="title">Customer Name</label>
					<div class="input-group">
						<span class="input-group-addon"><span	class="glyphicon glyphicon-cog"></span></span>
						 <input type="text" value="${customer.customerName }" 
						 	class="form-control" name="name" id="name" placeholder="Enter Name" required>
					</div>
				</div>
				<div class="form-group">
					<label for="desc">Country</label>
					<div class="input-group">
						<span class="input-group-addon"><span 	class="glyphicon glyphicon-pencil"></span></span> 
							<input type="text" value="${customer.country }" 
							class="form-control" name="country" id="desc" placeholder="Enter Country" required>
					</div>
				</div>
					<button type="cancel" class="btn btn-cancel">Cancel</button>
					<button type="submit" class="btn btn-success">Submit</button>
			</form>
  	
  	</div>
 </div>
</div>

<%@ include file="footer.jsp"%>