<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

    <script>
        $(document).ready(function(){
            var quantitiy=0;
            $('.quantity-right-plus').click(function(e){

                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('#quantity').val());
                // If is not undefined
                $('#quantity').val(quantity + 1);
                // Increment
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

            $('#detail').click(function(e){
                $("#product_view #title").text("AAAA");
                $("#product_view").modal();
            });
        });
    </script>

<!-- Page Content -->
<div class="container">
	<h3 class="my-4">Welcome to our PetsMart</h3>

	<!-- Portfolio Section -->
	<div class="row">
		<c:forEach var="product" items="${products}">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://boulderinn.com/bldrinn/wp-content/uploads/2010/10/pets-712-X-495.jpg"
						alt="" width="700" height="200"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">${product.name}</a>
						</h4>
						<p class="card-text">${product.details}</p>
					</div>
					<div>${product.name}</div>
	                <div class="btn-ground text-center btn-lg">
	                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i class="fa fa-shopping-cart"></i>View Detail</button>
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
				<h3 class="modal-title" id="title">Dog</h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-4 product_img">
						<img src="http://boulderinn.com/bldrinn/wp-content/uploads/2010/10/pets-712-X-495.jpg" class="img-responsive" style="width:150px">
					</div>
					<div class="col-md-8 product_content">
						<h6>
							Product Id: <span>10001</span>
						</h6>
						<p>The Best Western Plus Boulder Inn is one of only a few pet-friendly accommodations in the area, and the only hotel in Boulder, CO that does not require a non-refundable fee.
						</p>
						<h4 class="cost">
							<span>$</span> 75.00
						</h4>

						<div class="input-group"
							style="width: 130px; padding-bottom: 15px">
							<span class="input-group-btn">
								<button type="button"
									class="quantity-left-minus btn btn-danger btn-number"
									data-type="minus" data-field="">
									<span class="glyphicon glyphicon-minus">+</span>
								</button>
							</span> <input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn">
								<button type="button"
									class="quantity-right-plus btn btn-success btn-number"
									data-type="plus" data-field="">
									<span class="glyphicon glyphicon-plus">-</span>
								</button>
							</span>
						</div>

						<!-- end col -->
						<div class="space-ten"></div>
						<div class="btn-ground">
							<button type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-shopping-cart"></span> Add To
								Cart
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



