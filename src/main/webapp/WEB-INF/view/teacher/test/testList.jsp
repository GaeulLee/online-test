<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testList</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>전체 시험 목록</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/test/addTest">시험 추가</a>
	</div>
	
	<!-- 시험 검색 폼 -->
	<div>
		<form action="${pageContext.request.contextPath}/teacher/test/testList" method="get">
			<input type="text" name="searchWord" placeholder="시험명 검색">
			<button type="submit">검색</button>	
		</form>
	</div>
	
	<!-- 본문 -->
	<table>
		<tr>
			<th>시험 날짜</th>
			<th>시험 제목</th>
			<th>편집</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testDate}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/question/questionList?testNo=${t.testNo}">${t.testTitle}</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/test/modifyTest?testNo=${t.testNo}">수정</a>
					<a href="${pageContext.request.contextPath}/teacher/test/removeTest?testNo=${t.testNo}">삭제</a>
				</td>
			</tr>		
		</c:forEach>
	</table>
	
	<!-- paging -->
	<div>
		<!-- 처음, 이전 -->
		<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=1&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<!-- 현재 페이지, 10개 출력 -->
		<c:forEach varStatus="a" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${a.current == currentPage}">
				<span>${a.current}</span>
			</c:if>
			<c:if test="${a.current != currentPage}">
				<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음, 마지막 -->
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
	
</body>
</html>