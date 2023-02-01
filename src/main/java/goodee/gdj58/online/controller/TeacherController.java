package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	/*
	 *************** 관리자(사원)기능 
	 */
	
	// 강사 등록
	@GetMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		return "teacher/addTeacher";
	}
	@PostMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session, Teacher teacher) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			System.out.println("강사등록 실패 : 중복된 아이디");
			return "redirect:/teacher/addTeacher";
		}
		System.out.println("중복된 아이디 없음, 강사등록 진행");
		
		// 2) add teacher
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			System.out.println("강사 등록 실패");
			return "redirect:/teacher/addTeacher";
		} else {
			System.out.println("강사 등록 성공");
		}
		
		return "redirect:/teacher/teacherList";
	}
	
	// 강사 삭제
	@GetMapping("/teacher/removeTeacher")
	public String removeTeacher(HttpSession session, @RequestParam(value="teacherNo") int teacherNo) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		// 서비스 호출
		int row = teacherService.removeTeacher(teacherNo);
		if(row == 0) {
			System.out.println("강사 삭제 실패");
		} else {
			System.out.println("강사 삭제 성공");
		}
		return "teacher/teacherList";
	}
	
	// 강사 목록 출력
	@GetMapping("/teacher/teacherList")
	public String getTeacherList(HttpSession session, Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage){
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		// 서비스 호출
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage);
		int cnt = teacherService.getTeacherCnt();
		int endPage = cnt/rowPerPage;
		if(cnt%rowPerPage != 0) {
			endPage++;
		}
		
		// 모델에 정보 저장
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		return "teacher/teacherList";
	}
}
