<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<jsp:include page="../common.jsp"></jsp:include>
<style>
.pro_list { width:1280px; margin:20px; auto; }
.pro_list li { float:left; width:300px; height:400px; margin-right:15px; margin-top:15px; 
overflow:hidden; }
.pro_list li img { display:block; width:100%; }
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<%-- <c:if test="${empty name }"><c:redirect url="../member/login.jsp" /></c:if> --%>
<div id="content" class="content_wrap">
	<section class="con_wrap">
		<div>
			
		</div>	
		<h2>상품 목록</h2>
		<form method="post" action="${path1 }/GetGoodsSearchCtrl" class="frm_fr">
			<table class="table" id="search_tb">
				<tr>
					<td>
						<select name="searchCondition" required>
							<option value="gname">상품명</option>
							<option value="gcontent">제품설명</option>
						</select>
						<input type="text" name="searchKeyword" required />
						<input type="submit" value="검색" class="button is-info"/>
					</td>
				</tr>
			</table>
		</form>
		<ul class="lst pro_lst" id="lst_tb2">
			<c:forEach items="${list }" var="vo" varStatus="status">
				<li>
					<div class="img_fr">
						<img src="${path1 }/upload/${vo.gimg }" alt="${vo.gname }">
					</div>
					<div class="hidden item1">${status.count }</div>
					<h3 class="item_tit"><a href="${path1 }/GetGoodsCtrl?gno=${vo.gno }">${vo.gname }</a></h3>
					<p class="item_com">${vo.gprice }</p>
					<p class="item_data">
						<span>사이즈 : ${vo.gsize }</span>
					</p>
					<p><span>남은 수량 : ${vo.gamount }</span>
				</li>
			</c:forEach>
			<c:if test="${vo==null }">
				<li>해당 상품이 존재하지 않습니다.</li>
			</c:if>
		</ul>
		<c:if test="${sid=='admin' }">
		<div>
			<a href="${path1 }/goods/addGoodsForm.jsp" class="button is-info">제품 등록</a>
		</div>
		</c:if>	
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