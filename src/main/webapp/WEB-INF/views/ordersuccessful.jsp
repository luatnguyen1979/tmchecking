<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="global">

	<div id="accordion" role="tablist">
            <div class="card">
	            <div class="card-header text-center" role="tab" id="headingOne">
	            <h4>You orders are successful. Please look at the following confirmation.</h4>
	            </div>
            </div>
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
					<div class="row">
						<div class="col-3 text-right">Full Name:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.fullName}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Address Line1:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.addressLine1}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Address Line2:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.addressLine2}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">City:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.city}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">State:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.state}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Zip Code:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.zipCode}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Country:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.country}</div>
					</div>
					<div class="row">
						<div class="col-3 text-right">Phone Number:</div>
						<div class="col-9 text-left">${doneCustomerOrder.shippingAddress.phoneNumber}</div>
					</div>

				</div>
			</div>
		</div>
		
		<div class="card">
            <div class="card-header" role="tab" id="headingTwo">


                <div class="row">
                    <div id="defautlPayment" class="col-xl-11 center-block text-left">
                    
                        <h5>2. <spring:message code="paymentMethod"/></h5>
                    </div>
                    <div class="col-xl-1">
                        <a class="collapsed" data-toggle="collapse" href="#collapseTwo"
                            aria-expanded="false" aria-controls="collapseTwo"> <spring:message code="change"/> </a>
                    </div>
                </div>


            </div>
            <div id="collapseTwo" class="collapse show" role="tabpanel"
                aria-labelledby="headingTwo" data-parent="#accordion">
                <div id="newPayment" class="card-body">
                
          
		            <div class="row"><div class="col-3 text-right">Card type:</div><div class="col-9 text-left"><img src="resource/images/cards/${doneCustomerOrder.payment.paymentMethod}.png"/></div></div>
		            <div class="row"><div class="col-3 text-right">Name on card:</div><div class="col-9 text-left">${doneCustomerOrder.payment.fullName}</div></div>
		            <div class="row"><div class="col-3 text-right">Card number:</div><div class="col-9 text-left">XXXX-XXXX-XXXX-${fn:substring(doneCustomerOrder.payment.cardNumber, 11, 15)}</div></div>
		            <div class="row"><div class="col-3 text-right">CCV:</div><div class="col-9 text-left">${doneCustomerOrder.payment.ccv}</div></div>
		            <div class="row"><div class="col-3 text-right">Expiration date:</div><div class="col-9 text-left">${doneCustomerOrder.payment.expirationMonth}/${doneCustomerOrder.payment.expirationYear}</div></div>
                </div>
            </div>
        

                <div class="row">
                    <div  class="col-xl center-block text-left"></div>
                    <div id="defautlAddress" class="col-xl-11 center-block text-left">
                        <h5>Billing address:</h5>
                    </div>
                </div>
            

            <div id="collapseOne" class="collapse show" role="tabpanel"
                aria-labelledby="headingOne" data-parent="#accordion">
                <div id="newAddress" class="card-body">
                    <div class="row">
                        <div class="col-3 text-right">Full Name:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.fullName}</div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Address Line1:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.addressLine1}</div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Address Line2:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.addressLine2}</div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">City:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.city}</div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">State:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.state}</div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Zip Code:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.zipCode}</div>
                    </div>
                    <div class="row">
                        <div class="col-3 text-right">Country:</div>
                        <div class="col-9 text-left">${doneCustomerOrder.billingAddress.country}</div>
                    </div>
                    

                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header" role="tab" id="headingThree">


                <div class="row">
                    <div class="col-xl-3 center-block text-left">
                        <h5>3. Ordered items</h5>
                    </div>
                    <div class="col-xl-7"></div>
                    <div class="col-xl-2 center-block text-right">

                    </div>
                </div>


            </div>


            <div id="collapseTwo" class="" role="tabpanel"
                aria-labelledby="headingTwo" data-parent="">
                <div class="card-body">

                    <div class="container">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col"><h5>Item</h5></div>
                            <div class="col-6 text-center"><h5>Description</h5></div>
                            <div class="col-2 text-center"><h5>Quantity</h5></div>
                            <div class="col-2 text-center"><h5>Price</h5></div>

                        </div>
                    
                    <c:forEach items="${doneCustomerOrder.items}" var="cartItem">

                        
                        <div class="row">
                            <div class="col"></div>
                            <div class="col"><a href="products"><img src="resource/images/products/${cartItem.product.id}.jpg" alt="${cartItem.product.name}" style='width:70px;height:70px;'/></a></div>
                            <div class="col-6 text-left">${cartItem.product.name}<br/>${cartItem.product.details}</div>
                            <div class="col-2 text-center">${cartItem.quantity}</div>
                            <div class="col-2 text-center">${cartItem.quantity*cartItem.product.price}</div>
                            
                        </div>
                         <div class="row">
                            <div class="col-12">&nbsp;</div>
                        </div>
                        
                    </c:forEach>
                        <div class="row">
                            <div class="col-10 text-right"><h4>Total Price:</h4></div>
                            <div class="col-2 text-left"><h4>${doneCustomerOrder.totalPrice}</h4></div>
                        </div>
                        <div class="row">
                            <div class="col-12">&nbsp;</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-header" role="tab" id="headingThree">


                <div class="row">
                    
                    <div class="col-xl-12 center-block text-center">
                    <form action="products">
                                                <input type="submit" class="btn btn-primary" value="Continue Shopping"/>       
                                                
                     </form>
                     </div>
                </div>


            </div>
        </div>

	</div>
</div>
