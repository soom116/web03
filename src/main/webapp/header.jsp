<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />  
<%
	String sid = "";
	if(session !=null) sid = (String) session.getAttribute("sid");  
%>
<header id="header" class="panel-heading">
	<div class="hd_wrap">
		<nav class="navbar" role="navigation" aria-label="main navigation">
		  <div class="navbar-brand">
		    <a class="navbar-item" href="${path }/index.jsp" id="logo">
		      <img src="${path }/img/logo.png" width="220" height="39">
		    </a>
		
		    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
		      <span aria-hidden="true"></span>
		    </a>
		  </div>

		  <div id="gnb" class="navbar-menu">
		    <div class="navbar-start">
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          ALL
		        </a>
		
		        <div class="navbar-dropdown">
		          <a class="navbar-item">
		            ALL
		          </a>
		        </div>
		      </div>
		      
		       <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          COUPLE
		        </a>
		
		        <div class="navbar-dropdown">
		          <a class="navbar-item" href="">
		            COUPLE
		          </a>
		        </div>
		      </div>
		      
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          WOMEN / MEN
		        </a>
		        <div class="navbar-dropdown">
		          <a href="GetGoodsListCtrl?gtype=myforest" class="navbar-item">
		            MY FOREST
		          </a>
		          <a href="GetGoodsListCtrl?gtype=longsleeve" class="navbar-item">
		            롱 슬리브
		          </a>
		          <a href="GetGoodsListCtrl?gtype=shortsleeve" class="navbar-item">
		            숏 슬리브
		          </a>
		          <hr class="navbar-divider">
		          <a href="GetGoodsListCtrl?gtype=dress" class="navbar-item">
		            드레스
		          </a>
		          <a href="GetGoodsListCtrl?gtype=sleeveless" class="navbar-item">
		            슬리브리스
		          </a>
		          <a href="GetGoodsListCtrl?gtype=robe" class="navbar-item">
		            로브
		          </a>
		          <a href="GetGoodsListCtrl?gtype=bigsize" class="navbar-item">
		            90,95 size
		          </a>
		        </div>
		      </div>
		      
		     
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          ACC
		        </a>
		
		        <div class="navbar-dropdown">
		          <a class="navbar-item" href="GetEventListCtrl">
		            퍼피
		          </a>
		          <a class="navbar-item">
		            선물포장
		          </a>
		        </div>
		      </div>
		      <div class="navbar-item has-dropdown is-hoverable">
		        <a class="navbar-link">
		          고객센터
		        </a>		
		        <div class="navbar-dropdown">
		          <a class="navbar-item" href="${path }/GetBoardListCtrl">
		            공지사항
		          </a>
			      <c:if test="${!empty sid }">
			          <a href="${path }/mailForm.jsp" class="navbar-item">
			            1:1 문의
			          </a>
			      </c:if>    
		          <a class="navbar-item">
		            자주하는 질문 및 답변
		          </a>
		          <hr class="navbar-divider">
		          <a class="navbar-item">
		            반품안내
		          </a>
		        </div>
		      </div>
		     </div>
			 <c:if test="${empty sid }">		
		     <div class="navbar-end">
		      <div class="navbar-item">
		        <div class="buttons">
		          <a href="${path }/member/agree.jsp" class="button is-primary">
		            <strong>회원가입</strong>
		          </a>
		          <a href="${path }/member/login.jsp" class="button is-light">
		            로그인
		          </a>
		        </div>
		      </div>
		     </div>
		     </c:if>
		     <c:if test="${!empty sid }">
		     <!-- 로그인 사용자 -->
		      <div class="navbar-item">
		        <div class="buttons">
		          <a href="${path }/myPageCtrl?cid=${sid }" class="button is-primary">
		            <strong>회원정보수정</strong>
		          </a>
		          <a href="${path }/GetBasketListCtrl" class="button is-light">
		            장바구니
		          </a>
		          <a href="${path }/myPageCtrl" class="button is-light">
		            마이페이지
		          </a>
		          <a href="${path }/logOutCtrl" class="button is-light">
		            로그아웃
		          </a>
		        </div>
		      </div>
		      </c:if>
		      <!-- 관리자 -->
		      <c:if test="${sid=='admin' }">
		      <div class="navbar-item">
		        <div class="buttons">
		          <a href="${path }/GetBoardListCtrl" class="button is-primary">
		            <strong>글 관리</strong>
		          </a>
		          <a href="${path }/GetMemberListCtrl" class="button is-light">
		            회원관리
		          </a>
<!-- 		          <a href="${path }/adminMemberList.jsp" class="button is-light">
		            회원관리2
		          </a>-->
		          <a href="${path }/GetGoodsListCtrl" class="button is-light">
		            제품관리
		          </a>
		          <a href="${path }/AccessListCtrl" class="button is-light">
		            접속자관리
		          </a>
		          <a class="button is-light">
		            판매관리
		          </a>
		        </div>
		      </div>
		      </c:if>
		    </nav>
		</div>
</header>