<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addPaper</title>
</head>
<body>
	<!-- studentMenu include -->
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	
	<h2>(${testDate}) ${testTitle}</h2>
	<form action="${pageContext.request.contextPath}/student/addPaper" method="post">
		<table border="1">
			<c:forEach var="q" items="${questionList}">
				<tr>
					<th>Q${q.questionIdx}. ${q.questionTitle}</th>
				</tr>
				<c:forEach var="e" items="${exampleList}">
					<c:if test="${q.questionNo == e.questionNo}">
						<tr>
							<td>
								<label>
									<input type="radio" name="answer" id="${q.questionIdx}" value="${e.exampleIdx}">
									  A${e.exampleIdx}. ${e.exampleTitle}
								</label>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>
		</table>
		<button type="button">다음 문제</button>
	</form>
</body>
</html>