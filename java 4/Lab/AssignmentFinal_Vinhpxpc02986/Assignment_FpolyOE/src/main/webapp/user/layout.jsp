<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>Cyborg - Video</title>
<link rel="shortcut icon"
	href="<c:url value = '/user/image/logo.png' />" type="image/x-icon">
<!-- Bootstrap core CSS -->
<link
	href="<c:url value = '/user/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet"
	href=" <c:url value = '/user/assets/css/fontawesome.css'/> ">
<link rel="stylesheet"
	href=" <c:url value = '/user/assets/css/templatemo-cyborg-gaming.css'/> ">
<link rel="stylesheet"
	href=" <c:url value = '/user/assets/css/owl.css'/> ">
<link rel="stylesheet"
	href=" <c:url value = '/user/assets/css/animate.css'/> ">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

</head>

<body>
	<c:url var="url" value="/index" />

	<%@include file="/user/Header/Popup.jsp"%>
	<!-- Header -->
	
	
	
	<%@include file="/user/Header/Header.jsp"%>
	<!-- ***** Header End ***** -->
	
	<c:choose>
	    <c:when test = "${message != null}">
		   	<div class="container">
				<div id="myAlert" style="z-index: 9999;" class="alert alert-danger alert-dismissible fade show text-center" role="alert">
				  <span id="myMessage"></span>
				</div>
			</div>     
	    </c:when>
        <c:otherwise>
        
        </c:otherwise>
       </c:choose>

	

	<jsp:include page="${views}" />


		
	
	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/user/vendor/jquery/jquery.min.js'></c:url>"></script>
	<script
		src="<c:url value='/user/vendor/bootstrap/js/bootstrap.min.js'></c:url>"></script>
	<script src=" <c:url value='/user/assets/js/isotope.min.js'></c:url> "></script>
	<script src=" <c:url value='/user/assets/js/owl-carousel.js'></c:url> "></script>
	<script src=" <c:url value='/user/assets/js/tabs.js'></c:url> "></script>
	<script src=" <c:url value='/user/assets/js/popup.js'></c:url> "></script>
	<script src=" <c:url value='/user/assets/js/custom.js'></c:url> "></script>

	<script>
		/* var mess = "";
		if(mess){
			alert(mess);
		} */
		
		const myMessage = "${message}"; // Thay đổi nội dung alert tại đây
		const myAlert = document.querySelector("#myAlert");
		const myAlertMessage = document.querySelector("#myMessage");

		myAlertMessage.textContent = myMessage;
		myAlert.classList.add("show");

		setTimeout(() => {
		  myAlert.classList.remove("show");
		}, 3000);

		
	</script>

</body>
</html>