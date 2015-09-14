<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>etnShop</title>

<spring:url value="/resources/core/css/msk.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

<script type="text/javascript"
	src="/etnshop/resources/core/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/etnshop/resources/core/js/msk-utils.js"></script>
</head>

<div class="msk-test">
	<h2>Product Search</h2>
</div>

	<c:if test="${param.message != null}">${param.message}</c:if>
	
	<a class="btn btn-primary btn-lg" href="/etnshop/product/list"
		role="button">Products</a>

	<form action="search" method="post" action="POST">
		<label for="query">Query</label> <input type="text"
			placeholder="Search..." name="query" id="stext" /> <input
			type="submit" class="msk-btn" value="Search" />

	</form>
	<table align="center" id="msk-table-res">
		<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Serial</td>
				<td>Edit</td>
				<td>Delete!</td>				
			</tr>
		<c:forEach items="${products}" var="prod">
			<tr>
				<td>${prod.id}</td>
				<td>${prod.name}</td>
				<td>${prod.serial}</td>
				<td><a href="/etnshop/product/edit/${prod.id}">${prod.id}</a></td>
				<td><a href="/etnshop/product/delete/${prod.id}">${prod.id}</a></td>
			</tr>
		</c:forEach>
	</table>

	<footer>
		<p>&copy; Etnetera a.s. 2015</p>
	</footer>


<spring:url value="/resources/core/css/bootstrap.min.js"
	var="bootstrapJs" />

<script src="${bootstrapJs}"></script>

</body>
</html>