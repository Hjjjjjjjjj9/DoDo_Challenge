package service;

import java.util.List;

import vo.MemberVO;

public interface MemberService {
	
	List<MemberVO> selectList();
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(MemberVO vo);
	
	MemberVO selectOne(MemberVO vo);

}
