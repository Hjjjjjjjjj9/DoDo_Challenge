package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.MemberMapper;
import vo.MemberVO;
import vo.PageVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper dao;

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public MemberVO selectOnebyMail(MemberVO vo) {
		return dao.selectOnebyMail(vo);
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
	@Override
	public List<MemberVO> selectList() {
		return dao.selectList();
	}
	@Override
	public int totalRowCount() {
		return dao.totalRowCount();
	}
	@Override
	public PageVO<MemberVO> pageList(PageVO<MemberVO> pvo){
		pvo.setTotalRowCount(dao.totalRowCount());
		pvo.setList(dao.pageList(pvo));
		return pvo;
	}
	@Override
	public List<Map<String, Object>> getAdminMember() {
		
		List<Map<String, Object>> adminMember = new ArrayList<Map<String, Object>>();
		adminMember = dao.getAdminMember();
		
		return adminMember;
	}
	
} //class
