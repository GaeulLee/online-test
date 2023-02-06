<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/teacher/teacherHome">홈</a>
	
	<!-- 
		시험회차(table : test) 관리(CRUD) 
		개별 시험 회차 클릭하면 그 회차의 문제 리스트 출력(문제CRUD)
		개별 문제를 클릭하면 문제에 해당하는 보기 리스트 출력(보기 CRUD)
			-> 하나 하나 들어가게 하는 것과 밖에 시험문제 관리, 보기관리 도 구현  
	-->
	<a href="${pageContext.request.contextPath}/teacher/test/testList">시험회차관리</a> <!-- 강사만 관리 권한 -->
	<a href="${pageContext.request.contextPath}/teacher/question/questionListAll">시험문제관리</a> <!-- 강사만 관리 권한 -->
	<a href="${pageContext.request.contextPath}/teacher/example/exampleListAll">문제보기관리</a> <!-- 강사만 관리 권한 -->
	
	<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호 변경</a> <!-- 비빌번호 수정 -->
	<a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a>
</div>