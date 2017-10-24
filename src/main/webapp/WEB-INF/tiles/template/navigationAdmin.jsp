<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

 <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light fixed-top">
      <div class="container">
        <div class="dp-logo-container col-lg-3">
			<a href="admin"> <img src="resource/images/petsmart-logo.png"
				alt="PetSmart">
			</a>
		</div>
		<div class="dp-search col-lg-5">
			
		<form class="navbar-form" action="adminSearch">
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
              <a class="nav-link" href="#" id="addNewProduct">Add a product</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="orders">Order list</a>
            </li>
            <li class="nav-item">
<% if (session.getAttribute("login") == null) { %>
      	<a class="nav-link" href="login"><span class="fa fa-user-plus fa-fw"></span>Sign In</a>
<% } else {%>
		<a class="nav-link" href="logout"><span class="fa fa-user-plus fa-fw"></span>Sign Out</a>
<% } %>
            </li>
          </ul>
        </div>
      </div>
    </nav>
