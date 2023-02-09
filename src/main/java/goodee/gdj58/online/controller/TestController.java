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
import goodee.gdj58.online.service.QuestionService;
import goodee.gdj58.online.service.TestService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;
	@Autowired QuestionService questionService;
	@Autowired ExampleService exampleService;
	
	// ****************************** 학생 기능
	
	// 응시한 시험 목록
	@GetMapping("/student/studentTestList")
	public String studentTestList(Model model, HttpSession session) {
		
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		int studentNo = loginStudent.getStudentNo();
		
		// 서비스 호출
		List<Test> list = testService.getStudentTestList(studentNo);
		
		model.addAttribute("list", list);
		
		return "student/studentTestList";
	}
	
	
	
	// ****************************** 강사 기능
	
	// ************ 문제 및 보기 CURD
	
	// 문제 삭제(보기 포함)
	@GetMapping("/teacher/test/qne/removeQne")
	public String removeQne(Model model
							, @RequestParam(value="testNo") int testNo) {
		return "";
	}
	
	// 문제 수정(보기 포함)
	@GetMapping("/teacher/test/qne/modifyQne")
	public String modifyQne(Model model
							, @RequestParam(value="testNo") int testNo) {
		return "";
	}
	
	// 문제 추가(보기 포함)
	@GetMapping("/teacher/test/qne/addQne")
	public String addQne(Model model
							, @RequestParam(value="testNo") int testNo) {
		
		Test test = testService.getTestOne(testNo); // 시험 정보 출력용
		List<Question> list = testService.getQuestionList(testNo); // 등록된 문제 존재 유무 확인용
		
		// 문제 번호 순차적으로 입력 하기위함
		int maxQueIdx = 0;
		if(list.size() == 0) {
			log.debug("\u001B[32m"+"등록된 문제 없음 : 문제번호 1");
			maxQueIdx = 1;
		} else {
			log.debug("\u001B[32m"+"등록된 문제 있음 : 문제번호 순차 증가 실행");
			maxQueIdx = testService.getMaxQueIdx(testNo);
		}
		
		log.debug("\u001B[32m"+"maxQueIdx------>"+maxQueIdx);
		
		model.addAttribute("maxQueIdx", maxQueIdx);
		model.addAttribute("test", test);
		
		return "teacher/test/qne/addQne";
	}
	@PostMapping("/teacher/test/qne/addQne")
	public String addQne(Model model
					, @RequestParam(value="testNo") int testNo
					, @RequestParam(value="questionIdx") int questionIdx
					, @RequestParam(value="questionTitle") String questionTitle
					, @RequestParam(value="exampleTitle") String[] exampleTitle
					, @RequestParam(value="exampleOx") String[] exampleOx) {
		
		// questionIdx, questionTitle, exampleIdx[1,2,3,4], exampleTitle[], exampleOx[]
		log.debug("\u001B[32m"+"questionIdx------>"+questionIdx);
		log.debug("\u001B[32m"+"questionTitle------>"+questionTitle);
		log.debug("\u001B[32m"+"exampleOx------>"+exampleOx.length);
		log.debug("\u001B[32m"+"exampleOx------>"+exampleOx[0]);
		
		// 1) 문제 입력
		Question que = new Question();
		que.setQuestionIdx(questionIdx);
		que.setQuestionTitle(questionTitle);
		
		int queRow = questionService.addQuestion(que, testNo);
		if(queRow == 0) {
			log.debug("\u001B[32m"+"문제 입력 실패");
			return "redirect:/teacher/test/qne/qneList?testNo="+testNo;
		}
		List<Question> list = questionService.getRecentQuestionList(); // 최근 등록된 questionNo가 담긴 리스트
		int questionNo = list.get(0).getQuestionNo();
		log.debug("\u001B[32m"+"문제 입력 성공, 보기 입력 진행");
		log.debug("\u001B[32m"+"questionNo----->"+questionNo);
				
		// 2) 보기 입력
		for(int i=0; i<4; i++) { // 보기의 갯수 만큼 insert 진행
			Example e = new Example();
			e.setExampleIdx(i+1);
			e.setExampleTitle(exampleTitle[i]);
			e.setExampleOx(exampleOx[i]);
			
			int examRow = exampleService.addExample(e, questionNo);
			if(examRow == 0) {
				log.debug("\u001B[32m"+(i+1)+"번째 보기 입력 실패");
				return "redirect:/teacher/test/qne/qneList?testNo="+testNo;
			}
		}
		log.debug("\u001B[32m"+"모든 보기 입력 성공");
		
		return "redirect:/teacher/test/qne/qneList?testNo="+testNo;
	}
	
	// 시험 문제 목록
	@GetMapping("/teacher/test/qne/qneList")
	public String questionList(Model model
							, @RequestParam(value="testNo") int testNo) {
		
		List<Question> list = testService.getQuestionList(testNo);
		Test test = testService.getTestOne(testNo);
		
		model.addAttribute("list", list);
		model.addAttribute("test", test);
		
		return "teacher/test/qne/qneList";
	}
	
	
	// ************ 시험 CURD
	
	// 시험 회차 삭제
	@GetMapping("/teacher/test/removeTest")
	public String removeExample(Model model
			, @RequestParam(value="testNo") int testNo) {
		
		int row = testService.removeTest(testNo);
		if(row == 0) {
			log.debug("\u001B[32m"+"시험 삭제 실패");
		} else {
			log.debug("\u001B[32m"+"시험 삭제 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	
	// 시험 회차 수정
	@GetMapping("/teacher/test/modifyTest")
	public String modifyTest(Model model
				, @RequestParam(value="testNo") int testNo) {
		
		Test oldTest = testService.getTestOne(testNo);
		
		model.addAttribute("oldTest", oldTest);
		
		return "teacher/test/modifyTest";
	}
	@PostMapping("/teacher/test/modifyTest")
	public String modifyTest(Test test) {
		
		int row = testService.modifyTest(test);
		if(row == 0) {
			log.debug("\u001B[32m"+"시험 수정 실패");
		} else {
			log.debug("\u001B[32m"+"시험 수정 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	
	// 시험 회차 추가
	@GetMapping("/teacher/test/addTest")
	public String addTest() {
		return "teacher/test/addTest";
	}
	@PostMapping("/teacher/test/addTest")
	public String addTest(Test test) {
		
		int row = testService.addTest(test);
		if(row == 0) {
			log.debug("\u001B[32m"+"시험 추가 실패");
		} else {
			log.debug("\u001B[32m"+"시험 추가 성공");
		}
		
		return "redirect:/teacher/test/testList";
	}
	// 시험 회차 목록
	@GetMapping("/teacher/test/qne/testListForAdd")
	public String testListForAdd(Model model
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		log.debug("\u001B[35m"+"searchWord------> "+searchWord);
		log.debug("\u001B[35m"+"rowPerPage------> "+rowPerPage);
		log.debug("\u001B[35m"+"currentPage------> "+currentPage);
		
		List<Test> list = testService.getTestList(rowPerPage, currentPage, searchWord);
		int cnt = testService.getTestCnt(searchWord);
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
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "teacher/test/qne/testListForAdd";
	}
	
	// 시험 회차 목록
	@GetMapping("/teacher/test/testList")
	public String testList(Model model
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		
		log.debug("\u001B[35m"+"searchWord------> "+searchWord);
		log.debug("\u001B[35m"+"rowPerPage------> "+rowPerPage);
		log.debug("\u001B[35m"+"currentPage------> "+currentPage);
		
		List<Test> list = testService.getTestList(rowPerPage, currentPage, searchWord);
		int cnt = testService.getTestCnt(searchWord);
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
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "teacher/test/testList";
	}
}
