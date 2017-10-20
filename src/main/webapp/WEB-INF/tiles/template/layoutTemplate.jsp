<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="resource/css/bootstrap.min.css" rel="stylesheet" >
<link href="resource/css/petsmart.css" rel="stylesheet" >

<script src="resource/js/jquery.min.js"></script>
<script src="resource/js/popper.min.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
</head>

<body>
		<tiles:insertAttribute name="navigation" />
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
</body>
</html>
