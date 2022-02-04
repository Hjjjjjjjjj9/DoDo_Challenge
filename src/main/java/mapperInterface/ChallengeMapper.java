package mapperInterface;

import java.util.List;

import vo.ChallengeVO;
import vo.ReplyVO;

public interface ChallengeMapper {
	
	List<ChallengeVO> selectList(); //selectList
	ChallengeVO selectOne(ChallengeVO vo); //selectOne
	
	int insert(ChallengeVO vo); //insert
	int update(ChallengeVO vo); //update
	int delete(ChallengeVO vo); //delete
	
	int countUp(ChallengeVO vo); //countUp
	
	List<ChallengeVO> checkCategory(ChallengeVO vo);
	List<ChallengeVO> checkTitle(ChallengeVO vo);
	List<ChallengeVO> checkState(ChallengeVO vo);
	
	int participate(ChallengeVO vo);
	ChallengeVO checkParticipate(ChallengeVO vo);
	
	int rinsert(ReplyVO vo);
	List<ReplyVO> rList();
	
} //interface
