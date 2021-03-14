<%@ include file="header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<div class="col-md-12">
			<div class="">
				<a class="btn btn-primary"
					href="<%=contextPath%>/app/market/addCustomerForm"
					style="margin-left: 50%;">Add Customer</a>
			</div>
			<div class="table-responsive">

				<table id="mytable" class="table table-bordered" style="margin: 10px; width: 95%;">
					<thead>
						<th>Customer Id</th>
						<th>Customer Name</th>
						<th>Country</th>
						<th>Created Date</th>
						<th>Edit</th>
					</thead>
					<tbody>
						<c:forEach var="customer" items="${customers}">
							<tr>
								<td>${customer.customerId }</td>
								<td>${customer.customerName }</td>
								<td>${customer.country }</td>
								<td>${customer.createdDate }</td>
								<td><a class="btn btn-primary"
									href="<%=contextPath%>/app/market/editCustomerView/${customer.customerId}">Edit</a>
									<a class="btn btn-warning"
									href="<%=contextPath%>/app/market/deleteCustomer/${customer.customerId}">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>