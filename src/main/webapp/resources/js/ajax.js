	// pathname is contextRoot/path/path/ so we want to get [1] 
    // that is where contextRoot is
	// [0] has "" as a result of split 
	var contextRoot = "/" + window.location.pathname.split( '/' )[1];

function addAddress(){
   	var dataToSend = JSON.stringify(serializeObject($('#addressForm')));
   	 $.ajax({
		type: 'POST',
		url: contextRoot + '/address/add',
//		url: '/Book5Rest/addCategory',
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(obj){

			$('#errors').html("");	
			$("#success").append('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>Adding address successful!</strong> Click Close to close the window.<button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick="javascript:closeAddressConfirmation();"><span aria-hidden="true">&times;</span></button></div>');
			$("#defautlAddress").html("");
			$("#defautlAddress").append('<h5>1. Shipping address - ' + obj.fullName + ' - ' +  obj.addressLine1 + ' ' + obj.addressLine2 + ', ' + obj.city + ', ' + obj.state + ' ' + obj.zipCode + ', US &nbsp; <a href="javascript:make_visible(\'formAddress\');" class="btn btn-primary">Add Address</a></h5>');
			$("#newAddress").html("");
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">Full Name:</div><div class="col-9 text-left">' + obj.fullName + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">Address Line1:</div><div class="col-9 text-left">' + obj.addressLine1 + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">Address Line2:</div><div class="col-9 text-left">' + obj.addressLine2 + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">City:</div><div class="col-9 text-left">' + obj.city + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">State:</div><div class="col-9 text-left">' + obj.state + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">Zip Code:</div><div class="col-9 text-left">' + obj.zipCode + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">Country:</div><div class="col-9 text-left">' + obj.country + '</div></div>');
 			$("#newAddress").append('<div class="row"><div class="col-3 text-right">Phone Number:</div><div class="col-9 text-left">' + obj.phoneNumber + '</div></div>');
 			//make_hidden('inputForm');
 			make_visible('result');
		},
 
		error: function(errorObject ){	
//			error: function(jqXHR,  textStatus,  HTTPStatus ){	
// jqXHR = jQuery XMLHttpRequest superset of  XMLHttpRequest
//	EXAMPLE values:		error: function(jQuery XMLHttpRequest,  "error",  "Bad Request" ){	
// 	see http://api.jquery.com/jquery.ajax/
			
			if (errorObject.responseJSON.errorType == "ValidationError") {
				$('#success').html("");
	 			$('#errors').html("");
	 			$("#errors").append( '<H3 align="center"> Error(s)<H3>');                
	  			    $("#result").append('<p>');
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	      
	 	 	        $.each(errorList,  function(i,error) {			   
	 	 	        		$("#errors").append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ error.message + '<br>');
	 	 	        });
	 	 	        
	 	 	        
	 	 	        $("#errors").append( '</p>');

	 	 	      $("#errors").append('<p align="center"><a href="javascript:make_hidden(\'result\');" class="btn btn-primary">Close</a></p>');
	 	 	      make_visible('result');
	 	 	      //make_visible('errors');
	 	 	        //$('#result').show();
			}
			else {
				alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
			}
 		}
	});
}

function addBilling(){
   	var dataToSend = JSON.stringify(serializeObject($('#billingForm')));
   	 $.ajax({
		type: 'POST',
		url: contextRoot + '/address/addbilling',
//		url: '/Book5Rest/addCategory',
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(obj){

			$('#errors2').html("");	
			$("#success2").append('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>Adding address successful!</strong> Click Close to close the window.<button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick="javascript:closeBillingConfirmation();"><span aria-hidden="true">&times;</span></button></div>');
			$("#defautlBilling").html("");
			$("#defautlBilling").append('<h5>3. Billing address - ' + obj.fullName + ' - ' +  obj.addressLine1 + ' ' + obj.addressLine2 + ', ' + obj.city + ', ' + obj.state + ' ' + obj.zipCode + ', US &nbsp; <a href="javascript:make_visible(\'formBilling\');" class="btn btn-primary">Add Address</a></h5>');
			$("#newBilling").html("");
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">Full Name:</div><div class="col-9 text-left">' + obj.fullName + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">Address Line1:</div><div class="col-9 text-left">' + obj.addressLine1 + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">Address Line2:</div><div class="col-9 text-left">' + obj.addressLine2 + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">City:</div><div class="col-9 text-left">' + obj.city + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">State:</div><div class="col-9 text-left">' + obj.state + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">Zip Code:</div><div class="col-9 text-left">' + obj.zipCode + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">Country:</div><div class="col-9 text-left">' + obj.country + '</div></div>');
 			$("#newBilling").append('<div class="row"><div class="col-3 text-right">Phone Number:</div><div class="col-9 text-left">' + obj.phoneNumber + '</div></div>');
 			//make_hidden('inputForm');
 			make_visible('result2');
		},
 
		error: function(errorObject ){	
//			error: function(jqXHR,  textStatus,  HTTPStatus ){	
// jqXHR = jQuery XMLHttpRequest superset of  XMLHttpRequest
//	EXAMPLE values:		error: function(jQuery XMLHttpRequest,  "error",  "Bad Request" ){	
// 	see http://api.jquery.com/jquery.ajax/
			
			if (errorObject.responseJSON.errorType == "ValidationError") {
				$('#success2').html("");
	 			$('#errors2').html("");
	 			$("#errors2").append( '<H3 align="center"> Error(s)<H3>');                
	  			    $("#result2").append('<p>');
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	      
	 	 	        $.each(errorList,  function(i,error) {			   
	 	 	        		$("#errors2").append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ error.message + '<br>');
	 	 	        });
	 	 	        
	 	 	        
	 	 	        $("#errors2").append( '</p>');

	 	 	      $("#errors2").append('<p align="center"><a href="javascript:make_hidden(\'result2\');" class="btn btn-primary">Close</a></p>');
	 	 	      make_visible('result2');
	 	 	      //make_visible('errors');
	 	 	        //$('#result').show();
			}
			else {
				alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
			}
 		}
	});
}

