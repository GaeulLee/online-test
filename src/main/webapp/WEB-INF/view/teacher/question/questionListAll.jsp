<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionListAll</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h2>전체 문제 목록</h2>
	<div>
		<a href="${pageContext.request.contextPath}/teacher/question/addQuestion">문제 추가</a>
	</div>
	
	<!-- 문제 검색 폼 -->
	<div>
		<form action="${pageContext.request.contextPath}/teacher/question/questionListAll" method="get">
			<input type="text" name="searchWord" placeholder="문제 검색">
			<button type="submit">검색</button>	
		</form>
	</div>
	
	<!-- 본문 -->
	<table>
		<tr>
			<th>시험명</th>
			<th>문제</th>
			<th>편집</th>
		</tr>
		<c:forEach var="q" items="${list}">
				<tr>
					<td>${q.testTitle}</td>
					<!-- 시험 문제가 있으면 -->
					<c:if test="${q.questionNo != null}">
						<td>Q${q.questionIdx}. ${q.questionTitle}</td>
						<td>
							<a href="${pageContext.request.contextPath}/teacher/question/modifyQuestion?questionNo=${q.questionNo}&testNo=${q.testNo}">
								수정
							</a>
							<a href="${pageContext.request.contextPath}/teacher/question/removeQuestion?questionNo=${q.questionNo}&testNo=${q.testNo}">
								삭제
							</a>
						</td>
					</c:if>
					<!-- 시험 문제가 없으면 -->
					<c:if test="${q.questionNo == null}">
						<td>등록된 시험 문제가 없습니다.</td>
						<td>
							<a href="${pageContext.request.contextPath}/teacher/question/addQuestion?testNo=${q.testNo}">문제 추가</a>
						</td>
					</c:if>
				</tr>
		</c:forEach>
	</table>
	
	<!-- paging -->
	<div>
		<!-- 처음, 이전 -->
		<a href="${pageContext.request.contextPath}/teacher/question/questionListAll?currentPage=1&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage == 1}">
			<span>이전</span>
		</c:if>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/question/questionListAll?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<!-- 현재 페이지, 10개 출력 -->
		<c:forEach varStatus="a" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${a.current == currentPage}">
				<span>${a.current}</span>
			</c:if>
			<c:if test="${a.current != currentPage}">
				<a href="${pageContext.request.contextPath}/teacher/question/questionListAll?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음, 마지막 -->
		<c:if test="${currentPage == lastPage}">
			<span>다음</span>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/question/questionListAll?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/teacher/question/questionListAll?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
</body>
</html>