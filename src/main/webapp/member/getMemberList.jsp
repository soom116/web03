<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="content" class="content_wrap">
	<h2 class="page_tit">회원 목록 보기</h2>
	<section class="con_wrap">
		<table class="table" id="lst_tb">
			<thead>
				<tr>
					<th class="item1">번호</th>
					<th class="item2">아이디</th>
					<th class="item2">이름</th>
					<th class="item3">전화번호</th>
					<th class="item4">이메일</th>
					<th class="item5">가입일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="vo" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td><a href="${path1 }/GetMemberCtrl?cid=${vo.cid }">${vo.cid }</a></td>
					<td>${vo.uname }</td>
					<td>${vo.tel }</td>
					<td>${vo.email }</td>
					<td>${vo.regdate }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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