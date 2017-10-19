<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<link href="resource/css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>



<div class="container">

	<div class="dp-body notbootstrap">
		<div class="dp-logo-container col-lg-3">
			<a href="/"> <img src="resource/images/petsmart-logo.png"
				alt="PetSmart"> <span class="visually-hidden">PetSmart</span>
			</a>
		</div>
		<div class="dp-search col-lg-5">
			<!-- div class="dp-search-bar">
				<form role="search" action="/search/" method="get"
					name="simpleSearch">
					<input class="dp-search-input" type="text" name="q"
						placeholder="keywords"> <input type="submit" value=""
						id="submit" class="glyphicon glyphicon-search">
				</form>
			</div> -->
			<br/>
			<form class="navbar-form">
        <div class="form-group" style="display:inline;">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="keywords">
            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
          </div>
        </div>
      </form>
		</div>
		<div class="dp-promo1 col-lg-2">
			<div class="html-slot-container">
				<div style="margin-top: 9%; font-size: 16px;">
					<a href="#exclusions">fast, free shipping on orders over $49 ></a>
				</div>
			</div>
		</div>
		<div id="mini-cart" class="col-lg-1">
			 <div>
			 <br/>
        <a href="#" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
        </a>
      </div> 
			<div class="mini-cart-content dp-mini-cart-content empty-mini-cart">
				<p>Time to start shopping!</p>
			</div>
		</div>
	</div>
</div>

