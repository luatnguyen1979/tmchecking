<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head> 
<body>

		<div class="jumbotron">
			
				
				<H1>Pets Mart Content</H1>
				<p> <img src="<spring:url value="/resource/images/petsmart.jpg"  htmlEscape="true" />" alt="Welcome page."  />

	 
 
				  <%-- <div class="container">
 				  <security:authorize access="isAnonymous()">
 				 
    					<a href="<spring:url value='/login' />" class="btn btn-default pull-right"> Login</a>

				</security:authorize>
		
					 <a href="<spring:url value='/members' />" class="btn btn-default">
						<span class="glyphicon-hand-right glyphicon"></span> Go to Community
					</a>
				</div>	 --%>
	 			
		</div>	

	
</body>
</html>
