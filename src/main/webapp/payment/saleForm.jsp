<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<%
	String uid = "";
	if(uid != null) uid = (String) application.getAttribute("uid");
	if(request.getParameter("bno")!=null) { int bno = Integer.parseInt(request.getParameter("bno")); } 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" />
<title>상품 구매 하기</title>
<jsp:include page="../common.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="content">
	<section class="con_wrap">
		<h2 class="page_tit">상품 구매</h2>
		<form action="${path1 }/AddPaymentCtrl" method="post" name="payment_form">
			<table class="table" id="lst_tb">
				<tbody>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="gname" value="${goods.gname }" readonly required>
							<input type="hidden" name="gno" value="${goods.gno }">
							<c:if test="${!empty bno}">
							<input type="hidden" name="bno" value="${bno }">
							</c:if>
						</td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td>
							<img src="${path1 }/upload/${goods.gimg }" alt="${goods.gname }" />
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td>
							<input type="number" name="gamount" min="1" max="${goods.gamount }" value="1" required>
						</td>
					</tr>
					<tr>
						<th>단가</th>
						<td>
							<input type="text" name="gprice" value="${goods.gprice }" readonly required>
						</td>
					</tr>
					<tr>
						<th>수신자명</th>
						<td>
							<input type="text" name="rname" required>
						</td>
					</tr>
					<tr>
						<th>수신자 연락처</th>
						<td>
							<input type="tel" name="tel" required>
						</td>
					</tr>
					<tr>
						<th>수신자 주소</th>
						<td>
							<input type="text" name="addr1" id="addr1" required><br>
							<input type="text" name="addr2" id="addr2" placeholder="상세주소 입력" required><br>
							<input type="text" name="postcode" id="postcode" required>
							<input type="button" value="주소찾기" onclick="findAddr()" class="button is-info">
						</td>
					</tr>
					<tr>
						<th>배송장에 남길 말씀</th>
						<td>
							<input type="text" name="memo" id="memo">
						</td>
					</tr>
					<tr>
						<th>결제 방식</th>
						<td>
							<select name="paytype" required>
								<option value="credit">신용카드 결제</option>
								<option value="check">체크카드 결제</option>
								<option value="account">계좌이체</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>결제 카드 번호</th>
						<td>
							카드사/은행명 : <input type="text" name="payplace" required><br>
							카드번호/계좌번호 : <input type="text" name="payno" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="구매" class="button is-info"/>
							<input type="reset" value="취소" class="button is-info"/>
							<p>모든 항목은 필수항목으로 꼭 입력하셔야 합니다.</p>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<script>
		function findAddr() {
			new daum.Postcode({
				oncomplete: function(data) {
					console.log(data);
					var roadAddr = data.roadAddress;
					var jibunAddr = data.jibunAddress;
					document.getElementById("postcode").value = data.zonecode;
					if(roadAddr !== '') {
						document.getElementById("addr1").value = roadAddr;				
					} else if(jibunAddr !== ''){
						document.getElementById("addr1").value = jibunAddr;
					}
				}
			}).open();
		}
		</script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
	</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>