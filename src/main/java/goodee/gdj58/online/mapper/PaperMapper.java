package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;

@Mapper
public interface PaperMapper {
	
	// 응시한 시험 상세보기(점수 확인)
	List<Map<String, Object>> selectPaperByTestNoAndStudentNo(Map<String, Object> paramMap);
	
	// 답안 입력
	int insertPaper(Paper paer);
}
