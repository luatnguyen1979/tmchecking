<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light fixed-top">
      <div class="container">
        <div class="dp-logo-container col-lg-3">
			<a href="products"><img src="resource/images/petsmart-logo.png"
				alt="PetSmart">
			</a>
		</div>
		<div class="dp-search col-lg-4">
			
		<form class="navbar-form" action="search">
        <div class="form-group" style="display:inline;">
          <div class="input-group">
            <input name="keyword" type="text" class="form-control" placeholder="keywords" value=${keyword}>
           		<button type="submit" class="btn btn-success" style="margin-left:-2px">
           		<i class="fa fa-search"></i>
				</button>
          </div>
        </div>
      </form>
		</div>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="help"><span class="fa fa-question fa-fw"></span>Help</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="help"><span class="fa fa-envelope fa-fw"></span>Contact US</a>
            </li>
            <li class="nav-item">

<% if (session.getAttribute("login") == null) { %>
      	<a class="nav-link" href="login"><span class="fa fa-user-plus fa-fw"></span>Sign In</a>
<% } else {%>
		<a class="nav-link" href="logout"><span class="fa fa-user-plus fa-fw"></span>Sign Out</a>
<% } %>
            </li>

            <li class="nav-item">
				<a href="cart">
				  <span class="icon-cart" style="clear: left; float: left">
				    <span class="cart-line-1" style="background-color: #2CC3B5"></span>
				    <span class="cart-line-2" style="background-color: #2CC3B5"></span>
				    <span class="cart-line-3" style="background-color: #2CC3B5"></span>
				    <span class="cart-wheel" style="background-color: #2CC3B5"></span>
				    <span class="cart-number" id="cartItemNum">${cartItems}</span>
				  </span>
				</a>
            </li>
		</ul>
        </div>
        
		<form id="internationlization"> 
		<select class="selectpicker" style="margin-left:20px" data-width="fit" name=language>
		    <option value="en" <c:if test = "${pageContext.response.locale == 'en'}">selected</c:if>>English</option>
		    
		  	<option value="jp" <c:if test = "${pageContext.response.locale == 'jp'}">selected</c:if>>Japanese</option>
		  	<option value="vt" <c:if test = "${pageContext.response.locale == 'vt'}">selected</c:if>>Vietnam</option>
		</select>        
		</form>
      </div>
    </nav>

 