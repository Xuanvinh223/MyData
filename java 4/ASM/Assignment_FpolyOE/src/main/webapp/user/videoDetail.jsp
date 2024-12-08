<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
<c:url var = "url" value="/index"/>
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
          <!-- ***** Featured Games Start ***** -->
          <div class="row">
            <div class="col-lg-8">
                <iframe width="100%" height="85%" src="https://www.youtube.com/embed/${video.id}?list=RDritnXLZHgmc" 
                title="${video.title}" 
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen></iframe>
              <h3>${video.title}</h3>
            </div>
            <div class="col-lg-4">
              <div class="top-streamers" style="background-color: #27292a;">
                <div class="heading-section">
                  <h4>Video liên quan</h4>
                </div>
                <ul>
                <c:forEach var="listVideo" items="${videoList}">
	                 <li>
	                   <a href="${url}/videoDetail/${listVideo.id}">
		                    <div class="row">
		                      <div class="col-lg-6"> <img class="img-fluid" src="/Assignment_FpolyOE/upload/${listVideo.poster}" alt=""
		                          style="max-width: 100%; ">
		                      </div>
		                      <div class="col-lg-6" >
		                        <em class="text-break text-white" style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 4; overflow: hidden;">
		                        ${listVideo.title}
		                        </em>
		                      </div>
		                    </div>
	                   </a>
	                  </li>
                </c:forEach>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** Featured Games End ***** -->
          <!-- Mô tả start-->
          <div class="main-banner" style="background-image: url(); padding: 0px;">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <div class="row">
                    <div class="col-lg-8">
                      <h6>Mô tả video </h6>
                    </div>
                    <div class="col-lg-4">
                      <div class="list-group-item ">
							<form action="" method="get">
								<button type="submit" formaction="${url}/like/${video.id}" class="btn btn-secondary btn-sm"><i class="fa fa-thumbs-up"></i>Thích</button>
		                        <button type="submit" formaction="${url}/share/${video.id}" class="btn btn-secondary btn-sm"><i class="fa fa-solid fa-share"></i> Chia sẻ</button>
		                        <span class="badge bg-secondary text-bg-dark"> <fmt:formatNumber value = "${video.views}" pattern = "#,###" />   Lượt xem</span>        
							</form>              
                      </div>
                    </div>
                  </div>
                  <h6 class="text-break">
                    ${video.description}
                  </h6>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- mô tả end -->
      </div>
    </div>
  </div>
