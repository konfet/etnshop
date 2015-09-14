<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>etnShop</title>
<spring:url value="/resources/core/css/msk.css" var="coreCss" />
<link href="${coreCss}" rel="stylesheet" />
<spring:url value="/resources/core/js/msk-utils.js" var="mskJs" />
<script src="${mskJs}"></script>
</head>
<body>
<div align="center" id="msk-body">

<h2>Products</h2>
	
<div align="center" id="msk-block-search">	
	<form method="post" action="/etnshop/product/search">
	<table><tr>
	<td><input type="button" id="msk-input-add" onClick='location.href="/etnshop/product/add"' value="Add new" ></td>
	<td><input type="text" name = "query" id="msk-input-search" placeholder="Full-Text search..." /></td>	
	<td><input type="submit" id="stext" value="Search" ></td>
	</tr></table>
	</form>
</div>	

<h3><font color="red">${message}</font></h3>	
	<table id="msk-table-res">		
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Serial Number</th>
				<th>Edit</th>
				<th>Delete!</th>				
			</tr>			
			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.serial}</td>
					<td><input type="button" onClick = 'location.href="/etnshop/product/edit/${product.id}"' value="Edit" ></td>	
					<td><input type="button" name="drop" onClick="return msk_confirm_delete('${product.id}','${product.name}');" value="Delete"></td>					
<%-- 					<td><input type="button" onClick = 'location.href="/etnshop/product/delete/${product.id}"' value="Delete" ></td> --%>
				</tr>	
			</c:forEach>		
	</table>

<p>&copy; Etnetera a.s. 2015</p>

</div>
</body>
</html>