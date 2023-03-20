package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.MemoDao;
import ITzy.admin.dto.MemoDto;
import ITzy.admin.service.MemoService;

@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	MemoDao dao;
	
	@Override
	public List<MemoDto> myMemo() {
		return dao.myMemo();
	}

	@Override
	public boolean addMemo(MemoDto dto) {
		int count = dao.addMemo(dto);
		return count>0?true:false;
	}

	@Override
	public boolean delMemo(MemoDto dto) {
		int count = dao.delMemo(dto);
		return count>0?true:false;
	}

}
