<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
<c:url var = "url" value="/index"/>
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">
				<div class="main-banner">
					<div class="row">
						<div class="header-text">
							<div class="live-stream">
								<div class="col-lg-12">
									<div class="heading-section">
										<h4>
											<em></em> Video yêu thích của bạn
										</h4>
									</div>
								</div>
								<div class="row">
									<c:forEach var="listFavorites" items="${listFavorites}">
										<div class="col-lg-3 col-sm-6">
											<div class="item">
												<div class="thumb">
													<a href="${url}/videoDetail/${listFavorites.video.id}"> <img src=" <c:url value = '/user/image/${listFavorites.video.poster}' /> "
														alt="">
													</a>
													<div class="hover-effect">
														<div class="content">
															<ul>
																<li><a href="#"><i class="fa fa-eye"></i> <fmt:formatNumber value = "${listFavorites.video.views}" pattern = "#,###" /></a></li>
														<!-- 		<li><a href="#"><i class="fa fa-thumbs-up"></i></a></li> -->
															</ul>
														</div>
													</div>
												</div>
												<!-- <div class="down-content"> -->
													<div class="avatar">
														<img src="" alt=""
															style="max-width: 46px; border-radius: 50%; float: left;">
														<h5 class="text-break" style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2; overflow: hidden;">${listFavorites.video.title}</h5>
													</div>
													<div class="list-group-item">
														<form action="" method="get">
															<button type="submit" class="btn btn-info btn-sm" formaction="${url}/unlike/${listFavorites.id}">
															<i class="fa fa-thumbs-up"></i> Bỏ thích
															</button>
															<button type="submit" class="btn btn-secondary btn-sm" formaction="${url}/share/${listFavorites.video.id}" >
															<i class="fa fa-solid fa-share"></i> Chia sẻ
															</button>
														</form>
													</div>
												<!-- </div> -->
											</div>
										</div>
									</c:forEach>
									<div class="col-lg-12">
										<div class="main-button">
											<!-- <a href="streams.html">Load More Streams</a> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ***** Featured End ***** -->
			</div>
		</div>
	</div>
</div>