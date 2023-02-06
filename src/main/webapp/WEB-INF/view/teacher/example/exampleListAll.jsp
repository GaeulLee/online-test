<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exampleList</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>전체 보기 목록</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/example/addExample?questionNo=${questionNo}">보기 추가</a>
	</div>
	
	<!-- 보기 검색 폼 -->
	<div>
		<form action="${pageContext.request.contextPath}/teacher/example/exampleListAll" method="get">
			<input type="text" name="searchWord" placeholder="보기 검색">
			<button type="submit">검색</button>	
		</form>
	</div>
	
	<!-- 본문 -->
	<table>
		<tr>
			<th>문제</th>
			<th>보기</th>
			<th>정답여부</th>
			<th>편집</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>Q${e.questionIdx}. ${e.questionTitle}</td>
				<c:if test="${e.exampleNo != null}">
					<td>A${e.exampleIdx}. ${e.exampleTitle}</td>
					<td>${e.exampleOx}</td>
					<td>
						<a href="${pageContext.request.contextPath}/teacher/example/modifyExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}">수정</a>
						<a href="${pageContext.request.contextPath}/teacher/example/removeExample?exampleNo=${e.exampleNo}&questionNo=${e.questionNo}">삭제</a>
					</td>
				</c:if>
				<c:if test="${e.exampleNo == null}">
					<td colspan="2">등록된 보기가 없습니다.</td>
					<td>
						<a href="${pageContext.request.contextPath}/teacher/example/addExample?questionNo=${e.questionNo}">보기 추가</a>
					</td>
				</c:if>
			</tr>		
		</c:forEach>
	</table>
	
	<!-- paging -->
	<div>
		<!-- 처음, 이전 -->
		<a href="${pageContext.request.contextPath}/teacher/example/exampleListAll?currentPage=1&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/example/exampleListAll?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<!-- 현재 페이지, 10개 출력 -->
		<c:forEach varStatus="a" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${a.current == currentPage}">
				<span>${a.current}</span>
			</c:if>
			<c:if test="${a.current != currentPage}">
				<a href="${pageContext.request.contextPath}/teacher/example/exampleListAll?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음, 마지막 -->
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/example/exampleListAll?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/teacher/example/exampleListAll?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
</body>
</html>