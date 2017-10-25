<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!-- REGISTRATION FORM -->
<div class="text-center" style="padding:50px 0">
	<div class="logo"><spring:message code="register"/></div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form:form id="register-form" modelAttribute="login" class="text-left" action="createUser">
			<div>
				<form:errors path="*" cssStyle="color : red;" />
			</div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="reg_username" class="sr-only">Email address</label>
						<input type="text" class="form-control" id="reg_username" name="userId" placeholder="username">
					</div>
					<div class="form-group">
						<label for="reg_password" class="sr-only">Password</label>
						<input type="password" class="form-control" id="reg_password" name="password" placeholder="password">
					</div>
					
					<div class="form-group">
						<label for="reg_firstname" class="sr-only">First Name</label>
						<input type="text" class="form-control" id="reg_fullname" name="customer.firstName" placeholder="first name">
					</div>
					<div class="form-group">
						<label for="reg_lastname" class="sr-only">First Name</label>
						<input type="text" class="form-control" id="reg_fullname" name="customer.lastName" placeholder="last name">
					</div>
					<div class="form-group">
						<label for="reg_lastname" class="sr-only">Cell Phone</label>
						<input type="text" class="form-control" id="reg_fullname" name="customer.cellPhone" placeholder="cell phone">
					</div>
				</div>
				
				<button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>already have an account? <a href="login">login here</a></p>
			</div>
		</form:form>
	</div>
	<!-- end:Main Form -->
</div>

