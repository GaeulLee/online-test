package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {
	
	// 비밀번호 수정
	int updateStudentPw(Map<String, Object> paramMap);
	
	// 로그인
	Student login(Student student);
	
	/*
	 ******************* 관리자(사원) 기능 
	 */
	
	// 학생 등록
	int insertStudent(Student student);
	
	// 학생 삭제
	int deleteStudent(int studentNo);
	
	// 전체 학생 수
	int selectStudentCnt(String searchWord);
	
	// 학생 목록 출력
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
