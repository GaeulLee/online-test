package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.ExampleService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired TestService testService;
	@Autowired QuestionService questionService;
	@Autowired ExampleService exampleService;
	@Autowired IdService idService;
	
	// 로그아웃
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("\u001B[32m"+"로그아웃 성공");
		return "redirect:/Index";
	}
	
	// 비밀번호 수정
	@GetMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw() {
		return "teacher/modifyTeacherPw";
	}
	@PostMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session, Model model, String oldPw, String newPw) {
		
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		String teacherId = loginTeacher.getTeacherId();
		
		int row = teacherService.modifyTeacherPw(oldPw, newPw, teacherId);
		if(row == 0) {
			log.debug("\u001B[32m"+"강사 비밀번호 변경 실패");
			model.addAttribute("errMsg", "비밀번호 변경에 실패하였습니다.");
			return "teacher/modifyTeacherPw";
		} else {
			log.debug("\u001B[32m"+"강사 비밀번호 수정 성공");
		}
		
		return "redirect:/teacher/teacherHome";
	}
	
	// 로그인
	@PostMapping("loginTeacher")
	public String loginTeacher(HttpSession session, Model model, Teacher teacher) {
		
		Teacher resultTeacher = teacherService.login(teacher);
		
		if(resultTeacher == null) {
			log.debug("\u001B[32m"+"강사 로그인 실패");
			model.addAttribute("teacherErrMsg", "로그인에 실패하였습니다.");
			return "index";
		}
		
		log.debug("\u001B[32m"+"강사 로그인 성공, 세션 정보 저장");
		session.setAttribute("loginTeacher", resultTeacher);
		return "redirect:/teacher/teacherHome";
	}

	// ********************************로그인 후	
	
	// teacher home
	@GetMapping("/teacher/teacherHome")
	public String teacherHome(Model model) {
		
		List<Question> qList = questionService.getRecentQuestionList();
		List<Test> tList = testService.getRecentTestList();
		
		model.addAttribute("qList", qList);
		model.addAttribute("tList", tList);
		
		return "teacher/teacherHome";
	}
	
	
	//******************************* 관리자 기능
	// 1) 강사 등록
	@PostMapping("/employee/teacher/addTeacher")
	public String addTeacher(HttpSession session, Model model, Teacher teacher) {

		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck.equals("no")) {
			log.debug("\u001B[32m"+"강사등록 실패 : 중복된 아이디");
			model.addAttribute("errMsg", "아이디가 중복되었습니다.");
			model.addAttribute("userTId", teacher.getTeacherId());
			model.addAttribute("userTPw", teacher.getTeacherPw());
			model.addAttribute("userTName", teacher.getTeacherName());
			return "redirect:/employee/teacher/teacherList";
		}
		log.debug("\u001B[32m"+"중복된 아이디 없음, 강사등록 진행");
		
		// 2) add teacher
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			log.debug("\u001B[32m"+"강사 등록 실패");
		} else {
			log.debug("\u001B[32m"+"강사 등록 성공");
		}
		
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 2) 강사 삭제
	@GetMapping("/employee/teacher/removeTeacher")
	public String removeTeacher(HttpSession session, @RequestParam(value="teacherNo") int teacherNo) {
		
		// 서비스 호출
		int row = teacherService.removeTeacher(teacherNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"강사 삭제 실패");
		} else {
			log.debug("\u001B[32m"+"강사 삭제 성공");
		}
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 3) 강사 목록 출력
	@GetMapping("/employee/teacher/teacherList")
	public String getTeacherList(HttpSession session, Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
									, @RequestParam(value="searchWord", defaultValue = "") String searchWord){

		log.debug("\u001B[35m"+"searchWord------> "+searchWord);
		
		// 서비스 호출
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		int cnt = teacherService.getTeacherCnt(searchWord);
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
		
		// 모델에 정보 저장
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "teacher/teacherList";
	}
	
}
