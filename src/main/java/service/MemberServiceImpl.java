package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.MemberMapper;
import vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper dao;

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int insert(MemberVO vo) {
		return 0;
	}
	@Override
	public int update(MemberVO vo) {
		return 0;
	}
	@Override
	public int delete(MemberVO vo) {
		return 0;
	}
	@Override
	public MemberVO findID(MemberVO vo) {
		return dao.findID(vo);
	}
	@Override
	public MemberVO findPW(MemberVO vo) {
		return dao.findPW(vo);
	}
	@Override
	public int setPassword(MemberVO vo) {
		return dao.setPassword(vo);
	}
	@Override
	public int pwUpdate(MemberVO vo) {
		return dao.pwUpdate(vo);
	}
	@Override
	public int tmpDelete(MemberVO vo) {
		return dao.tmpDelete(vo);
	}

} //class
