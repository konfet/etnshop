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
<div align="left" id="msk-body">
<h2>Edit product</h2>

	<form action="/etnshop/product/save/${product.id}" method="post" action="POST">
		<table>
		<tr><td>ID</td><td><input type="text" name="productId" value="${product.id}" disabled></td></tr>
		<tr><td>Name</td><td><input type="text" name="productName" value="${product.name}"></td></tr>
		<tr><td>Serial</td><td><input type="text" name="serial" value="${product.serial}"></td></tr>
		<tr><td><input class="msk-btn" type="submit" value="Save changes"/></td></tr>
		</table>
			</form>
	
	<p>&copy; Etnetera a.s. 2015</p>
	
</div>

</body>
</html>
