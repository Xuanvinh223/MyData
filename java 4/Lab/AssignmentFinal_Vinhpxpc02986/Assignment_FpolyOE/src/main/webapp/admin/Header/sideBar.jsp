<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="left-side-bar">
<c:url var = "url" value="/admin"/>
	<div class="brand-logo"> 
		<a href="${url}"> <img src="<c:url value = '/admin/vendors/images/deskapp-logo.svg'/>"
			alt="" class="dark-logo"> <img
			src="<c:url value = '/admin/vendors/images/deskapp-logo-white.svg'/> " alt="" class="light-logo">
		</a>
		<div class="close-sidebar" data-toggle="left-sidebar-close">
			<i class="ion-close-round"></i>
		</div>
	</div>
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">
				<li class="dropdown"><a href="${url}/createVideo" class="dropdown-toggle"> <span
						class="micon dw dw-video-player"></span><span class="mtext">Quản
							lý video</span>
				</a> <a href="${url}/createUser" class="dropdown-toggle"> <span
						class="micon dw dw-user"></span><span class="mtext">Quản lý
							người dùng</span>
				</a> <a href="${url}/Report" class="dropdown-toggle"> <span
						class="micon dw dw-bar-chart"></span><span class="mtext">Thống
							kê</span>
				</a></li>
			</ul>
		</div>
	</div>
</div>