<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal login Start -->
<div class="modal fade" id="loginModal" tabindex="-1"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-black" id="loginModalLabel">Đăng
					nhập</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
											
				<form method="POST">
					<div class="mb-3">
						<label for="username" class="form-label">Tên đăng nhập</label> <input
							type="text" class="form-control" id="username" name = "id"
							placeholder="Nhập tên đăng nhập">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Mật khẩu</label> <input
							type="password" class="form-control" id="password" name = "password"
							placeholder="Nhập mật khẩu">
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="remember">
						<label class="form-check-label" for="remember">Ghi nhớ mật
							khẩu</label>
					</div>
					<div class="mb-3">
						<a href="#" data-bs-toggle="modal"
							data-bs-target="#forgotPasswordModal">Quên mật khẩu?</a>
					</div>
					<div class="mb-3">
						<p>
							Bạn chưa có tài khoản? <a href="#" data-bs-toggle="modal"
								data-bs-target="#registerModal">Đăng ký</a>
						</p>
					</div>
					<button type="submit" class="btn btn-primary" formaction="${url}/login">Đăng nhập</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Modal register -->
<div class="modal fade" id="registerModal" tabindex="-1"
	aria-labelledby="registerModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-black" id="registerModalLabel">Đăng
					ký</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="POST">
					<div class="mb-3">
						<label for="username" class="form-label">Tên đăng nhập</label> <input
							type="text" class="form-control" id="username" name="id" placeholder="Nhập tên đăng nhập">
					</div>
					<div class="mb-3">
						<label for="fullname" class="form-label">Họ và tên</label> <input
							type="text" class="form-control" id="fullname" name = "fullName" placeholder="Nhập họ và tên">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email" name = "email" placeholder="Nhập email">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Mật khẩu</label> <input
							type="password" class="form-control" id="password" name = "password" placeholder="Nhập mật khẩu">
					</div>
				<!-- 	<div class="mb-3">
						<label for="password-confirm" class="form-label">Nhập lại
							mật khẩu</label> <input type="password" class="form-control" id="password-confirm" placeholder="Nhập lại mật khẩu">
					</div> -->
					<div class="mb-3">
						<p>
							Bạn đã có tài khoản? <a href="#" data-bs-toggle="modal"
								data-bs-target="#loginModal" data-bs-dismiss="modal">Trở về
								đăng nhập</a>
						</p>
					</div>
					<button type="submit" class="btn btn-primary" formaction="${url}/register">Đăng ký</button>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- Modal Edit Profile -->
<div class="modal fade" id="editAccountModal" tabindex="-1"
	aria-labelledby="editAccountModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-black" id="editAccountModalLabel">Chỉnh
					sửa tài khoản</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="POST">
					<div class="mb-3">
						<label for="username" class="form-label">Tên đăng nhập</label> <input
							type="text" class="form-control" id="username"
							placeholder="Nhập tên đăng nhập"
							value="${sessionScope.sessionUser.id}" name = "id" readonly>
					</div>
					<div class="mb-3">
						<label for="fullname" class="form-label">Họ tên</label> <input
							type="text" class="form-control" id="fullname"
							value="${sessionScope.sessionUser.fullName}" placeholder="Họ và tên" name = "fullName">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Mật khẩu</label> <input
							type="password" class="form-control" id="password"
							value="${sessionScope.sessionUser.password}" placeholder="Nhập mật khẩu" name = "password">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email"
							value="${sessionScope.sessionUser.email}"  placeholder="Nhập địa chỉ email" name = "email">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary"
							formaction="${url}/editProfile">Lưu thay đổi</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>

<!-- Modal change password -->
 <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-black" id="changePasswordModalLabel">Đổi mật khẩu</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form method="POST">
            <div class="mb-3">
              <label for="username" class="form-label">Tên đăng nhập</label>
              <input type="text" class="form-control" id="username" placeholder="Tên đăng nhập" name = "id" value = "${sessionScope.sessionUser.id}" readonly>
            </div>
            <div class="mb-3">
              <label for="oldPassword" class="form-label">Mật khẩu cũ</label>
              <input type="password" class="form-control" id="oldPassword" placeholder="Nhập mật khẩu cũ" name = "oldPassword">
            </div>
            <div class="mb-3">
              <label for="Password" class="form-label">Mật khẩu mới</label>
              <input type="password" class="form-control" id="Password" placeholder="Nhập mật khẩu mới" name = "password">
            </div>
            <button type="submit" class="btn btn-primary" formaction="${url}/changePassword">Xác nhận</button>
          </form>
        </div>
      </div>
    </div>
</div>

<!-- Modal Forgot password -->
<div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-black" id="forgotPasswordModalLabel">Quên mật khẩu</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form method="POST">
            <div class="mb-3">
              <label for="username" class="form-label">Tên đăng nhập</label>
              <input type="text" class="form-control" id="username" placeholder="Nhập tên đăng nhập" name = "id">
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" placeholder="Nhập email" name = "to">
            </div>
            <button type="submit" class="btn btn-primary" formaction="${url}/forgotPassword" >Xác nhận</button>
          </form>
        </div>
      </div>
    </div>
</div>

