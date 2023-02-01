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
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// 학생 등록
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		return "student/addStudent";
	}
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session, Student student) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			System.out.println("학생등록 실패 : 중복된 아이디");
			return "redirect:/student/addStudent";
		} else {
			System.out.println("중복된 아이디 없음, 학생가입 진행");
		}
		
		// 2) add student 
		int row = studentService.addStudent(student);
		if(row == 0) {
			System.out.println("학생 등록 실패");
			return "redirect:/student/addStudent";
		} else {
			System.out.println("학생 등록 성공");
		}
		
		return "redirect:/student/studentList";
	}
	
	// 학생 삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam(value="studentNo") int studentNo) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		// 서비스 호출
		int row = studentService.removeStudent(studentNo);
		if(row == 0) {
			System.out.println("학생 삭제 실패");
		} else {
			System.out.println("학생 삭제 성공");
		}
		
		return "redirect:/student/studentList";
	}
	
	// 학생 목록 출력
	@GetMapping("/student/studentList")
	public String studentList(HttpSession session, Model model
							, @RequestParam(value="currentPage", defaultValue="1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
							// currentPage와 rowPerPage를 @RequestParam을 사용하여 받아오고, 로그인 정보 확인을 위한 HttpSession
							// currentPage와 rowPerPage를 넘기기 위해 Model을 받아옴
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			System.out.println("잘못된 접근 : 세션 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		
		// 서비스 호출
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		int cnt = studentService.getStudentCnt();
		int endPage = cnt/rowPerPage;
		if(cnt%rowPerPage != 0) {
			endPage++;
		}
		// System.out.println("endPage: "+endPage);
		
		// model에 담기
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		return "student/studentList";
	}
	

}
