<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
  <div style="margin-top:40px"><h3>Order List</h2></div>
  <table class="table">
    <thead>
      <tr>
        <th><spring:message code="id"/></th>
        <th><spring:message code="orderDate"/></th>
        <th><spring:message code="totalPrice"/></th>
        <th><spring:message code="contractEmail"/></th>
        <th><spring:message code="contactPhone"/></th>
        <th><spring:message code="billingAddress"/></th>
        <th><spring:message code="shippingAddress"/></th>
        <th><spring:message code="notes"/></th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="order" items="${orders}">
	      <tr>
	        <td>${order.id}</td>
	        <td>${order.orderDate}</td>
	        <td>${order.totalPrice}</td>
	        <td>${order.contactEmail}</td>
	        <td>${order.contactCellPhone}</td>
	        <td>${order.billingAddress}</td>
	        <td>${order.shippingAddress}</td>
	        <td>${order.notes}</td>
	      </tr>
		</c:forEach>
    </tbody>
  </table>
</div>

