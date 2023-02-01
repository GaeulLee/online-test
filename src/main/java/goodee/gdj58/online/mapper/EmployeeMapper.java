package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper
// mapper가 기존에 사용하던 dao 역할을 함 -> 쿼리문은 같은 패키지, 같은 이름의 xml파일에 작성 또는 Mapper 어노테이션에 작성
public interface EmployeeMapper {
	
	// 비밀번호 수정
	int updateEmployeePw(Map<String, Object> paramMap);
	
	// 로그인
	Employee login(Employee employee);
	
	// 사원 삭제
	int deleteEmployee(int empNo);
	
	// 사원 추가
	int insertEmployee(Employee employee);
	
	// 전체 사원 수
	int selectEmpCnt();
	
	// 사원 목록 출력
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
	
}