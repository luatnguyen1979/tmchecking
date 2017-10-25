<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="global">
                            
	<div id="accordion" role="tablist">
	<form:form id="custOrderForm" action="placeOrder" modelAttribute="custOrder" method="post">
		<div class="card">
			<div class="card-header" role="tab" id="headingOne">

				<div class="row">

					<div id="defautlAddress" class="col-xl-11 center-block text-left">
						<h5>1. <spring:message code="shippingAddress"/> - ${customer.address.fullName} - ${customer.address.addressLine1} ${customer.address.addressLine2}, ${customer.address.city}, ${customer.address.state} ${customer.address.zipCode}, US &nbsp; <a href="javascript:make_visible('formAddress');" class="btn btn-primary"><spring:message code="addAddress"/></a></h5>
					</div>

					<div class="col-xl-1">
						<a data-toggle="collapse" href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> <spring:message code="change"/> </a>
							
                        
					</div>
				</div>
			</div>

			<div id="collapseOne" class="collapse show" role="tabpanel"
				aria-labelledby="headingOne" data-parent="#accordion">
				<div id="newAddress" class="card-body">
			

				</div>
			</div>
		</div>


		<div class="card">
			<div class="card-header" role="tab" id="headingTwo">


				<div class="row">
					<div id="defautlPayment" class="col-xl-11 center-block text-left">
					<c:set var = "shortNumber" value = "${fn:substring(customer.payment.cardNumber, 11, 15)}" />
						<h5>2. <spring:message code="paymentMethod"/> - <img src="resource/images/cards/${customer.payment.paymentMethod}.png"/> ending in XXXX-XXXX-XXXX-${shortNumber}&nbsp; <a href="javascript:make_visible('formPayment');" class="btn btn-primary"><spring:message code="addPayment"/></a></h5>
					</div>
					<div class="col-xl-1">
						<a class="collapsed" data-toggle="collapse" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"> <spring:message code="change"/> </a>
					</div>
				</div>


			</div>
			<div id="collapseTwo" class="collapse show" role="tabpanel"
				aria-labelledby="headingTwo" data-parent="#accordion">
				<div id="newPayment" class="card-body"></div>
			</div>
		</div>

        <div class="card">
            <div class="card-header" role="tab" id="headingOne">

                <div class="row">

                    <div id="defautlBilling" class="col-xl-11 center-block text-left">
                        <h5>3. <spring:message code="billingAddress"/> - ${customer.address.fullName} - ${customer.address.addressLine1} ${customer.address.addressLine2}, ${customer.address.city}, ${customer.address.state} ${customer.address.zipCode}, US &nbsp; <a href="javascript:make_visible('formBilling');" class="btn btn-primary"><spring:message code="addAddress"/></a></h5>
                    </div>

                    <div class="col-xl-1">
                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true"
                            aria-controls="collapseOne"> Change </a>
                            
                        
                    </div>
                </div>
            </div>

            <div id="collapseOne" class="collapse show" role="tabpanel"
                aria-labelledby="headingOne" data-parent="#accordion">
                <div id="newBilling" class="card-body">
            

                </div>
            </div>
        </div>


		<div class="card">
			<div class="card-header" role="tab" id="headingThree">


				<div class="row">
					<div class="col-xl-3 center-block text-left">
						<h5>3. <spring:message code="review"/></h5>
					</div>
					<div class="col-xl-7"></div>
					<div class="col-xl-2 center-block text-right">
						
						<a  href="cart" class="btn btn-primary"
                            > <spring:message code="reviewOrder"/> </a>
					</div>
				</div>


			</div>


			<div id="collapseTwo" class="" role="tabpanel"
				aria-labelledby="headingTwo" data-parent="">
				<div class="card-body">

					<div class="container">
					
					<c:forEach items="${customer.cart.cartItems}" var="cartItem">
					
					
						<div class="row">
							<div class="col-2"></div>
							<div class="col"></div>
							<div class="col-9 text-left"><spring:message code="estimatedDelivery"/>: </div>

						</div>
						<div class="row">
							<div class="col-2"></div>
							<div class="col"><a href="products"><img src="resource/images/products/${cartItem.product.id}.jpg" alt="${cartItem.product.name}" style='width:70px;height:70px;'/></a></div>
							<div class="col-8 text-left">${cartItem.product.name}<br/>${cartItem.product.details}</div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col-12">&nbsp;</div>
						</div>
						
					</c:forEach>
						
					</div>
				</div>
			</div>
			<div class="card-header" role="tab" id="headingThree">


                <div class="row">
                    
                    <div class="col-xl-12 center-block text-right">
												<input type="submit" class="btn btn-primary" value="Place Order"/>                    </div>
                </div>


            </div>
		</div>
		</form:form>
	</div>
