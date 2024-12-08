<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Modal Thêm video start -->
<c:url var = "url" value="/admin"/>
<div class="modal fade" id="themVideo" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Thêm Video</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="video-id" class="col-form-label"> ID video:</label>
						<input type="text" class="form-control" id="video-id" name = "id">
					</div>
					<div class="form-group">
						<label for="video-name" class="col-form-label">Tên video:</label>
						<input type="text" class="form-control" id="video-name" name = "title">
					</div>
					<div class="form-group">
						<label for="views" class="col-form-label">Lượt xem:</label> <input
							type="number" class="form-control" id="views" name = "views">
					</div>
					<div class="form-group">
						<label for="status" class="col-form-label">Trạng thái:</label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="active"
								id="inlineRadio1" value="true" checked> <label
								class="form-check-label" for="inlineRadio1" >Hoạt động</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="active"
								id="inlineRadio2" value="false"> <label
								class="form-check-label" for="inlineRadio2">Không hoạt
								động</label>
						</div>
					</div>
					<div class="form-group">
						<label for="image" class="col-form-label">Poster:</label> 
						<input type="file" class="form-control-file" id="image" name = "poster">
					</div>
					<div class="form-group">
						<label for="description" class="col-form-label">Mô tả:</label>
						<textarea class="form-control" id="description" name = "description"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary" formaction="${url}/createVideo">Lưu</button>
					</div>
				</form>
			</div>
			
		</div>
	</div>
</div>
<!-- Modal Thêm video end -->

<!-- Modal Edit video start -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa Video</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" enctype="multipart/form-data">
				
					<input type="text" id = "idVideo" name = "id" hidden>
					<div class="form-group">
						<label for="video-name" class="col-form-label">Tên video:</label>
						<input type="text" class="form-control" id="video-name" name = "title">
					</div>
					<div class="form-group">
						<label for="views" class="col-form-label">Lượt xem:</label> <input
							type="number" class="form-control" id="views" name = "views">
					</div>
					<div class="form-group">
						<label for="status" class="col-form-label">Trạng thái:</label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="active"
								id="inlineRadio1" value="true"> <label
								class="form-check-label" for="inlineRadio1">Hoạt động</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="active"
								id="inlineRadio2" value="false"> <label
								class="form-check-label" for="inlineRadio2">Không hoạt
								động</label>
						</div>
					</div>
					<div class="form-group">
						<label for="image" class="col-form-label">Poster:</label> <input
							type="file" class="form-control-file" id="image" name = "poster"> <img
							src="src/images/banner-img.png" alt="">
					</div>
					<div class="form-group">
						<label for="description" class="col-form-label">Mô tả:</label>
						<textarea class="form-control" id="description" name = "description"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary" formaction="${url}/editVideo/">Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Modal Eidt video END -->

<!-- Model edit người dùng  start-->
<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog"
	aria-labelledby="editUserModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="editUserModalLabel">Chỉnh sửa thông
					tin tài khoản người dùng</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST">
					<div class="mb-3">
					
						<label for="edit-username" class="form-label">Tên đăng
							nhập</label> <input type="text" class="form-control" id="edit-username"
							value="user1" name = "id" readonly>
					</div>
					<div class="mb-3">
						<label for="edit-fullname" class="form-label">Họ tên</label> <input
							type="text" class="form-control" id="edit-fullname"
							value="" name = "fullName">
					</div>
					<div class="mb-3">
						<label for="edit-password" class="form-label">Mật khẩu</label> <input
							type="password" class="form-control" id="edit-password" name = "password">
					</div>
					<div class="mb-3">
						<label for="edit-email" class="form-label">Email</label> <input
							type="email" class="form-control" id="edit-email"
							value="" name = "email">
					</div>
					<div class="mb-3">
					  <label class="form-label">Vai trò</label>
					  <div class="row">
					  	<div class="col-sm-4">
					  		<div class="form-check">
							    <input class="form-check-input" type="radio" name="role" id="user" value="false" checked>
							    <label class="form-check-label" for="user">Người dùng</label>
					 		 </div>	
					  	</div>
					  	<div class="col-sm-8">
					  		<div class="form-check">
								    <input class="form-check-input" type="radio" name="role" id="admin" value="true">
								    <label class="form-check-label" for="admin">Quản trị viên</label>
							</div>
					  	</div>
					  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal"
							aria-label="Close">Trở về</button>
						<button type="submit" class="btn btn-primary" formaction="${url}/editUser/" >Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Modal edit người dùng  end-->
<!-- Modal create người dùng start -->
<div class="modal fade" id="createUserModal" tabindex="-1" role="dialog"
	aria-labelledby="createUserModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="editUserModalLabel">Thêm tài khoản người dùng</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST">
					<div class="mb-3">
						<label for="edit-username" class="form-label">Tên đăng
							nhập</label> <input type="text" class="form-control" id="edit-username"
							value="" name = "id">
					</div>
					<div class="mb-3">
						<label for="edit-fullname" class="form-label">Họ tên</label> <input
							type="text" class="form-control" id="edit-fullname"
							value="" name = "fullName">
					</div>
					<div class="mb-3">
						<label for="edit-password" class="form-label">Mật khẩu</label> <input
							type="password" class="form-control" id="edit-password" name = "password">
					</div>
					<div class="mb-3">
						<label for="edit-email" class="form-label">Email</label> <input
							type="email" class="form-control" id="edit-email"
							value="" name = "email" >
					</div>
					<div class="mb-3">
					  <label class="form-label">Vai trò</label>
					  <div class="row">
					  	<div class="col-sm-4">
					  		<div class="form-check">
							    <input class="form-check-input" type="radio" name="role" id="user" value="false" checked>
							    <label class="form-check-label" for="user">Người dùng</label>
					 		 </div>	
					  	</div>
					  	<div class="col-sm-8">
					  		<div class="form-check">
								    <input class="form-check-input" type="radio" name="role" id="admin" value="true">
								    <label class="form-check-label" for="admin">Quản trị viên</label>
							</div>
					  	</div>
					  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal"
							aria-label="Close">Trở về</button>
						<button type="submit" class="btn btn-primary" formaction="${url}/createUser">Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
