<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="content" class="content_wrap">
	<section class="con_wrap">
		<h2>제품 등록</h2>
		<form name="frmName" enctype="multipart/form-data" action="${path1 }/AddGoodsCtrl" method="post">
			<input type="text" name="user"><br /> title<br /> <input
			type="text" name="title"><br /> file<br /> <input type="file"
			name="uploadFile"><br /> <input type="submit" value="UPLOAD">
			<table class="table" id="lst_tb">
				<tbody>
					<tr>
						<th>상품 번호</th>
						<td>
							<input type="number" name="gno" required>
						</td>
					</tr>
					<tr>
						<th>상품 유형</th>
						<td>
							<select name="gtype">
								<option value="sidedish">MY FOREST</option>
								<option value="soup">롱 슬리브</option>
								<option value="noodle">숏 슬리브</option>
								<option value="noodle">드레스</option>
								<option value="noodle">슬리브리스</option>
								<option value="noodle">로브</option>
								<option value="noodle">90,95 size</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="gname" required>
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>
							<input type="text" name="gprice" required>
						</td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td>
							<select name="gsize">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td>
							<input type="number" name="gamount" min="1" max="10" step="1" required>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea cols="100" rows ="7" name="content" required></textarea>
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="img" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="상품 등록" class="button is-info"/>
							<input type="reset" value="취소" class="button is-info"/>
							<a href="${path1 }/GetGoodsListCtrl" class="button is-info">목록</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>
	<script>
	$(document).ready(function(){
		$("#lst_tb_filter").css("display","none");
	});
	</script>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>