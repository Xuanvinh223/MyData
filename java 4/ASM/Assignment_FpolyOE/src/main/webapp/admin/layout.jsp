<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
	

	<%@include file="/admin/Header/lib.jsp" %>

</head>

<body>
<c:url var = "url" value="/admin"/>

	
	<%@include file="/admin/Header/Modal.jsp" %>

	
	<%@include file="/admin/Header/header.jsp" %>


	<%@include file="/admin/Header/sideBar.jsp" %>


	<div class=" main-container">
		<div class="pd-ltr-20">
			<div class="row">
				<div class="col-xl-3 mb-30">
					<div class="card-box height-100-p widget-style1">
						<div class="d-flex flex-wrap align-items-center">
							<div class="progress-data">
								<div id="chart">
									<img src=" <c:url value = '/admin/src/images/apple-touch-icon.png' />" alt="">
								</div>
							</div>
							<div class="widget-data">
								<div class="weight-600 font-14">Tổng video được thích</div>
								<div class="h4 mb-0">${totalVideoLike}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 mb-30">
					<div class="card-box height-100-p widget-style1">
						<div class="d-flex flex-wrap align-items-center">
							<div class="progress-data">
								<div id="chart">
									<img src=" <c:url value = '/admin/src/images/apple-touch-icon.png'/> " alt="">
								</div>
							</div>
							<div class="widget-data">
								<div class="weight-600 font-14">Tổng số video đang hoạt
									động</div>
								<div class="h4 mb-0">${totalVideoActive}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 mb-30">
					<div class="card-box height-100-p widget-style1">
						<div class="d-flex flex-wrap align-items-center">
							<div class="progress-data">
								<div id="chart">
									<img src=" <c:url value = '/admin/src/images/apple-touch-icon.png'/> " alt="">
								</div>
							</div>
							<div class="widget-data">
								<div class="weight-600 font-14">Tài khoản</div>
								<div class="h4 mb-0">${totalAccount}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 mb-30">
					<div class="card-box height-100-p widget-style1">
						<div class="d-flex flex-wrap align-items-center">
							<div class="progress-data">
								<div id="chart">
									<img src=" <c:url value = '/admin/src/images/apple-touch-icon.png'/> " alt="">
								</div>
							</div>
							<div class="widget-data">
								<div class="weight-600 font-14">Chia sẽ</div>
								<div class="h4 mb-0">${totalShare}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="${views}"/>
		</div>
	</div>
	


	<script src=" <c:url value = '/admin/vendors/scripts/core.js'/> "></script>
	<!-- <script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script>
	<script src="src/plugins/apexcharts/apexcharts.min.js"></script>
	<script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<script src="vendors/scripts/dashboard.js"></script>  -->
	
	<script>
		var buttons = document.getElementsByClassName('dropdown-item'); // Lấy danh sách các phần tử HTML có lớp "my-button"
		for (var i = 0; i < buttons.length; i++) {
		  buttons[i].addEventListener('click', function(event) {
		    var dataId = event.target.dataset.id; // Lấy giá trị của thuộc tính "data-id" từ phần tử HTML đã kích hoạt sự kiện
		    var inputElement = document.getElementById('idVideo'); // Lấy phần tử input
		    inputElement.value = dataId; // Set giá trị của input bằng giá trị của dataId
		    console.log(dataId);
		  });
		}
		
		var buttons = document.getElementsByClassName('dropdown-item'); // Lấy danh sách các phần tử HTML có lớp "my-button"
		for (var i = 0; i < buttons.length; i++) {
		  buttons[i].addEventListener('click', function(event) {
		    var dataId = event.target.dataset.id; // Lấy giá trị của thuộc tính "data-id" từ phần tử HTML đã kích hoạt sự kiện
		    var inputElement = document.getElementById('edit-username'); // Lấy phần tử input
		    inputElement.value = dataId; // Set giá trị của input bằng giá trị của dataId
		    console.log(dataId);
		  });
		}
	</script>
	
</body>

</html>