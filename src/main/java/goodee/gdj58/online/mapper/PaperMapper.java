package goodee.gdj58.online.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;

@Mapper
public interface PaperMapper {
	
	// 답안 입력
	int insertPaper(Paper paer);
}
