package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.BbsComment;
import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.BbsParam;

public interface BbsService {
	List<BbsDto> bbslist(BbsParam bbs);
	int getAllBbs(BbsParam bbs);
	boolean writeBbs(BbsDto dto);
	BbsDto getBbs(int seq);
	boolean updateBbs(BbsDto dto);
	BbsDto deleteBbs(int seq);
	
	boolean answerBbs(BbsDto dto);
	boolean commentWrite(BbsComment bc);
	public List<BbsComment> commentList(int seq);
}
