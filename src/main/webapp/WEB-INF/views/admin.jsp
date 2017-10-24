<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    <script>
		var contextRoot = "/" + window.location.pathname.split( '/' )[1];
        $(document).ready(function(){
            var quantitiy=0;
            $('.quantity-right-plus').click(function(e){

                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());
				var max= parseInt($('#quantity').attr("max"));
                
				if (quantity < max) {
	                $('#quantity').val(quantity + 1);
	                // Increment
				} 
            });

            $('.quantity-left-minus').click(function(e){
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());
                // If is not undefined
                // Increment
                if(quantity>1){
                    $('#quantity').val(quantity - 1);
                }
            });

            $('#addNewProduct').click(function(e){
                // Stop acting like a button
                e.preventDefault();
	            $("#product_view #name").val("");
	            $("#product_view #details").val("");
	            $("#product_view #tag").val("");
	            $("#product_view #price").val("");
	            $("#product_view #quantity").val("");
	            $("#product_view #id").val("");
	            $("#product_view #image").attr("src","");
	            $("#product_view").data("product");
	            $("#product_view").modal("toggle");
            });

        });
        
        function showEdit(event, id) {
			console.info(id);
			event.preventDefault();
			$.ajax({
				type : 'GET',
				url : contextRoot + '/product/'+id,
				contentType : 'application/json', 
				success: function( product ) {
					console.info("success");
		            $("#product_view #name").val(product.name);
		            $("#product_view #details").val(product.details);
		            $("#product_view #tag").val(product.tag);
		            $("#product_view #price").val(product.price);
		            $("#product_view #quantity").val(product.quantity);
		            $("#product_view #id").val(product.id);
		            $("#product_view #image").attr("src","resource/images/products/" + product.id + ".jpg");
		            $("#product_view #errors").empty();
		            $("#product_view").data("product", product);
		            $("#product_view").modal("toggle");
				},
				error: function( errorObject ){	
					console.info("error");
				}
			
			});	
        }
        
        function showDelete(event, id) {
			console.info(id);
			event.preventDefault();
            $("#confirmDelete #id").val(id);
            $("#confirmDelete").modal("toggle");
        }        

        function loadFile(e) {
			$("#product_view #image").attr("src",URL.createObjectURL(event.target.files[0]));
        }
        
        function submitProductSaveForm(e) {
        	console.info("on click");
        	event.preventDefault();
            $("#product_view #errors").empty();
        	var dataToSend = JSON.stringify(serializeObject($('#saveProduct')));
			$.ajax({
				type : 'POST',
				url : contextRoot + '/validate',
				contentType : 'application/json', 
				dataType : "json", 
				data : dataToSend,
				success: function( product ) {
					console.info("success");
		        	document.getElementById("saveProduct").submit();
				},
				error: function( errorObject ){	
					if (errorObject.responseJSON.errorType == "ValidationError") {
						//More Code here..
						var errorList = errorObject.responseJSON.errors;
						$("#errors").append('<p>');
						$.each(errorList, function(i, error) {
							$("#errors").append(error.message + '<br>');
						});
						$("#errors").append('</p>');
						$('#errors').show();
					} else {
						$("#errors").append('<p>');
						$("#errors").append(errorObject.responseJSON.errorType + '<br>');
						$("#errors").append('</p>');
						$('#errors').show();
					}		
				}
			});	
        }
        
        function submitProductDeleteForm(e) {
        	console.info("on delete click");
        	event.preventDefault();
		    document.getElementById("deleteProduct").submit();
        }
        
        function serializeObject (form)
        {
            var jsonObject = {};
            var array = form.serializeArray();
            $.each(array, function() {
                 	jsonObject[this.name] = this.value;
            });
            return jsonObject;

        };        
    </script>

<!-- Page Content -->
<div class="container">
	<h3 class="my-4">Product List</h3>
   <table class="table">
    <thead>
      <tr>
        <th><spring:message code="id"/></th>
        <th><spring:message code="name"/></th>
        <th><spring:message code="tag"/></th>
        <th><spring:message code="price"/></th>
        <th><spring:message code="quantity"/></th>
        <th><spring:message code="details"/></th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="product" items="${products}">
	      <tr>
	        <td>${product.id}</td>
	        <td>${product.name}</td>
	        <td>${product.tag}</td>
	        <td>${product.price}</td>
	        <td>${product.quantity}</td>
	        <td>${product.details}</td>
            <td>
            	<button style="margin-bottom:10px" type="button" class="btn btn-primary" onclick="showEdit(event, ${product.id})"><spring:message code="edit"/></button>
            </td>	
            <td>
             	<button style="margin-bottom:10px" type="button" class="btn btn-primary" onclick="showDelete(event, ${product.id})"><spring:message code="delete"/></button>
            </td>	
	      </tr>
		</c:forEach>
    </tbody>
  </table>
 
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<div class="modal fade product_view" id="product_view">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title"><spring:message code="edit"/></h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>
			</div>
			
			<form:form id="saveProduct" modelAttribute="product" action="saveProduct" method="post" enctype="multipart/form-data">
			<div class="modal-body">
					<!-- Success - or Validation errors -->
				<div class="row">
	    			<div id="errors" style="color:red;display:none;margin-left:20px" >   	
	      			</div>
	      		</div>
			
				<div class="row">
					<div class="col-md-4 product_img">
						<img id="image" src="" class="img-responsive" style="width:120px; height:80px; margin-bottom:15px">
					</div>
					<div class="col-md-8">
					<form:input path="image" id="selectImage" type="file" accept="image/*" onchange="loadFile(event)" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 product_content">
						<p><spring:message code="name"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="name" id="name"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="tag"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="tag" id="tag" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="price"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="price" id="price" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="quantity"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="quantity" id="quantity"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="details"/></p>
					</div>
					<div class="col-md-8">
						<form:textarea path="details" rows="5" cols="30" id="details"/>
					</div>
				</div>
				<form:hidden path="id" id="id"/>
			</div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	            <button type="button" class="btn btn-danger" onclick="submitProductSaveForm()">Save</button>
	         </div>
			</form:form>
	         
		</div>
	</div>
</div>


<div class="modal fade" id="confirmDelete" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><spring:message code="deletePermanently"/></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p><spring:message code="areYouSure"/></p>
            </div>
			<form:form id="deleteProduct" modelAttribute="product" action="deleteProduct" method="post">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="cancel"/></button>
                <button type="button" class="btn btn-danger" onclick="submitProductDeleteForm()"><spring:message code="delete"/></button>
            </div>
			<form:hidden path="id" id="id"/>
			</form:form>
        </div>
    </div>
</div>

