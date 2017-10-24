<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>



<div class="container">
<h3 class="my-4"><spring:message code="cart"/></h3>

<c:forEach var="item" items="${items}">
	
	<div class="row cartItem" style="margin: 50px">
		<div class="col-2"><img class="card-img-top" src="resource/images/products/${item.product.image}"
							alt="" width="300" height="100"></div>
		<div class="col-5">
			<div class="row">
				<div class="col-12 cartItemName">${item.product.name}</div>
				<div class="col-12 cartItemTag">${item.product.tag}</div>
				<div class="col-12"><a href="<spring:url value="/removeItem/${item.id}"/>"><spring:message code="remove"/></a></div>
			</div>
		</div>
		<div class="col-3 cartItemPrice">$${item.discount}</div>
		<div class="col-2">
		<form action="updateCart">
			<select name="quantity">
				<option value="${item.quantity}">${item.quantity}</option>
				<c:forEach var="i" begin="1" end="10">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="itemId" value="${item.id}"/>
			<br>
			<input type="submit" value="update"/>
		</form>
		</div>
	</div>

</c:forEach>

<div class="row" style="margin: 50px">
	<div class="col-7"></div>
	<div class="col-3 cartItemPrice"><spring:message code="total"/><br>$${totalCost}</div>
	<div class="col-2"><a href="<spring:url value="checkout"/>"><spring:message code="checkout"/></a></div>
</div>

</div>