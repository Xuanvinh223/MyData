<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/fpoly/upload" method="post" enctype="multipart/form-data">
		Hình ảnh: <input type="file" name="photo_file" accept=".png,.jpg"><br>
		Tài liệu: <input type="file" name="doc_file" accept=".pdf,.docx"><br>
		<hr>
		<button>Upload</button>
	</form>
</body>
</html>