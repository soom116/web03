<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<%-- <c:if test="${empty name }"><c:redirect url="../member/login.jsp" /></c:if> --%>
<div id="content" class="content_wrap">
	<section class="con_wrap">
		<h2>제품등록</h2>
		<form action="${path1 }/AddGoodsCtrl"  method="post" enctype="multipart/form-data">
			<table class="table" id="lst_tb">
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="gtype" required>
								<option value="myforest">MY FOREST</option>
								<option value="longsleeve">롱 슬리브</option>
								<option value="shortsleeve">숏 슬리브</option>
								<option value="dress">드레스</option>
								<option value="sleeveless">슬리브리스</option>
								<option value="robe">로브</option>
								<option value="bigsize">90,95 size</option>
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
						<th>상품가격</th>
						<td>
							<input type="number" name="gprice" min="1000" max="1000000" step="100" required>
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
						<th>상품 수량</th>
						<td>
							<input type="number" name="gamount" min="1" max="10000">
						</td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
							<textarea cols="10" rows="8" name="gcontent"></textarea>
						</td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<input type="file" accept="*.jpeg,*.jpg, *.png, *.gif" name="gimg">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="제품 등록" class="button is-info"/>
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