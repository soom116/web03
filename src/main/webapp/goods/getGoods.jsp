<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 보기</title>
<jsp:include page="../common.jsp"></jsp:include>
<style>

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="content" class="content_wrap">
	<section class="con_wrap">
		<c:if test="${sid=='admin' }">
		<h2 class="page_tit">상품 정보 수정</h2>
		</c:if>
		<c:if test="${sid!='admin' }">
		<h2 class="page_tit">상품 정보 보기</h2>
		</c:if>
		<form action="${path1 }/UpdateGoodsCtrl" method="post" enctype="multipart/form-data">
			<table class="table" id="lst_tb">
				<tbody>
					<tr>
						<th>카테고리</th>
						<td>
							<c:if test="${sid=='admin' }">
							<select name="gtype" class="select is-primary"required>
								<option value="myforest">MY FOREST</option>
								<option value="longsleeve">롱 슬리브</option>
								<option value="shortsleeve">숏 슬리브</option>
								<option value="dress">드레스</option>
								<option value="sleeveless">슬리브리스</option>
								<option value="robe">로브</option>
								<option value="bigsize">90,95 size</option>
							</select>
							<input type="hidden" name="gno" value="${goods.gno }">
							</c:if>
							<span>${goods.gtype }</span>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<c:if test="${sid=='admin' }">
							<input type="text" name="gname" value="${goods.gname }" class="input is-normal" required>
							</c:if>
							<c:if test="${sid!='admin' }">
							<span>${goods.gtype }</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>
							<c:if test="${sid=='admin' }">
							<input type="number" name="gprice" min="1000" max="1000000" step="100" value="${goods.gprice }" required>
							</c:if>
							<c:if test="${sid!='admin' }">
							<span>${goods.gprice }</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td>
							<c:if test="${sid=='admin' }">
							<select name="gsize" class="input is-normal">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
							</c:if>
							<c:if test="${sid!='admin' }">
							<span>${goods.gsize }</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>남은 수량</th>
						<td>
							<c:if test="${sid=='admin' }">
							<input type="number" name="gamount" min="1" max="10000" value="${goods.gamount }">
							</c:if>
							<c:if test="${sid!='admin' }">
							<span>${goods.gamount }</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
							<c:if test="${sid=='admin' }">
							<textarea cols="10" rows="8" name="gcontent">${goods.gcontent }</textarea>
							</c:if>
							<c:if test="${sid!='admin' }">
							<p>${goods.gcontent }</p>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<c:if test="${sid=='admin' }">
							<input type="file" accept="*.jpeg,*.jpg, *.png, *.gif" name="gimg" value="${goods.gimg }">
							</c:if>
							<c:if test="${sid!='admin' }">
							<img src="${path1 }/upload/${goods.gimg }" alt="${goods.gname }" />
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:if test="${sid=='admin' }">
							<input type="submit" value="제품 등록" class="button is-info"/>
							<input type="reset" value="취소" class="button is-info"/>
							</c:if>
							<c:if test="${sid!='admin' }">
							<a href="${path1 }/AddBasketCtrl?gno=${goods.gno }&gsize=${goods.gsize }" class="button is-info">장바구니 담기</a>
							<a href="${path1 }/saleForm.jsp?gno=${goods.gno }&gsize=${goods.gsize }" class="button is-info">바로 구매</a>
							</c:if>
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