package ITzy.admin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ITzy.admin.dao.MemoDao;
import ITzy.admin.dto.MemoDto;

@Repository
public class MemoDaoImpl implements MemoDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Memo.";

	@Override
	public List<MemoDto> myMemo(String id) {
		return session.selectList(ns+"myMemo",id);
	}

	@Override
	public int addMemo(MemoDto dto) {
		return session.insert(ns +"addMemo", dto);
	}

	@Override
	public int delMemo(MemoDto dto) {
		return session.delete(ns +"delMemo", dto);
	}

}
