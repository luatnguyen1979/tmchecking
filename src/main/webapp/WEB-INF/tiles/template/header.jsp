<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css"
	rel="stylesheet">
<link href="resource/css/style.css"
	rel="stylesheet">

<div class="dp-header-container">

<div class="dp-body row notbootstrap">
<div class="dp-logo-container col-lg-3">
<a href="/">
<img src="resource/images/petsmart-logo.png" alt="PetSmart">
<span class="visually-hidden">PetSmart</span>
</a>
</div>
<div class="dp-search col-lg-5">
<div class="dp-search-bar">
<form role="search" action="/search/" method="get" name="simpleSearch">
<input class="dp-search-input" type="text" name="q" placeholder="search">
<input type="submit" value="" id="submit">
</form>
</div>
</div>
<div class="dp-promo1 col-lg-3">
<div class="html-slot-container">
<div style="margin-top: 9%; font-size: 16px;"><a href="#exclusions">fast, free shipping on orders over $49 ></a></div>
</div>
</div>
<div id="mini-cart" class="dp-mini-cart col-lg-1">


<div class="mini-cart-total">
<a class="mini-cart-link mini-cart-empty" data-lid="View Cart" data-lpos="Header" data-link-type="o" href="https://www.petsmart.com/cart/" title="View Cart">
<em class="icon-cart"></em>
</a>
</div>
<div class="mini-cart-content dp-mini-cart-content empty-mini-cart">
<p>Time to start shopping!</p>
</div>
</div>
</div>
