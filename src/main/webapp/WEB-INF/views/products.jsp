<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<script src="resource/js/products.js"></script>
 
<!-- Page Content -->
<div class="container">
	<h3 class="my-4"><spring:message code="products.welcome"/></h3>

	<!-- Portfolio Section -->
	<div class="row">
		<c:forEach var="product" items="${products}">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#" onclick="getProduct(event, ${product.id})">
						<img class="card-img-top" src="resource/images/products/${product.id}.jpg"
							alt="" width="600" height="200"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" onclick="getProduct(event, ${product.id})">${product.name}</a>
						</h4>
						<p class="card-text">${product.tag}</p>
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
							<span id="details"><spring:message code="products.notFound"/></span>
						</p>
						<h4 class="cost">
							$<span id="price"><spring:message code="products.notFound"/></span> 
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
								<span class="glyphicon glyphicon-shopping-cart"></span> <spring:message code="products.addToCart"/>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



