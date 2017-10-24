<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="global">

	<div id="accordion" role="tablist">
	
		<div class="card">
			<div class="card-header" role="tab" id="headingOne">

				<div class="row">

					<div id="defautlAddress" class="col-xl-12 center-block text-left">
						<h5>1. Shipping address</h5>
					</div>

					
				</div>
			</div>

			<div id="collapseOne" class="collapse show" role="tabpanel"
				aria-labelledby="headingOne" data-parent="#accordion">
				<div id="newAddress" class="card-body">
			         <div class="row"><div class="col-3 text-right">Full Name:</div><div class="col-9 text-left">${customerOrder.shippingAddress.fullName}</div></div>
            <div class="row"><div class="col-3 text-right">Address Line1:</div><div class="col-9 text-left">${customerOrder.shippingAddress.addressLine1}</div></div>
            <div class="row"><div class="col-3 text-right">Address Line2:</div><div class="col-9 text-left">${customerOrder.shippingAddress.addressLine2}</div></div>
            <div class="row"><div class="col-3 text-right">City:</div><div class="col-9 text-left">${customerOrder.shippingAddress.city}</div></div>
            <div class="row"><div class="col-3 text-right">State:</div><div class="col-9 text-left">${customerOrder.shippingAddress.state}</div></div>
            <div class="row"><div class="col-3 text-right">Zip Code:</div><div class="col-9 text-left">${customerOrder.shippingAddress.zipCode}</div></div>
            <div class="row"><div class="col-3 text-right">Country:</div><div class="col-9 text-left">${customerOrder.shippingAddress.country}</div></div>
            <div class="row"><div class="col-3 text-right">Phone Number:</div><div class="col-9 text-left">${customerOrder.shippingAddress.phoneNumber}</div></div>

				</div>
			</div>
		</div>


		
	</div>
</div>
