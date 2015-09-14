<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>etnShop</title>

<spring:url value="/resources/core/css/msk.css" var="coreCss" />
<link href="${coreCss}" rel="stylesheet" />
</head>
<body>
<h2>Welcome to the ETN-Shop!</h2>
<div align="left" id="msk-body">	
			<input type="button" onClick = 'location.href="/etnshop/product/list"' value="List and search" >
			<input type="button" onClick = 'location.href="/etnshop/product/add"' value="Add new" >
</div>
</body>
</html>