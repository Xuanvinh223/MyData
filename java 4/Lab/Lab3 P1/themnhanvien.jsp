<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/fpoly/staff" method="post">
		<table>
			<tr>
				<td colspan="2" style="text-align: center;">FORM THÊM NHÂN VIÊN
					<hr>
				</td>
			</tr>
			<tr>
				<td>Họ tên:</td>
				<td><input name="fullname"></td>
			</tr>
			<tr>
				<td>Ngày sinh:</td>
				<td><input name="birthday"></td>
			</tr>
			<tr>
				<td>Giới tính:</td>
				<td>
					<input name="gender" type="radio" value="Nam">Nam 
					<input name="gender" type="radio" value="Nữ">Nữ
				</td>
			</tr>
			<tr>
				<td>Đã có gia đình?</td>
				<td><input name="married" type="checkbox"></td>
			</tr>
			<tr>
				<td>Quốc tịch:</td>
				<td><select name="country">
						<option value="VN">Việt Nam</option>
						<option value="US">United States</option>
				</select></td>
			</tr>
			<tr>
				<td>Sở thích</td>
				<td><input name="hobbies" type="checkbox" value="R">Đọc
					sách <input name="hobbies" type="checkbox" value="T">Du
					lịch <input name="hobbies" type="checkbox" value="M">Âm
					nhạc <input name="hobbies" type="checkbox" value="O">Khác</td>
			</tr>
			<tr>
				<td>Ghi chú:</td>
				<td><textarea name="notes" rows="3" cols="30"></textarea></td>
			</tr>
			<td colspan="2"><hr></td>
		</table>
		<button>Thêm mới</button>
	</form>
</body>
</html>