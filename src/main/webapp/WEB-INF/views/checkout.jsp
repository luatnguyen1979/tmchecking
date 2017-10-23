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
						<h5>1. Shipping address ${custOrder.totalPrice} Address: ${custOrder.shipingAddress.addressLine1}</h5>
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
						<h5>2. Payment method</h5>
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
						<input class="btn btn-primary" type="button" value="Review Order">
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





<div id="result" style="display:none" >     
            <p id="success" > 
    
            </p> 
            <p id="errors" > 
    
            </p>
</div>

<div id="formInput" class="modal" style="display: none">
    <div class="modal-dialog">
        <!-- Modal content -->
        <div class="modal-content">
          <br/>
            <h3 align="center">Adding Address</h3>
            <br/>
            <form:form id="addressForm" name="address" method="POST">
                <div class="container">

                    <div class="row">
                        <div class="col-3 text-right">Full Name:</div>
                        <div class="col-9 text-left">
                            <form:input id="fullName" path="fullName" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="fullName" cssClass="text-danger"/>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-3 text-right">Address Line 1:</div>
                        <div class="col-9 text-left">
                            <form:input id="addressLine1" path="addressLine1" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="addressLine1" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Address Line 2:</div>
                        <div class="col-9 text-left">
                            <form:input id="addressLine2" path="addressLine2" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="addressLine2" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">City:</div>
                        <div class="col-9 text-left">
                            <form:input id="city" path="city" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="city" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">State:</div>
                        <div class="col-9 text-left">
                            <form:select id="state" path="state"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="" selected="true">Select a State</form:option>
                                <form:option value="AL">Alabama</form:option>
                                <form:option value="AK">Alaska</form:option>
                                <form:option value="AZ">Arizona</form:option>
                                <form:option value="AR">Arkansas</form:option>
                                <form:option value="CA">California</form:option>
                                <form:option value="CO">Colorado</form:option>
                                <form:option value="CT">Connecticut</form:option>
                                <form:option value="DE">Delaware</form:option>
                                <form:option value="DC">District Of Columbia</form:option>
                                <form:option value="FL">Florida</form:option>
                                <form:option value="GA">Georgia</form:option>
                                <form:option value="HI">Hawaii</form:option>
                                <form:option value="ID">Idaho</form:option>
                                <form:option value="IL">Illinois</form:option>
                                <form:option value="IN">Indiana</form:option>
                                <form:option value="IA">Iowa</form:option>
                                <form:option value="KS">Kansas</form:option>
                                <form:option value="KY">Kentucky</form:option>
                                <form:option value="LA">Louisiana</form:option>
                                <form:option value="ME">Maine</form:option>
                                <form:option value="MD">Maryland</form:option>
                                <form:option value="MA">Massachusetts</form:option>
                                <form:option value="MI">Michigan</form:option>
                                <form:option value="MN">Minnesota</form:option>
                                <form:option value="MS">Mississippi</form:option>
                                <form:option value="MO">Missouri</form:option>
                                <form:option value="MT">Montana</form:option>
                                <form:option value="NE">Nebraska</form:option>
                                <form:option value="NV">Nevada</form:option>
                                <form:option value="NH">New Hampshire</form:option>
                                <form:option value="NJ">New Jersey</form:option>
                                <form:option value="NM">New Mexico</form:option>
                                <form:option value="NY">New York</form:option>
                                <form:option value="NC">North Carolina</form:option>
                                <form:option value="ND">North Dakota</form:option>
                                <form:option value="OH">Ohio</form:option>
                                <form:option value="OK">Oklahoma</form:option>
                                <form:option value="OR">Oregon</form:option>
                                <form:option value="PA">Pennsylvania</form:option>
                                <form:option value="RI">Rhode Island</form:option>
                                <form:option value="SC">South Carolina</form:option>
                                <form:option value="SD">South Dakota</form:option>
                                <form:option value="TN">Tennessee</form:option>
                                <form:option value="TX">Texas</form:option>
                                <form:option value="UT">Utah</form:option>
                                <form:option value="VT">Vermont</form:option>
                                <form:option value="VA">Virginia</form:option>
                                <form:option value="WA">Washington</form:option>
                                <form:option value="WV">West Virginia</form:option>
                                <form:option value="WI">Wisconsin</form:option>
                                <form:option value="WY">Wyoming</form:option>

                                <form:option value="AS">American Samoa</form:option>
                                <form:option value="GU">Guam</form:option>
                                <form:option value="MP">Northern Mariana Islands</form:option>
                                <form:option value="PR">Puerto Rico</form:option>
                                <form:option value="UM">United States Minor Outlying Islands</form:option>
                                <form:option value="VI">Virgin Islands</form:option>
                            </form:select>
                            <form:errors path="state" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Zip Code:</div>
                        <div class="col-9 text-left">
                            <form:input id="zipCode" path="zipCode" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="zipCode" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Country:</div>
                        <div class="col-9 text-left">
                            <form:select id="country" path="country"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="US" selected="true">United States</form:option>
                            </form:select>
                            <form:errors path="country" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Phone Number:</div>
                        <div class="col-9 text-left">
                            <form:input id="phoneNumber" path="phoneNumber" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="phoneNumber" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>

                        <div class="col-8 text-center">
                            <input type="reset" class="btn btn-primary" value="Reset">&nbsp;
                            <input type="button" class="btn btn-primary" value="Save"
                                onclick="addAddress();return false;">&nbsp;
                            <input
                                type="button" class="btn btn-primary" value="Cancel"
                                onclick="make_hidden('formInput');return false;">
                        </div>
                        <div class="col-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-12">&nbsp;</div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
 </div>