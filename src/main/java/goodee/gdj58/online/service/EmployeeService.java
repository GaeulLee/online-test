package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.vo.Employee;

@Service // 어노테이션을 사용 -> vo만드는 것과 비슷한 이유같음(찾아보자)
@Transactional // try catch 역할(기존 try catch와는 위치가 다름 : dao까지 가지 않음)
public class EmployeeService {
	@Autowired // 무슨 역할을 하는지 한번 찾아보자 -> 빈을 사용하는 것 같음, dao와 이어줌
	private EmployeeMapper employeeMapper;
	
	// 로그인
	public Employee login(Employee employee) {
		System.out.println("사원로그인 Service");
		return employeeMapper.login(employee);
	}
	
	// 사원삭제
	public int deleteEmployee(int empNo) {
		System.out.println("사원삭제 Service");
		return employeeMapper.deleteEmployee(empNo);
	}
	
	// 사원입력
	public int addEmployee(Employee employee) {
		System.out.println("사원입력 Service");
		return employeeMapper.insertEmployee(employee);
	}
	
	// 전체사원수
	public int getEmpCnt() {
		// System.out.println("전체사원수 Service");
		return employeeMapper.selectEmpCnt();
	}
	
	// 사원목록출력
	public List<Employee> getEmployeeList(int currnetPage, int rowPerPage){ // 검색어 있으면 검색어까지
		// System.out.println("사원목록출력 Service");
		int beginRow = (currnetPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		// paramMap.put("rowPerPage", rowPerPage); 검색어 있으면 검색어까지
		return employeeMapper.selectEmployeeList(paramMap);
	}
	
}
