<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
<c:url var = "url" value="/index"/>
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
          <div class="main-banner bg-gradient">
            <div class="row ">
              <div class="col-lg-12">
                <div class="header-text">
                  <div class="row">
                    <div class="col-lg-12">
                      <h1>${video.title}</h1>
               		   <img src="<c:url value = '/user/image/${video.poster}'></c:url>" alt="Hình ảnh video" class="img-fluid"> 
                      <p class="text-white">Lượt xem: <fmt:formatNumber value = "${video.views}" pattern = "#,###" /></p>
                      <p class="text-white">${video.description}</p>
                    </div>
                    <!-- Tạo phần nhập email và nút chia sẻ -->
                    <div class="col-lg-12">
                      <form method="POST">
                        <div class="mb-3">
                          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                            placeholder="Nhập email bạn muốn chia sẽ" name = "to">
                          <div id="emailHelp" class="form-text">Chúng tôi sẽ không bao giờ chia sẻ email của bạn với bất
                            kỳ ai khác.
                          </div>
                        </div>
                        <button type="submit" class="btn btn-primary" formaction="${url}/share/${video.id}" >Chia sẻ</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>