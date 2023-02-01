package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.mapper.IdMapper;
import goodee.gdj58.online.vo.Employee;

@Service // 어노테이션을 사용 -> vo만드는 것과 비슷한 이유같음(찾아보자)
@Transactional // try catch 역할(기존 try catch와는 위치가 다름 : dao까지 가지 않음)

// dao와 controller의 사이를 중개해 줌 -> 서비스에서 하는 역할이 없는 경우도 있다
// -> 근데 왜 쓰냐? 통일성을 위해서: 어느 컨트롤러는 서비스를 거치고 어느 컨트롤러는 서비스를 거치지 않는 것이 통일성을 해침
public class EmployeeService {
	// DI new EmployeeMapper()
	// @Autowired가 무슨 역할을 하는지 한번 찾아보자 -> 빈을 사용하는 것 같음, dao와 이어줌
	@Autowired private EmployeeMapper employeeMapper;
	
	// update pw
	public int updateEmployeePw(int empNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>(); // 이것도 다형성임
		paramMap.put("empNo", empNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		
		// System.out.println("empNo: "+paramMap.get("empNo"));
		// System.out.println("oldPw: "+paramMap.get("oldPw"));
		// System.out.println("newPw: "+paramMap.get("newPw"));
		
		return employeeMapper.updateEmployeePw(paramMap);
	}
	
	// 로그인
	public Employee login(Employee employee) {
		// System.out.println("사원로그인 Service");
		return employeeMapper.login(employee);
	}
	
	// 사원삭제
	public int deleteEmployee(int empNo) {
		// System.out.println("사원삭제 Service");
		return employeeMapper.deleteEmployee(empNo);
	}
	
	// 사원입력
	public int addEmployee(Employee employee) {
		// System.out.println("사원입력 Service");
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
