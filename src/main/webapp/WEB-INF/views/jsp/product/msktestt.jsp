<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>msk Test</title>
<link href="/resources/core/css/msk.css" rel="stylesheet" />
</head>
<body>
<div align="center" id="msk-body">

<h2>msk Products</h2>
	
<input type="submit" name="drop" onClick="return msk_test();" value="TEST">		
<input type="submit" name="drop" onClick="return msk_confirm_test('${message}','jjjj');" value="Delete selected!!">			
<p><c:if test="${message != null}">${message}</c:if></p>
	
<div align="center" id="msk-block-search">
	<form action="/etnshop/product/msksearchh" method="post" action="POST">
	<table><tr>
	<td><input type="text" id="msk-input-search" name="num" placeholder="Enter the number of rows to show" /></td>	
	<td><input type="submit" id="stext" value="Show!" ></td>
	</tr></table>
	</form>
</div>	

	<table id="msk-table-res">
		
			<tr>
				<th>mskID</th>
				<th>mskName</th>
				<th>mskSerial</th>
			</tr>			
			<c:forEach items="${products}" var="product">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.serial}</td>
				</tr>	
			</c:forEach>		
	</table>
</div>

<spring:url value="/resources/core/js/msk-utils.js" var="mskJs" />
<script src="${mskJs}"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>