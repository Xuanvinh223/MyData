<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="card-box mb-30">
<c:url var = "url" value="/admin"/>
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
			<h2 class="h4 pd-20">Quản lý người dùng</h2>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
		<br>
			<button class="btn btn-info" data-toggle="modal" data-target="#createUserModal">Thêm tài khoản</button>
		</div>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>STT</th>
				<th>Tên đăng nhập</th>
				<th>Mật khẩu</th>
				<th>Họ tên</th>
				<th>Email</th>
				<th>Vai trò</th>
				<th>Thao tác</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "listUser" items = "${listUser}" varStatus="loop">
				<tr>
					<td>${loop.index + 1}</td>
					<td>${listUser.id}</td>
					<td>${listUser.password}</td>
					<td>${listUser.fullName}</td>
					<td>${listUser.email}</td>
					<td>${listUser.role ? 'Admin' : 'User'}</td>
				<td>
					<div class="dropdown">
						<a
							class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
							href="#" role="button" data-toggle="dropdown"> <i
							class="dw dw-pencil-1"></i>
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
							<form action="" method="POST">
								<a class="dropdown-item" href="#" data-id="${listUser.id}" class="btn btn-primary" data-toggle="modal" data-target="#editUserModal"><i class="dw dw-edit2"></i> Edit</a> 
								<a class="dropdown-item" href="${url}/deleteUser/${listUser.id}"><i class="dw dw-delete-3"></i> Delete</a>
							</form>
						</div>
					</div>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>