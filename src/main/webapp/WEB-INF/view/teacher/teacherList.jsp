<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherList</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link href="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/vendor/chartist/css/chartist.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>TEACHER LIST</h1>
	<div>
		<a href="${pageContext.request.contextPath}/employee/teacher/addTeacher">강사등록</a>
	</div>
	<div>
		<form action="${pageContext.request.contextPath}/employee/teacher/teacherList" method="get">
			<input type="text" name="searchWord" placeholder="강사 이름 검색">
			<button type="submit">검색</button>	
		</form>
	</div>
	<table>
		<tr>
			<th>teacherId</th>
			<th>teacherName</th>
			<th>edit</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.teacherId}</td>
				<td>${t.teacherName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/teacher/removeTeacher?teacherNo=${t.teacherNo}">강사삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- paging -->
	<div>
		<!-- 처음, 이전 -->
		<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=1&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<!-- 현재 페이지, 10개 출력 -->
		<c:forEach varStatus="a" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${a.current == currentPage}">
				<span>${a.current}</span>
			</c:if>
			<c:if test="${a.current != currentPage}">
				<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음, 마지막 -->
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
	
<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="${pageContext.request.contextPath}/Resources/vendor/global/global.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/quixnav-init.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/custom.min.js"></script>

<script src="${pageContext.request.contextPath}/Resources/vendor/chartist/js/chartist.min.js"></script>

<script src="${pageContext.request.contextPath}/Resources/vendor/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/js/pignose.calendar.min.js"></script>


<script src="${pageContext.request.contextPath}/Resources/js/dashboard/dashboard-2.js"></script>
<!-- Circle progress -->
</body>
</html>