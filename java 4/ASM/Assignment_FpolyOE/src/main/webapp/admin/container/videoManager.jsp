<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="card-box mb-30">
<c:url var = "url" value="/admin"/>
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
			<h2 class="h4 pd-20">Quản lý video</h2>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			<br>
			<button class="btn btn-info" data-toggle="modal" data-target="#themVideo">Thêm video</button>

		</div>
	</div>
	<table class="data-table table nowrap">
		<thead>
			<tr>
				<th>STT</th>
				<th class="table-plus datatable-nosort">ID</th>
				<th>Tên video</th>
				<th>Lượt xem</th>
				<th>Poster</th>
				<th>Trạng thái</th>
				<th>Mô tả</th>
				<th class="datatable-nosort">Sửa</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listVideo" items="${listVideo}" varStatus="loop">
				<jsp:include page="/admin/container/itemVideoManager.jsp">
					<jsp:param value="${loop.index + 1}" name="index"/>
					<jsp:param value="${listVideo.id}" name="id"/>
					<jsp:param value="${listVideo.active}" name="active"/>
					<jsp:param value="${listVideo.description}" name="description"/>
					<jsp:param value="${listVideo.poster}" name="poster"/>
					<jsp:param value="${listVideo.title}" name="title"/>					
					<jsp:param value="${listVideo.views}" name="views"/>					
				</jsp:include>
			</c:forEach>
		</tbody>
	</table>
</div>