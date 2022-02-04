package mapperInterface;

import vo.MemberVO;

public interface MemberMapper {
	

	MemberVO selectOne(MemberVO vo);

	int insert(MemberVO vo);
	int delete(MemberVO vo);
	int update(MemberVO vo);
}
