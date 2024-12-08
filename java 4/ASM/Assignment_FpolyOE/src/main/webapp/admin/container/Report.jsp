<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card-box mb-30">
	<div class="row">
		<div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
			<h2 class="h4 pd-20">Thống kê</h2>
		</div>
	</div>
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#favorites">Yêu thích</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#favorites-user">Người dùng yêu thích</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#share">Chia sẻ bạn bè</a></li>
	</ul>
	<div class="tab-content mt-3">
		<div id="favorites" class="tab-pane active">
			<table class="table">
				<thead>
					<tr>
						<th>STT</th>
						<th>ID</th>
						<th>Tiêu đề video</th>
						<th>Lượt thích</th>
						<th>Ngày mới nhất</th>
						<th>Ngày cũ nhất</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="report" items="${listReport}" varStatus="loop">
					<tr>
						<td>${loop.index + 1}</td>
						<td>${report.id}</td>
						<td>${report.title}</td>
						<td>${report.likes}</td>
						<td><fmt:formatDate value="${report.newest}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
						<td><fmt:formatDate value="${report.oldest}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div id="favorites-user" class="tab-pane">
			<form action="" method="POST">
				<div class="input-group mb-3">
					<input type="search" class="form-control" placeholder="Tìm kiếm video" name = "titleVideo">
				</div>
			</form>
			<table class="table">
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên tài khoản</th>
						<th>Họ tên</th>
						<th>Email</th>
						<th>Ngày thích</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listUserLikeVideo" items="${listUserLikeVideo}" varStatus="loop">
						<tr>
							<td>${loop.index + 1}</td>
							<td>${listUserLikeVideo.user.id}</td>
							<td>${listUserLikeVideo.user.fullName}</td>
							<td>${listUserLikeVideo.user.email}</td>
							<td><fmt:formatDate value="${listUserLikeVideo.likeDate}" pattern="dd-MM-yyyy" /></td>
						</tr>
					</c:forEach>
			</table>
		</div>
		<div id="share" class="tab-pane">
			<form method="POST">
				<div class="mb-3">
					<input type="search" class="form-control" id="search" placeholder="Tìm kiếm video" name = "titleVideoShare">
				</div>
			</form>
			<table class="table">
				<thead>
					<tr>
						<th>STT</th>
						<th scope="col">Tên người gửi</th>
						<th scope="col">Email người gửi</th>
						<th scope="col">Email người nhận</th>
						<th scope="col">Ngày chia sẽ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listShareByTitleVideo" items="${listShareByTitleVideo}" varStatus="loop">
						<tr>
							<td>${loop.index + 1}</td>
							<td>${listShareByTitleVideo.user.fullName}</td>
							<td>${listShareByTitleVideo.user.email}</td>
							<td>${listShareByTitleVideo.emails}</td>
							<td><fmt:formatDate value="${listShareByTitleVideo.shareDate}" pattern="dd-MM-yyyy" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>