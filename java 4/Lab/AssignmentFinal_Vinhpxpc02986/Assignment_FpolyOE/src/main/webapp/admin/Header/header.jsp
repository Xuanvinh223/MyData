<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header">
	<div class="header-left">
		<div class="menu-icon dw dw-menu"></div>
		<div class="search-toggle-icon dw dw-search2"
			data-toggle="header_search"></div>
	</div>
	<div class="header-right">
		<div class="user-info-dropdown">
			<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button"
					data-toggle="dropdown"> <span class="user-icon"> <img
						src=" <c:url value = '/admin/vendors/images/photo1.jpg'/>  " alt="">
				</span> <span class="user-name">${sessionScope.sessionUser.fullName}</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
					<a class="dropdown-item" href="/Assignment_FpolyOE/index"><i class="dw dw-logout"></i>Về Cyborg</a>
					<a class="dropdown-item" href="${url}/logout"><i class="dw dw-logout"></i>Đăng xuất</a>
				</div>

			</div>
		</div>
	</div>
</div>