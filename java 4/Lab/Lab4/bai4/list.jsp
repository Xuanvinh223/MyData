<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="item" items="${items}">
		<div>
			Tên sản phẩm: ${item.name} <br>
			Hình ảnh: <img src="…/${item.image}"> <br>
			Giá: <del>${item.price}</del>	${item.price*(1-item.discount)}
			<br><br>
		</div>
	</c:forEach>
</body>
</html>