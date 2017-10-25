<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="resource/js/admin.js"></script>

<!-- Page Content -->
<div class="container">
	<h3 class="my-4">Product List</h3>
	<div class="row">
	 	<div style="color:red;margin-left:20px" >   	
	   		${errors}
	   	</div>
	</div>	
   <table class="table">
    <thead>
      <tr>
        <th><spring:message code="id"/></th>
        <th><spring:message code="name"/></th>
        <th><spring:message code="tag"/></th>
        <th><spring:message code="price"/></th>
        <th><spring:message code="quantity"/></th>
        <th><spring:message code="details"/></th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="product" items="${products}">
	      <tr>
	        <td>${product.id}</td>
	        <td>${product.name}</td>
	        <td>${product.tag}</td>
	        <td>${product.price}</td>
	        <td>${product.quantity}</td>
	        <td>${product.details}</td>
            <td>
            	<button style="margin-bottom:10px" type="button" class="btn btn-primary" onclick="showEdit(event, ${product.id})"><spring:message code="edit"/></button>
            </td>	
            <td>
             	<button style="margin-bottom:10px" type="button" class="btn btn-primary" onclick="showDelete(event, ${product.id})"><spring:message code="delete"/></button>
            </td>	
	      </tr>
		</c:forEach>
    </tbody>
  </table>
 
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<div class="modal fade product_view" id="product_view">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title"><spring:message code="edit"/></h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>
			</div>
			
			<form:form id="saveProduct" modelAttribute="product" action="saveProduct" method="post" enctype="multipart/form-data">
			<div class="modal-body">
					<!-- Success - or Validation errors -->
				<div class="row">
	    			<div id="errors" style="color:red;display:none;margin-left:20px" >   	
	      			</div>
	      		</div>
			
				<div class="row">
					<div class="col-md-4 product_img">
						<img id="image" src="" class="img-responsive" style="width:120px; height:80px; margin-bottom:15px">
					</div>
					<div class="col-md-8">
					<form:input path="image" id="selectImage" type="file" accept="image/*" onchange="loadFile(event)" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 product_content">
						<p><spring:message code="name"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="name" id="name"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="tag"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="tag" id="tag" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="price"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="price" id="price" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="quantity"/></p>
					</div>
					<div class="col-md-8 product_content">
						<form:input path="quantity" id="quantity"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<p><spring:message code="details"/></p>
					</div>
					<div class="col-md-8">
						<form:textarea path="details" rows="5" cols="30" id="details"/>
					</div>
				</div>
				<form:hidden path="id" id="id"/>
			</div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	            <button type="button" class="btn btn-danger" onclick="submitProductSaveForm()">Save</button>
	         </div>
			</form:form>
	         
		</div>
	</div>
</div>


<div class="modal fade" id="confirmDelete" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><spring:message code="deletePermanently"/></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p><spring:message code="areYouSure"/></p>
            </div>
			<form:form id="deleteProduct" modelAttribute="product" action="deleteProduct" method="post">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="cancel"/></button>
                <button type="button" class="btn btn-danger" onclick="submitProductDeleteForm()"><spring:message code="delete"/></button>
            </div>
			<form:hidden path="id" id="id"/>
			</form:form>
        </div>
    </div>
</div>

