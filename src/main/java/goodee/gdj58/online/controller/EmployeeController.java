package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Model model, Employee employee) {
		
		Employee resultEmp = employeeService.login(employee);
		
		if(resultEmp == null) {
			log.debug("\u001B[32m"+"사원 로그인 실패");
			model.addAttribute("empErrMsg", "로그인에 실패하였습니다.");
			return "index";
		}
		
		log.debug("\u001B[32m"+"사원 로그인 성공, 세션 정보 저장");
		
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	/*
	 ***************************** 로그인 후에 사용가능 
	 */
	
	// 관리자(사원) 비밀변호 변경
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		return "employee/modifyEmpPw";
	}
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, Model model
						, @RequestParam(value="oldPw", required=true) String oldPw
						, @RequestParam(value="newPw", required=true) String newPw) {
						// required=true -> null이 들어오지 못하게(기본값임) false면 null 가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		// System.out.println("oldPw: "+oldPw);
		// System.out.println("newPw: "+newPw);
		// System.out.println("empNo: "+loginEmp.getEmpNo());
		
		// 서비스 호출
		int row = employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		if(row == 0) {
			log.debug("\u001B[32m"+"비밀변호 변경 실패");
			model.addAttribute("errMsg", "비밀번호 변경에 실패하였습니다.");
			return "employee/modifyEmpPw";
		} else {
			log.debug("\u001B[32m"+"비밀변호 변경 성공");
		}
		
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("\u001B[32m"+"로그아웃 성공");
		return "redirect:/Index";
	}
	
	// 사원삭제
	@GetMapping("/employee/deleteEmp")
	public String removeEmp(HttpSession session, @RequestParam(value="empNo") int empNo) {
	
		int row = employeeService.deleteEmployee(empNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"삭제 실패");
		} else {
			log.debug("\u001B[32m"+"삭제 성공");
		}
		
		return "redirect:/employee/empList";
	}
	
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Model model, Employee employee) { // 매개변수를 받아올 것임 -> 같은 맵핑주소(맵핑방식이 다름)와 같은 메서드(매개변수를 받음) 이름을 써도 된다
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");

		// 서비스 호출
		// 1) id check
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck.equals("no")) {
			log.debug("\u001B[32m"+"사원등록 실패 : 중복된 아이디");
			model.addAttribute("userEmpId", employee.getEmpId());
			model.addAttribute("userEmpPw", employee.getEmpPw());
			model.addAttribute("userEmpName", employee.getEmpName());
			return "redirect:/employee/empList";
		} else {
			log.debug("\u001B[32m"+"중복된 아이디 없음, 사원등록 진행");
		}
		
		// 2) add emp
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			log.debug("\u001B[32m"+"사원등록 실패");
			return "redirect:/employee/empList";
		} else {
			log.debug("\u001B[32m"+"사원등록 성공");
		}
		
		return "redirect:/employee/empList"; // 리다이렉트 하기 위함 CM -> C
		// 스프링 내에서 redirect:로 시작하면 리다이렉트 되게끔 되어있음(employee/addEmp는 기존 포워딩 방식)
	}
	
	// 사원출력
	@GetMapping("/employee/empList")
	public String empList(Model model
						, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
						, @RequestParam(value="searchWord", defaultValue = "") String searchWord) { // 모델 타입의 모델값을 매개로 받아 모델안에 리스트를 담음
											// int currentPage = request.getParameter
		
		log.debug("\u001B[35m"+"searchWord------> "+searchWord);
		log.debug("\u001B[35m"+"rowPerPage------> "+rowPerPage);
		log.debug("\u001B[35m"+"currentPage------> "+currentPage);
		
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		int cnt = employeeService.getEmpCnt(searchWord);
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

		// log.debug("\u001B[35m"+"cnt------> "+cnt);
		// log.debug("\u001B[35m"+"lastPage------> "+lastPage);
		// log.debug("\u001B[35m"+"startPage------> "+startPage);
		// log.debug("\u001B[35m"+"endPage------> "+endPage);
		
		// request.setAttribute("list", list); 대신 아래코드로
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		// System.out.println(endPage);
		
		return "employee/empList";
	}
}