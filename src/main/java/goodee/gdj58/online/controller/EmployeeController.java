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
import goodee.gdj58.online.vo.Employee;

@Controller 
public class EmployeeController {
	@Autowired 
	EmployeeService employeeService;
	
	/*
	 ************************* 로그인 전에 사용가능 
	 */
	
	// 로그인
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session) { // 세션을 사용하는 로직은 서블릿 api를 매개로 받음
		
		// 이미 로그인 되어있다면 redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		
		return "employee/loginEmp";
	}
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee employee) {
		
		Employee resultEmp = employeeService.login(employee);
		if(resultEmp == null) {
			System.out.println("로그인 실패 : 일치하는 사원 정보 없음");
			return "redirect:/employee/loginEmp";
		}
		System.out.println("로그인 성공");
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	/*
	 ***************************** 로그인 후에 사용가능 
	 */
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 성공");
		return "redirect:/employee/loginEmp";
	}

	// 사원삭제
	@GetMapping("/employee/deleteEmp")
	public String removeEmp(HttpSession session, @RequestParam(value="empNo") int empNo) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		int row = employeeService.deleteEmployee(empNo);
		if(row == 0) {
			System.out.println("삭제 실패");
		}
		System.out.println("삭제 성공");
		
		return "redirect:/employee/empList";
	}
	
	// 사원입력
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}		
		
		return "employee/addEmp";
	}
	
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Employee employee) { // 매개변수를 받아올 것임 -> 같은 맵핑주소(맵핑방식이 다름)와 같은 메서드(매개변수를 받음) 이름을 써도 된다
		
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			System.out.println("입력 실패");
		}
		System.out.println("입력 성공");
		
		return "redirect:/employee/empList"; // 리다이렉트 하기 위함 CM -> C
		// 스프링 내에서 redirect:로 시작하면 리다이렉트 되게끔 되어있음(employee/addEmp는 기존 포워딩 방식)
	}
	
	// 사원출력
	@GetMapping("/employee/empList")
	public String empList(HttpSession session, Model model
						, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) { // 모델 타입의 모델값을 매개로 받아 모델안에 리스트를 담음
											// int currentPage = request.getParameter
		// 로그인 유효성 검사
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage);
		int cnt = employeeService.getEmpCnt();
		int endPage = cnt/rowPerPage;
		if(endPage%rowPerPage != 0) {
			endPage++;
		}
		// request.setAttribute("list", list); 대신 아래코드로
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		// System.out.println(endPage);
		
		return "employee/empList";
	}
}