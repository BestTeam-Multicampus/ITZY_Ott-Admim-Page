package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.MemberDto;

public interface MemberService {
	List<MemberDto> allMember();
	MemberDto login(MemberDto dto);
	boolean idCheck(String id);
	boolean addMember(MemberDto dto);
}
