<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="col-lg-4 col-sm-6">
<c:url var = "url" value="/index"/>
	<div class="item">
		<div class="card-header">
			<a href="${url}/videoDetail/${param.id}"> 
				<img src="/Assignment_FpolyOE/upload/${param.hinhAnh}" class="card-img-top" alt="Video Thumbnail">
			<div class="card-body">
				<h5 class="card-title py-4 text-white text-break " style="display: -webkit-box; -webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;" >${param.tieuDeVideo}</h5>
			</div>
			</a>
			<div class="card-footer">
				<div class="list-group-item">
					<form action="" method="GET">
						<button formaction="${url}/like/${param.id}" type="submit" class="btn btn-secondary btn-sm">
							<i class="fa fa-thumbs-up"></i> Thích
						</button>
						<button formaction="${url}/share/${param.id}" type="submit" class="btn btn-secondary btn-sm" >
							<i class="fa fa-solid fa-share"></i> Chia sẻ
						</button>
					</form>
					<span class="badge bg-secondary text-bg-dark"> <fmt:formatNumber value = "${param.luotXem}" pattern = "#,###" /> lượt xem</span>
				</div>
			</div>
		</div>
	</div>
</div>

