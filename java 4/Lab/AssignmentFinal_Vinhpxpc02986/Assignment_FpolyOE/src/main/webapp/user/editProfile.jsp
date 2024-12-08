<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
 <div class="container">
 <c:url var = "url" value="/index"/>
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-12 align-self-center">
                    <div class="main-info header-text">
                      <h4>Thông tin tài khoản</h4>
                      <ul>
                        <li class="text-white">Họ tên <span>${sessionScope.sessionUser.fullName}</span></li>
                        <li class="text-white">Tên đăng nhập <span>${sessionScope.sessionUser.id}</span></li>
                        <li class="text-white">Email <span>${sessionScope.sessionUser.email}</span></li>
                        <li class="text-white">Video đã thích <span>${countfavorite}</span></li>
                        <li><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editAccountModal">
                          Chỉnh sửa tài khoản
                        </button></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em></em>Yêu thích</h4>
              </div>
              <c:forEach var = "listFavoritesUser" items="${listFavoritesUser}" varStatus="loop">
              
	              	<div class="item">
	                <ul>
	             	   <li>
	                    <span class="m-5">${loop.index + 1}</span> 
	                  </li>
	                  <li>
	                  <img src="/Assignment_FpolyOE/upload/${listFavoritesUser.video.poster}" alt="" class="<!-- img-fluid -->">
	                  </li>
	                  <li style="margin-left: 10px; margin-right: 10px;">
	                    <h4>Tiêu đề video</h4><span class="text-br" style="display: -webkit-box; -webkit-box-orient: vertical;-webkit-line-clamp: 1;overflow: hidden;">${listFavoritesUser.video.title}</span>
	                  </li>
	                   
	                  <li>
	                    <h4>Lượt xem</h4><span class="m-5"><fmt:formatNumber value = "${listFavoritesUser.video.views}" pattern = "#,###" /></span>
	                  </li>
	                
	                  <li>
	                    <h4>Ngày thích</h4><span>  <fmt:formatDate value="${listFavoritesUser.likeDate}" pattern="dd/MM/yyyy" />  </span>
	                  </li>
	                  <li>
	                    <div class="main-border-button"><a href="${url}/videoDetail/${listFavoritesUser.video.id}">Xem</a></div>
	                  </li>
	                </ul>
	              </div>
              
              </c:forEach>

            </div>
            <div class="col-lg-12">
              <div class="main-button">
                <!-- <a href="profile.html">View Your Library</a> -->
              </div>
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>