</div>

<div id="formAddress" class="modal" style="display: none">
    <div class="modal-dialog">
        <!-- Modal content -->
        <div class="modal-content">
          <br/>
            <h3 align="center"><spring:message code="addingAddress"/></h3>
            <br/>
            
            <form:form id="addressForm" name="address" modelAttribute="shipAddr" method="POST">
                <div class="container">
                    
                    <div class="modal" id="result" style="display:none" >
                    <div class="modal-dialog">
                    <div class="modal-content">
			            <p id="success" >
			            </p> 
			            <p id="errors" >
			            </p>
                    </div>
                    </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="fullName"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="fullName" path="fullName" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="fullName" cssClass="text-danger"/>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-3 text-right"><spring:message code="addressLine1"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="addressLine1" path="addressLine1" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="addressLine1" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="addressLine2"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="addressLine2" path="addressLine2" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="addressLine2" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="city"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="city" path="city" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="city" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="state"/>:</div>
                        <div class="col-9 text-left">
                            <form:select id="state" path="state"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="" selected="true"><spring:message code="stateSelect"/></form:option>
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
                        <div class="col-3 text-right"><spring:message code="zip"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="zipCode" path="zipCode" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="zipCode" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="country"/>:</div>
                        <div class="col-9 text-left">
                            <form:select id="country" path="country"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="US" selected="true">United States</form:option>
                            </form:select>
                            <form:errors path="country" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="phone"/>:</div>
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
                            <input id="resetAddress" type="reset" class="btn btn-primary" value="Reset">&nbsp;
                            <input type="button" class="btn btn-primary" value="Save"
                                onclick="addAddress();return false;">&nbsp;
                            <input
                                type="button" class="btn btn-primary" value="Cancel"
                                onclick="make_hidden('formAddress');return false;">
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
 
 <div id="formPayment" class="modal" style="display: none">
    <div class="modal-dialog">
        <!-- Modal content -->
        <div class="modal-content">
          <br/>
            <h3 align="center"><spring:message code="addingPayment"/></h3>
            
            <br/>
            <form:form id="paymentForm" name="payment" modelAttribute="payment" method="POST">
                <div class="container">
                    
                    <div class="modal" id="result1" style="display:none" >
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <p id="success1" >
                        </p> 
                        <p id="errors1" >
                        </p>
                    </div>
                    </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-3 text-right align-text-middle"><spring:message code="cardType"/></div>
                        <div class="col-9 text-left">
                        
                        <form:select id="state" path="paymentMethod"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="" selected="true">--Select--</form:option>
                                <form:option value="VISA">VISA</form:option>
                                <form:option value="Discovery">Discovery</form:option>
                                <form:option value="American-Express">American Express</form:option>
                                <form:option value="MasterCard">MasterCard</form:option>
                                <form:option value="Diners-Club">Diners Club</form:option>
                                <form:option value="JCB">JCB</form:option>
                                </form:select>
                        
                     <%--        <form:radiobutton path="paymentMethod" value="VISA"/>&nbsp;<img src="resource/images/cards/VISA.png"/>&nbsp;&nbsp;&nbsp;<form:radiobutton
                    path="paymentMethod" value="MasterCard" />&nbsp;<img src="resource/images/cards/MasterCard.png"/>&nbsp;&nbsp;&nbsp;<form:radiobutton
                    path="paymentMethod" value="American-Express" />&nbsp;<img src="resource/images/cards/American-Express.png"/><br/>
                    <form:radiobutton
                    path="paymentMethod" value="Discover" />&nbsp;<img src="resource/images/cards/Discover.png"/>&nbsp;&nbsp;&nbsp;<form:radiobutton
                    path="paymentMethod" value="Diners-Club" />&nbsp;<img src="resource/images/cards/Diners-Club.png"/>&nbsp;&nbsp;&nbsp;<form:radiobutton
                    path="paymentMethod" value="JCB" /><img src="resource/images/cards/JCB.png"/> --%>

                        </div>

                    </div>
                    
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="cardName"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="fullName" path="fullName" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="fullName" cssClass="text-danger"/>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-3 text-right"><spring:message code="cardNumber"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="cardNumber" path="cardNumber" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="cardNumber" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="ccv"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="ccv" path="ccv" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="ccv" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="expirationDate"/>:</div>
                        <div class="col-9 text-left">
	                            <form:select id="month" path="expirationMonth">
	                            <form:option value="01">01</form:option>
	                            <form:option value="01">02</form:option>
	                            <form:option value="01">03</form:option>
	                            <form:option value="01">04</form:option>
	                            <form:option value="01">05</form:option>
	                            <form:option value="01">06</form:option>
	                            <form:option value="01">07</form:option>
	                            <form:option value="01">08</form:option>
	                            <form:option value="01">09</form:option>
	                            <form:option value="01">10</form:option>
	                            <form:option value="01">11</form:option>
	                            <form:option value="01">12</form:option>
                            </form:select>
                            <form:select id="year" path="expirationYear">
	                            <form:option value="2017">2017</form:option>
	                            <form:option value="2018">2018</form:option>
	                            <form:option value="2019">2019</form:option>
	                            <form:option value="2020">2020</form:option>
	                            <form:option value="2021">2021</form:option>
	                            <form:option value="2022">2022</form:option>
	                            <form:option value="2023">2023</form:option>
	                            <form:option value="2024">2024</form:option>
	                            <form:option value="2025">2025</form:option>
	                            <form:option value="2026">2026</form:option>
	                            <form:option value="2027">2027</form:option>
	                            <form:option value="2028">2028</form:option>
	                            <form:option value="2029">2029</form:option>
	                            <form:option value="2030">2030</form:option>
	                            <form:option value="2031">2031</form:option>
	                            <form:option value="2032">2032</form:option>
	                            <form:option value="2033">2033</form:option>
	                            <form:option value="2034">2034</form:option>
	                            <form:option value="2035">2035</form:option>
	                            <form:option value="2036">2036</form:option>
	                            <form:option value="2037">2037</form:option>
                            </form:select>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>

                        <div class="col-8 text-center">
                            <input id="resetPayment" type="reset" class="btn btn-primary" value="Reset">&nbsp;
                            <input type="button" class="btn btn-primary" value="Save"
                                onclick="addPayment();return false;">&nbsp;
                            <input
                                type="button" class="btn btn-primary" value="Cancel"
                                onclick="make_hidden('formPayment');return false;">
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
 
 <div id="formBilling" class="modal" style="display: none">
    <div class="modal-dialog">
        <!-- Modal content -->
        <div class="modal-content">
          <br/>
            <h3 align="center"><spring:message code="addingBilling"/></h3>
            <br/>
           
            
            <form:form id="billingForm" name="billing" modelAttribute="billAddr" method="POST">
                <div class="container">
                    
                    <div class="modal" id="result2" style="display:none" >
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <p id="success2" >
                        </p> 
                        <p id="errors2" >
                        </p>
                    </div>
                    </div>
                    </div>
                    
                 
                    
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="fullName"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="fullName" path="fullName" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="fullName" cssClass="text-danger"/>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-3 text-right"><spring:message code="addressLine1"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="addressLine1" path="addressLine1" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="addressLine1" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="addressLine2"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="addressLine2" path="addressLine2" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="addressLine2" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="city"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="city" path="city" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="city" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="state"/>:</div>
                        <div class="col-9 text-left">
                            <form:select id="state" path="state"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="" selected="true"><spring:message code="stateSelect"/></form:option>
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
                        <div class="col-3 text-right"><spring:message code="zip"/>:</div>
                        <div class="col-9 text-left">
                            <form:input id="zipCode" path="zipCode" type="text" size="46"
                                class="form:input-large" />
                            <form:errors path="zipCode" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="country"/>:</div>
                        <div class="col-9 text-left">
                            <form:select id="country" path="country"
                                style="width: 380px !important; min-width: 300px; max-width: 380px;">
                                <form:option value="US" selected="true">United States</form:option>
                            </form:select>
                            <form:errors path="country" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right"><spring:message code="phone"/>:</div>
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
                            <input id="resetBilling" type="reset" class="btn btn-primary" value="Reset">&nbsp;
                            <input type="button" class="btn btn-primary" value="Save"
                                onclick="addBilling();return false;">&nbsp;
                            <input
                                type="button" class="btn btn-primary" value="Cancel"
                                onclick="make_hidden('formBilling');return false;">
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