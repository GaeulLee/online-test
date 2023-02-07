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
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	@Autowired TestService testService;

	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Model model, Student student) {
		
		Student resultStudent = studentService.login(student);
		
		if(resultStudent == null) {
			log.debug("\u001B[32m"+"학생 로그인 실패");
			model.addAttribute("studentErrMsg", "로그인에 실패하였습니다.");
			return "index";
		}
		
		log.debug("\u001B[32m"+"학생 로그인 성공, 세션 정보 저장");
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentHome";
	}

	// ************************** 로그인 후	
	
	// 로그아웃
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("\u001B[32m"+"로그아웃 성공");
		return "redirect:/Index";
	}
	
	// 비밀번호 수정
	@GetMapping("/student/modifyStudentPw")
	public String modifyStudentPw() {
		return "student/modifyStudentPw";
	}
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudentPw(HttpSession session, Model model, String oldPw, String newPw) {
		
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		String studentId = loginStudent.getStudentId();
		
		int row = studentService.modufyStudentPw(oldPw, newPw, studentId);
		if(row == 0) {
			log.debug("\u001B[32m"+"학생 비밀번호 변경 실패");
			model.addAttribute("errMsg", "비밀번호 변경에 실패하였습니다.");
			return "student/modifyStudentPw";
		} else {
			log.debug("\u001B[32m"+"학생 비밀번호 수정 성공");
		}
		
		return "redirect:/student/studentHome";
	}
	
	
	// ****************************** 학생 기능

	// student home
	@GetMapping("/student/studentHome")
	public String studentHome(Model model) {
		
		List<Test> pastTList = testService.getPastTestList();
		List<Test> currentTList = testService.getCurrnetTestList();
		List<Test> futureTList = testService.getFutureTestList();
		
		model.addAttribute("pastTList", pastTList);
		model.addAttribute("currentTList", currentTList);
		model.addAttribute("futureTList", futureTList);
		
		return "student/studentHome";
	}
	
	// **************************** 관리자 기능
	
	// 1) 학생 등록
	@GetMapping("/employee/student/addStudent")
	public String addStudent() {
		return "student/addStudent";
	}
	@PostMapping("/employee/student/addStudent")
	public String addStudent(HttpSession session, Model model, Student student) {

		Employee loginEmp = (Employee)session.getAttribute("loginEmp");

		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			log.debug("\u001B[32m"+"학생등록 실패 : 중복된 아이디");
			model.addAttribute("errMsg", "아이디가 중복되었습니다.");
			model.addAttribute("userSId", student.getStudentId());
			model.addAttribute("userSPw", student.getStudentPw());
			model.addAttribute("userSName", student.getStudentName());
			return "student/addStudent";
		} else {
			log.debug("\u001B[32m"+"중복된 아이디 없음, 학생가입 진행");
		}
		
		// 2) add student 
		int row = studentService.addStudent(student);
		if(row == 0) {
			log.debug("\u001B[32m"+"학생 등록 실패");
			return "redirect:/employee/student/addStudent";
		} else {
			log.debug("\u001B[32m"+"학생 등록 성공");
		}
		
		return "redirect:/employee/student/studentList";
	}
	
	// 2) 학생 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeStudent(@RequestParam(value="studentNo") int studentNo) {
		
		// 서비스 호출
		int row = studentService.removeStudent(studentNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"학생 삭제 실패");
		} else {
			log.debug("\u001B[32m"+"학생 삭제 성공");
		}
		
		return "redirect:/employee/student/studentList";
	}
	
	// 3) 학생 목록 출력
	@GetMapping("/employee/student/studentList")
	public String studentList(Model model
							, @RequestParam(value="currentPage", defaultValue="1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
							, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
							// currentPage와 rowPerPage를 @RequestParam을 사용하여 받아오고, 로그인 정보 확인을 위한 HttpSession
							// currentPage와 rowPerPage를 넘기기 위해 Model을 받아옴
		
		// 서비스 호출
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage, searchWord);
		int cnt = studentService.getStudentCnt(searchWord);
		int lastPage = cnt/rowPerPage;
		
		int listPerPage = 10;
		int startPage = (currentPage-1)/listPerPage*listPerPage+1;
		int endPage = startPage+listPerPage-1;
		
		if(lastPage%rowPerPage != 0) {
			lastPage++;
		}
		if(lastPage == 0) {
			lastPage = 1;
		}
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		// System.out.println("endPage: "+endPage);
		
		// model에 담기
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "student/studentList";
	}

}
