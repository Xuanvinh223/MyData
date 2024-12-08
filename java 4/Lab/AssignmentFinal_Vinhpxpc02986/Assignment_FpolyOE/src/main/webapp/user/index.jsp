<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
 <div class="container">
<!--  <div id="alert-container"></div> -->

		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<!-- ***** Banner Start ***** -->
					<div class="main-banner bg-gradient">
						<div class="row ">
							<div class="col-lg-7">
								<div class="header-text">
									<h1 class="fw-bold">Chúng tôi mang đến cho bạn những trải
										nghiệm thú vị nhất</h1>
									<p class="fs-5 mt-3">Thiết kế theo đúng cách để đưa bạn vào
										trò chơi và khám phá thế giới đầy màu sắc.</p>
									<div class="main-button">
										<!-- Thêm nút gì đó ở đây -->
										<button class="btn btn-lg btn-primary mt-3">Bắt đầu
											ngay</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->

					<!-- ***** Most Popular Start ***** -->
					<div class="most-popular">
						<div class="row">
							<div class="col-lg-12">
								<div class="heading-section">
									<!-- <h4><em></em>Phổ biến</h4> -->
								</div>
								<div class="row">
									<c:forEach var="listVideo" items="${listVideo}">
										<jsp:include page="container/item.jsp">
											<jsp:param value="${listVideo.poster}" name="hinhAnh"/>
											<jsp:param value="${listVideo.title}" name="tieuDeVideo"/>
											<jsp:param value="${listVideo.views}" name="luotXem"/>
											<jsp:param value="${listVideo.id}" name="id"/>
										</jsp:include>
									</c:forEach>		
									<div class="col-lg-12">
										<div class="main-button">
											<!-- <a href="browse.html">Discover Popular</a> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Most Popular End ***** -->
				</div>
			</div>
		</div>
	</div>
