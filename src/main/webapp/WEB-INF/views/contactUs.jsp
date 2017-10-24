<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
<div class="col-md-5" style="margin-left:auto; margin-right:auto;">
<div class="form-area"> 
	<form:form action="helpSubmit" method="post" modelAttribute="emailForm">
	<p style="color:blue;">${success}</p>
	<br style="clear:both">
		<h3 style="margin-bottom:25px; text-align: center;"><spring:message code="contactForm"/></h3>
		<div class="form-group">
			<form:input type="text" class="form-control" path="name" placeholder="Name" required="required"/>
		</div>
		<div class="form-group">
			<form:input type="text" class="form-control" path="email" placeholder="Email" required="required"/>
		</div>
		<div class="form-group">
			<form:input type="text" class="form-control" path="mobile" placeholder="Mobile" required="required"/>
		</div>
		<div class="form-group">
			<form:input type="text" class="form-control" path="subject" placeholder="Subject" required="required"/>
		</div>
		<div class="form-group">
			<form:textarea class="form-control" type="textarea" path="message" maxlength="140" rows="7"></form:textarea>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
</div>
</div>
</div>
