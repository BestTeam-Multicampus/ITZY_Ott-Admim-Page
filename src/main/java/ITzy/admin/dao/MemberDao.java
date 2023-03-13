package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.MemberDto;

public interface MemberDao {
	List<MemberDto> allMember();
	int idCheck(String id);
	int addMember(MemberDto dto);
	MemberDto login(MemberDto dto);
}
