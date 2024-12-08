<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

  <header class="header-area header-sticky">
    <div class="container">
   
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="${url}" class="logo">
              <img src=" <c:url value = '/user/assets/images/logo.png'/>  " alt="">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Search End ***** -->
            <div class="search-input">
              <form id="search" action="#">
                <input type="text" placeholder="Tìm kiếm video..." id='searchText' name="searchKeyword"
                  onkeypress="handle" />
                <i class="fa fa-search"></i>
              </form>
            </div>
            <!-- ***** Search End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li><a href="${url}" class="text-white" >Trang chủ</a></li>
             <!--  <li><a href="" class="text-white" >Thịnh hành</a></li> -->
              
              <c:choose>
	              <c:when test = "${not empty sessionScope.sessionUser}">
	            	 <li>
	           		   <a href="${url}/favorite" class="text-white" >Yêu thích</a>
	           		 </li>
	              </c:when>
	          </c:choose>
              
              <li>
                <div class="dropdown">
                  <a style="cursor: pointer;" class="text-white" >Tài khoản</a>
                  <div class="dropdown-menu">
                  <c:choose>
                  	<c:when test = "${not empty sessionScope.sessionUser}">
	                  	<!--  <a href="#" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Quên mật khẩu</a> -->
	
	                    <a href="#" data-bs-toggle="modal" data-bs-target="#changePasswordModal">Đổi mật khẩu</a>
	                    <a href="${url}/logout">Đăng xuất</a>
                  	</c:when>
                  	<c:otherwise>
                  	 <a href="#" class="sign-in-up" data-bs-toggle="modal" data-bs-target="#loginModal">Đăng
                      nhập</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Đăng ký</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Quên mật khẩu</a>
                  	</c:otherwise>
                  </c:choose>
                    <c:choose>
                  	<c:when test = "${sessionScope.sessionUser.role == true}">
	                  	<a href="/Assignment_FpolyOE/admin" class="sign-in-up"">Admin</a>
                  	</c:when>
                  	<c:otherwise>
                  	
                  	</c:otherwise>
                  </c:choose>
                  </div>
                </div>
              </li>
              <li>
              	<c:choose>
              		<c:when test = "${not empty sessionScope.sessionUser}">
              			<a href="${url}/editProfile" class="text-white" >${sessionScope.sessionUser.fullName}
             			 <img src=" <c:url value = '/user/assets/images/profile-header.jpg'/> " alt="">
            			</a>
              		</c:when>
              	</c:choose>
              </li>
            </ul>
            <a class='menu-trigger'>
              <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>