function addPayment(){
   	var dataToSend = JSON.stringify(serializeObject($('#paymentForm')));
   	 $.ajax({
		type: 'POST',
		url: contextRoot + '/payment/add',
//		url: '/Book5Rest/addCategory',
		dataType: "json",           // Accept header
 		data:dataToSend,
 		contentType: 'application/json',   // Sends - Content-type
		success: function(obj){

			$('#errors1').html("");	
			$("#success1").append('<div class="alert alert-warning alert-dismissible fade show" role="alert"><strong>Adding payment successful!</strong> Click Close to close the window.<button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick="javascript:closePaymentConfirmation();"><span aria-hidden="true">&times;</span></button></div>');
			$("#defautlPayment").html("");
			$("#defautlPayment").append('<h5>2. Payment method - <img src="resource/images/cards/' + obj.paymentMethod + '.png"/> ending in ' + obj.cardNumber.substring(12) + '&nbsp; <a href="javascript:make_visible(\'formPayment\');" class="btn btn-primary">Add Payment</a></h5>');
			$("#newPayment").html("");
 			$("#newPayment").append('<div class="row"><div class="col-3 text-right">Card type:</div><div class="col-9 text-left"><img src="resource/images/cards/' + obj.paymentMethod + '.png"/></div></div>');
 			$("#newPayment").append('<div class="row"><div class="col-3 text-right">Name on card:</div><div class="col-9 text-left">' + obj.fullName + '</div></div>');
 			$("#newPayment").append('<div class="row"><div class="col-3 text-right">Card number:</div><div class="col-9 text-left">' + obj.cardNumber + '</div></div>');
 			$("#newPayment").append('<div class="row"><div class="col-3 text-right">CCV:</div><div class="col-9 text-left">' + obj.ccv + '</div></div>');
 			$("#newPayment").append('<div class="row"><div class="col-3 text-right">Expiration date:</div><div class="col-9 text-left">' + obj.expirationMonth + '/' + obj.expirationYear +'</div></div>');
 			
 			//make_hidden('inputForm');
 			make_visible('result1');
		},
 
		error: function(errorObject ){	
//			error: function(jqXHR,  textStatus,  HTTPStatus ){	
// jqXHR = jQuery XMLHttpRequest superset of  XMLHttpRequest
//	EXAMPLE values:		error: function(jQuery XMLHttpRequest,  "error",  "Bad Request" ){	
// 	see http://api.jquery.com/jquery.ajax/
			
			if (errorObject.responseJSON.errorType == "ValidationError") {
				$('#success1').html("");
	 			$('#errors1').html("");
	 			$("#errors1").append( '<H3 align="center"> Error(s)<H3>');                
	  			    $("#result1").append('<p>');
	  			    var errorList = errorObject.responseJSON.errors;
	 	 	      
	 	 	        $.each(errorList,  function(i,error) {			   
	 	 	        		$("#errors1").append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ error.message + '<br>');
	 	 	        });
	 	 	        
	 	 	        
	 	 	        $("#errors1").append( '</p>');

	 	 	      $("#errors1").append('<p align="center"><a href="javascript:make_hidden(\'result1\');" class="btn btn-primary">Close</a></p>');
	 	 	      make_visible('result1');
	 	 	      //make_visible('errors');
	 	 	        //$('#result').show();
			}
			else {
				alert(errorObject.responseJSON.errors(0));   // "non" Validation Error
			}
 		}
	});
}

 
resetForm = function(id) {
    var element = document.getElementById(id);
    $(element)[0].reset();

    }	  
	


make_hidden = function(id) {
    var e = document.getElementById(id);
        e.style.display = 'none';
        }	   

make_visible = function(id) {
    var e = document.getElementById(id);
    e.style.display = 'block';
 }	   

// Translate form to array
// Then put in JSON format
 function serializeObject (form)
{
    var jsonObject = {};
    var array = form.serializeArray();
    $.each(array, function() {
         	jsonObject[this.name] = this.value;
    });
    return jsonObject;

};

function closeAddressConfirmation() {
	make_hidden('result');
	make_hidden('formAddress');
	document.getElementById('resetAddress').click();
 }

function closeBillingConfirmation() {
	make_hidden('result2');
	make_hidden('formBilling');
	document.getElementById('resetBilling').click();
 }

function closePaymentConfirmation() {
	make_hidden('result1');
	make_hidden('formPayment');
	document.getElementById('resetPayment').click();
 }

function closeErrorsConfirmation() {
	make_hidden('result');
 }

$(function() {
$('.selectpicker').on('change', function(){
    var selected = $(this).find("option:selected").val();
    $('#internationlization').submit();
  });
});
  