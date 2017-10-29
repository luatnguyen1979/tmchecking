<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="global">

	<div id="accordion" role="tablist">
		<div class="card">
			<div class="card-header text-center" role="tab" id="headingOne">
				<h4>
					<spring:message code="order.empty" />
				</h4>
			</div>
		</div>
		<div class="card">

			<div class="card-header" role="tab" id="headingThree">
			     <div class="row">
					<div class="col-xl-12 center-block text-center">
						<form action="products">
							<input type="submit" class="btn btn-primary"
								value="<spring:message code="button.continueshopping" />" />
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
