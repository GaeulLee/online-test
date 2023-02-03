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

	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Model model, Student student) {
		Student resultStudent = studentService.login(student);
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentHome";
	}

	// ************************** 로그인 후	
	
	// student home
	@GetMapping("/student/studentHome")
	public String studentHome() {
		return "student/studentHome";
	}
	
	
	
	// **************************** 관리자 기능
	// 1) 학생 등록
	@GetMapping("/employee/student/addStudent")
	public String addStudent(HttpSession session) {
		return "student/addStudent";
	}
	@PostMapping("/employee/student/addStudent")
	public String addStudent(HttpSession session, Model model, Student student) {

		Employee loginEmp = (Employee)session.getAttribute("loginEmp");

		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			System.out.println("학생등록 실패 : 중복된 아이디");
			model.addAttribute("errMsg", "아이디가 중복되었습니다.");
			model.addAttribute("userSId", student.getStudentId());
			model.addAttribute("userSPw", student.getStudentPw());
			model.addAttribute("userSName", student.getStudentName());
			return "student/addStudent";
		} else {
			System.out.println("중복된 아이디 없음, 학생가입 진행");
		}
		
		// 2) add student 
		int row = studentService.addStudent(student);
		if(row == 0) {
			System.out.println("학생 등록 실패");
			return "redirect:/employee/student/addStudent";
		} else {
			System.out.println("학생 등록 성공");
		}
		
		return "redirect:/employee/student/studentList";
	}
	
	// 2) 학생 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam(value="studentNo") int studentNo) {
		
		// 서비스 호출
		int row = studentService.removeStudent(studentNo);
		if(row == 0) {
			System.out.println("학생 삭제 실패");
		} else {
			System.out.println("학생 삭제 성공");
		}
		
		return "redirect:/employee/student/studentList";
	}
	
	// 3) 학생 목록 출력
	@GetMapping("/employee/student/studentList")
	public String studentList(HttpSession session, Model model
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
