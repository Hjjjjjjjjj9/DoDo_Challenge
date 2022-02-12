package service;

import java.util.List;
import java.util.Map;

import vo.MemberVO;
import vo.PageVO;

public interface MemberService {
	
	MemberVO selectOne(MemberVO vo); //selectOne
	MemberVO selectOnebyMail(MemberVO vo);
	int insert(MemberVO vo); //insert
	int update(MemberVO vo); //update
	int delete(MemberVO vo); //delete
	
	MemberVO findID(MemberVO vo);
	MemberVO findPW(MemberVO vo);
	
	int setPassword(MemberVO vo);
	int pwUpdate(MemberVO vo);
	int tmpDelete(MemberVO vo);

	PageVO<MemberVO> pageList(PageVO<MemberVO> pvo);
	List<MemberVO> selectList();
	int totalRowCount();
	
	List<Map<String, Object>> getAdminMember();
	
}