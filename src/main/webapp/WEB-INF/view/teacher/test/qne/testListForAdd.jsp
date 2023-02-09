<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testListForAdd</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>문제등록</h2>
	
	<!-- 시험 검색 폼 -->
	<div>
		<form action="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd" method="get">
			<input type="text" name="searchWord" placeholder="시험명 검색">
			<button type="submit">검색</button>	
		</form>
	</div>
	
	<!-- 본문 -->
	<table>
		<tr>
			<th>시험 날짜</th>
			<th colspan="2">시험 제목</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testDate}</td>
				<td>${t.testTitle}</td>
				<td>
					<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/teacher/test/qne/qneList?testNo=${t.testNo}'">문제등록</button>
				</td>
			</tr>		
		</c:forEach>
	</table>
	
	<!-- paging -->
	<div>
		<!-- 처음, 이전 -->
		<a href="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd?currentPage=1&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<!-- 현재 페이지, 10개 출력 -->
		<c:forEach varStatus="a" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${a.current == currentPage}">
				<span>${a.current}</span>
			</c:if>
			<c:if test="${a.current != currentPage}">
				<a href="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음, 마지막 -->
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
	
</body>
</html>