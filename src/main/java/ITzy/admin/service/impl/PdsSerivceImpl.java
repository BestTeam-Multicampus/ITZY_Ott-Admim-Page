package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.PdsDao;
import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.PdsDto;
import ITzy.admin.service.PdsSerivce;
@Service
public class PdsSerivceImpl implements PdsSerivce{
	@Autowired
	PdsDao dao;

	@Override
	public List<PdsDto> pdslist(BbsParam pds) {
		return dao.pdslist(pds);
	}

	@Override
	public boolean uploadPds(PdsDto dto) {
		int count = dao.uploadPds(dto);
		return count>0?true:false;
	}

	@Override
	public void downcount(int seq) {
		dao.downcount(seq);
	}

	@Override
	public PdsDto getPds(int seq) {
		return dao.getPds(seq);
	}

	@Override
	public int getAllPds(BbsParam pds) {
		return dao.getAllPds(pds);
	}

	@Override
	public boolean updatePds(PdsDto dto) {
		int n = dao.updatePds(dto); 
		return n>0?true:false;
	}

	@Override
	public PdsDto deletePds(int seq) {
		return dao.deletePds(seq);
	}
}
