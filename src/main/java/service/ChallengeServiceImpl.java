package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.ChallengeMapper;
import vo.ChallengeVO;
import vo.ReplyVO;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	ChallengeMapper dao;

	@Override
	public List<ChallengeVO> selectList() {
		return dao.selectList();
	}
	@Override
	public ChallengeVO selectOne(ChallengeVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int insert(ChallengeVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(ChallengeVO vo) {
		return dao.update(vo);
	}
	@Override
	public int delete(ChallengeVO vo) {
		return dao.delete(vo);
	}
	@Override
	public int countUp(ChallengeVO vo) {
		return dao.countUp(vo);
	}
	@Override
	public List<ChallengeVO> checkCategory(ChallengeVO vo) {
		return dao.checkCategory(vo);
	}
	@Override
	public List<ChallengeVO> checkTitle(ChallengeVO vo) {
		return dao.checkTitle(vo);
	}
	@Override
	public List<ChallengeVO> checkState(ChallengeVO vo) {
		return dao.checkState(vo);
	}
	@Override
	public int participate(ChallengeVO vo) {
		return dao.participate(vo);
	}
	@Override
	public ChallengeVO checkParticipate(ChallengeVO vo) {
		return dao.checkParticipate(vo);
	}
	@Override
	public int rinsert(ReplyVO vo) {
		return dao.rinsert(vo);
	}
	@Override
	public List<ReplyVO> rList() {
		return dao.rList();
	}
	
} //class
