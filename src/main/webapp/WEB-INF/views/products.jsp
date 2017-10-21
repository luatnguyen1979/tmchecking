<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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
        });
        
        function getProduct(event, id) {
			console.info(id);
			event.preventDefault();
			$.ajax({
				type : 'GET',
				url : contextRoot + '/product/'+id,
				contentType : 'application/json', 
				success: function( product ) {
					console.info("success");
		            $("#product_view #name").text(product.name);
		            $("#product_view #description").text(product.details);
		            $("#product_view #price").text(product.price);
		            $("#product_view #image").attr("src","resource/images/products/" + product.image);
		            $("#product_view").data("product", product);
		            $("#product_view").modal("toggle");
				},
				error: function( errorObject ){	
					console.info("error");
				}
			
			});	
        }

        function addToCart() {
            var product = $("#product_view").data("product");
			var qty = $('#quantity').val();
				
			$.ajax({
				type : 'POST',
				url : contextRoot + '/addToCart/'+product.id + '/' + qty,
				contentType : 'application/json', 
				success: function( number ) {
					console.info("success");
					$("#cartItemNum").text(number);
					$("#product_view").modal('hide');
				},
				error: function( errorObject ){	
					console.info("error");
				}
			});				
       	}
    </script>

<!-- Page Content -->
<div class="container">
	<h3 class="my-4">Welcome to our PetsMart</h3>

	<!-- Portfolio Section -->
	<div class="row">
		<c:forEach var="product" items="${products}">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#" onclick="getProduct(event, ${product.id})">
						<img class="card-img-top" src="resource/images/products/${product.image}"
							alt="" width="600" height="200"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" onclick="getProduct(event, ${product.id})">${product.name}</a>
						</h4>
						<p class="card-text">${product.details}</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<div class="modal fade product_view" id="product_view">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="name">NotFound</h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4 product_img">
						<img id="image" src="" class="img-responsive" style="width:150px">
					</div>
					<div class="col-md-8 product_content">
						<p>
							<span id="description">NotFound</span>
						</p>
						<h4 class="cost">
							$<span id="price">NotFound</span> 
						</h4>

						<div class="input-group"
							style="width: 130px; padding-bottom: 15px">
							<span class="input-group-btn">
								<button type="button"
									class="quantity-left-minus btn btn-danger btn-number"
									data-type="minus" data-field="">
									<span class="glyphicon glyphicon-minus">-</span>
								</button>
							</span> <input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="2">
							<span class="input-group-btn">
								<button type="button"
									class="quantity-right-plus btn btn-success btn-number"
									data-type="plus" data-field="">
									<span class="glyphicon glyphicon-plus">+</span>
								</button>
							</span>
						</div>

						<!-- end col -->
						<div class="space-ten"></div>
						<div class="btn-ground">
							<button type="button" class="btn btn-primary" onClick="addToCart()">
								<span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



