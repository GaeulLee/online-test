package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {
	
	/*
	 *************** 관리자(사원)기능 
	 */
	
	// 강사 등록
	int insertTeacher(Teacher teacher);
	
	// 강사 삭제
	int deleteTeacher(int teacherNo);
	
	// 전체 강사 수
	int selectTeacherCnt(String searchWord);
	
	// 강사 목록 출력
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
}
