<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
  <div style="margin-top:40px"><h3>Order List</h2></div>
  <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>OrderDate</th>
        <th>TotalPrice</th>
        <th>ContractEmail</th>
        <th>ContractPhone</th>
        <th>BillingAddress</th>
        <th>ShippingAddress</th>
        <th>Notes</th>
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
	        <td>${order.shipingAddress}</td>
	        <td>${order.notes}</td>
	      </tr>
		</c:forEach>
    </tbody>
  </table>
</div>

