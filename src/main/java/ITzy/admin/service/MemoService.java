package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.MemoDto;

public interface MemoService {
	
	List<MemoDto> myMemo();
	boolean addMemo(MemoDto dto);
	boolean delMemo(MemoDto dto);

}
