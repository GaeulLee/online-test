<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/employee/empHome">홈</a>
	<a href="${pageContext.request.contextPath}/employee/empList">사원관리</a> <!-- 사원 등록 시 ID 체크(사원+강사+학생) -->
	<a href="${pageContext.request.contextPath}/employee/teacher/teacherList">강사관리</a> <!-- 강사 목록, 강사 삭제 (수정불가) -->
	<a href="${pageContext.request.contextPath}/employee/student/studentList">학생관리</a> <!-- 학생 목록, 학생 삭제 (수정불가)-->
	<a href="${pageContext.request.contextPath}/employee/modifyEmpPw">비밀번호 변경</a> <!-- 비빌번호 수정 -->
	<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
</div>
