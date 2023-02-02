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
	
	
	//******************************* 관리자 기능
	// 1) 강사 등록
	@GetMapping("/employee/teacher/addTeacher")
	public String addTeacher(HttpSession session) {
		return "teacher/addTeacher";
	}
	@PostMapping("/employee/teacher/addTeacher")
	public String addTeacher(HttpSession session, Model model, Teacher teacher) {

		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			System.out.println("강사등록 실패 : 중복된 아이디");
			model.addAttribute("errMsg", "아이디가 중복되었습니다.");
			model.addAttribute("userTId", teacher.getTeacherId());
			model.addAttribute("userTPw", teacher.getTeacherPw());
			model.addAttribute("userTName", teacher.getTeacherName());
			return "teacher/addTeacher";
		}
		System.out.println("중복된 아이디 없음, 강사등록 진행");
		
		// 2) add teacher
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			System.out.println("강사 등록 실패");
			return "redirect:/employee/teacher/addTeacher";
		} else {
			System.out.println("강사 등록 성공");
		}
		
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 2) 강사 삭제
	@GetMapping("/employee/teacher/removeTeacher")
	public String removeTeacher(HttpSession session, @RequestParam(value="teacherNo") int teacherNo) {
		
		// 서비스 호출
		int row = teacherService.removeTeacher(teacherNo);
		if(row == 0) {
			System.out.println("강사 삭제 실패");
		} else {
			System.out.println("강사 삭제 성공");
		}
		return "teacher/teacherList";
	}
	
	// 3) 강사 목록 출력
	@GetMapping("/employee/teacher/teacherList")
	public String getTeacherList(HttpSession session, Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage){

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
