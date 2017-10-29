<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!-- Where all the magic happens -->
<!-- LOGIN FORM -->
<div class="text-center" style="padding:50px 0 200px">
	<div class="logo"><spring:message code="login"/></div>
	<div style="color:green;margin-left:20px" >   	
		<p>${message}</p>
	</div>
	<div id="errors" style="color:red;margin-left:20px" >   	
		<p>${errors}</p>
	</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form:form id="login-form" modelAttribut="login" method="Post" class="text-left" action="doLogin">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="lg_username" class="sr-only">Username</label>
						<input type="text" class="form-control" id="lg_username" name="userId" placeholder="username">
					</div>
					<div class="form-group">
						<label for="lg_password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="lg_password" name="password" placeholder="password">
					</div>
				</div>
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<a href="addUser">Creating admin User (For Admin function only)</a>
			</div>
			<div class="etc-login-form">
                <a href="addCustomer">Creating New Customer</p>
            </div>		
		</form:form>
	</div>
	<!-- end:Main Form -->
</div>

