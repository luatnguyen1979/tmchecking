<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="global">

	<div id="accordion" role="tablist">
	<form:form id="custOrderForm" modelAttribute="custOrder">
		<div class="card">
			<div class="card-header" role="tab" id="headingOne">

				<div class="row">

					<div class="col-xl-11 center-block text-left">
						<h5>1. Shipping address - ${customer.address.fullName} - ${customer.address.addressLine1} ${customer.address.addressLine2}, ${customer.address.city}, ${customer.address.state} ${customer.address.zipCode}, US </h5>
					</div>

					<div class="col-xl-1">
						<a data-toggle="collapse" href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> Change </a>
					</div>
				</div>
			</div>

			<div id="collapseOne" class="collapse show" role="tabpanel"
				aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">
				
				



				
				
				
					<input type="button" class="btn btn-primary" value="Add Address"
						onclick="make_visible('formInput');return false;">
				</div>
			</div>
		</div>


		<div class="card">
			<div class="card-header" role="tab" id="headingTwo">


				<div class="row">
					<div class="col-xl-11 center-block text-left">
						<h5>2. Payment method - Image ${customer.payment.paymentMethod} ending in ${customer.payment.cardNumber}</h5>
					</div>
					<div class="col-xl-1">
						<a class="collapsed" data-toggle="collapse" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"> Change </a>
					</div>
				</div>


			</div>
			<div id="collapseTwo" class="collapse" role="tabpanel"
				aria-labelledby="headingTwo" data-parent="#accordion">
				<div class="card-body">Anim pariatur cliche reprehenderit,
					enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
					moon officia aute, non cupidatat skateboard dolor brunch. Food
					truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
					sunt aliqua put a bird on it squid single-origin coffee nulla
					assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
					labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
					excepteur butcher vice lomo. Leggings occaecat craft beer
					farm-to-table, raw denim aesthetic synth nesciunt you probably
					haven't heard of them accusamus labore sustainable VHS.</div>
			</div>
		</div>


		<div class="card">
			<div class="card-header" role="tab" id="headingThree">


				<div class="row">
					<div class="col-xl-3 center-block text-left">
						<h5>3. Review items and shipping</h5>
					</div>
					<div class="col-xl-7"></div>
					<div class="col-xl-2 center-block text-right">
						
						<a  href="cart" class="btn btn-primary"
                            > Review Order </a>
					</div>
				</div>


			</div>


			<div id="collapseTwo" class="" role="tabpanel"
				aria-labelledby="headingTwo" data-parent="">
				<div class="card-body">

					<div class="container">
						<div class="row">
							<div class="col-2"></div>
							<div class="col"></div>
							<div class="col-9 text-left">Estimated delivery: Oct. 31,
								2017</div>

						</div>
						<div class="row">
							<div class="col-2"></div>
							<div class="col">Image</div>
							<div class="col-8 text-left">All-new Echo (2nd Generation)
								with improved sound, powered by Dolby, and a new design -
								Charcoal Fabric</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col-12">&nbsp;</div>
						</div>
						<div class="row">
							<div class="col-2"></div>
							<div class="col"></div>
							<div class="col-9 text-left">Guaranteed delivery date: Oct.
								24, 2017</div>

						</div>
						<div class="row">
							<div class="col-2"></div>
							<div class="col">Image</div>
							<div class="col-8 text-left">ecobee3 lite Smart Thermostat,
								Works with Amazon Alexa, 2nd Gen</div>
							<div class="col"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form:form>
	</div>
</div>

