<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<tr>
<c:url var = "url" value="/admin"/>
	<td>${param.index}</td>
	<td class="table-plus">${param.id}</td>
	<td>
		<h5 class="font-16"
			style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2; overflow: hidden;">${param.title}</h5>
	</td>
	<td>${param.views}</td>
	<td><img src="/Assignment_FpolyOE/upload/${param.poster}"
		width="70" height="70" alt=""></td>
	<td>${param.active ? 'Đang hoạt động' : 'Ngưng hoạt động'}</td>
	<td style="width: 32px !important;">
		<h5 style="display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 1; overflow: hidden;">${param.description}</h5>
	</td>
	<td>
		<div class="dropdown">
			<a
				class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
				href="#" role="button" data-toggle="dropdown"> <i
				class="dw dw-pencil-1"></i>
			</a>
			<div
				class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
				<form action="" method="POST">
					<a class="dropdown-item" href="/Assignment_FpolyOE/index/videoDetail/${param.id}"><i class="dw dw-eye"></i>View</a>
					<a type="submit" data-id="${param.id}" class="dropdown-item" href="${url}/editVideo/${param.id}" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal"><i class="dw dw-edit2"></i> Edit</a>
					<button type="submit" class="dropdown-item"
						formaction="${url}/deleteVideo/${param.id}">
						<i class="dw dw-delete-3"></i> Delete
					</button>
				</form>
			</div>
		</div>
	</td>
</tr>