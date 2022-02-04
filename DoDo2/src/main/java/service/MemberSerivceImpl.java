package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.MemberMapper;
import vo.MemberVO;

@Service
public class MemberSerivceImpl implements MemberService {
	
	@Autowired
	MemberMapper dao;

	@Override
	public List<MemberVO> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(MemberVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

}
