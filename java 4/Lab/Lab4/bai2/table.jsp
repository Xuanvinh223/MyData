<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3>User List</h3>
<table border="1" style="width: 100%;">
	<thead>
		<tr>
			<th>Username</th>
			<th>Password</th>
			<th>Remember?</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${items}">
		<tr>
			<td>${item.username}</td>
			<td>${item.password}</td>
			<td>${item.remember?'Yes':'No'}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>