package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.MemoDto;

public interface MemoDao {
	
	List<MemoDto> myMemo();
	int addMemo(MemoDto dto);
	int delMemo(MemoDto dto);

}