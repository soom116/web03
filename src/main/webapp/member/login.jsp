<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" />
<style>
.tb2 { display:table; width:1100px; margin:20px auto; border-collapse: collapse; }
.tb2 tr { display:table-row; }
.tb2 th, .tb2 td { display:table-cell; line-height:36px; border-bottom:1px solid #333; text-align: center; 
font-size:14px; }
.tb2 tr:frist-child th, .tb2 tr:frist-child td { border-top:1px solid #333; } 
.tb2 th { background-color:#ccc; }
.tb2 td.img_data { max-width:170px; }
.tb2 td.img_data img { max-width:170px; height:auto; }
.tb2 td p.coment { max-width:170px; line-height:24px;}
</style>
</head>
<body>
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
<div id="content">
	<h3>로그인</h3>
	<form action="LoginProCtrl" method="post">
		<table class="tb2">
			<tbody>
				<tr><td>아이디 : <input type="text" name="cid" id="cid" class="in_data" required></td></tr> 
				<tr><td>비밀번호 : <input type="password" name="upw" id="upw" class="in_data" required></td></tr>
				<tr><td><input type="submit" class="frm_btn" value="로그인"> &nbsp; &nbsp; &nbsp; &nbsp;
				<input type="reset" class="frm_btn" value="취소"></td></tr>
			</tbody>
		</table>
	</form>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>