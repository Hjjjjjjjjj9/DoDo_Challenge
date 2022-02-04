package util;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

//** DAO (Data Access Object)
//=> CRUD 구현 
//   C: create -> insert
//   R: read   -> selectList, selectOne
//   U: update -> update
//   D: delete -> delete

@Repository
public class MemberDAO {
	
	@Autowired // Spring 이 제공
	//@Inject : Java 가 제공
	private SqlSession sqlSession;
	
	private static final String NS = "DoDo.mapper.MemberMapper." ;

	// ** selectOne
	public MemberVO selectOne(MemberVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne
	
	// join
	public int insert(MemberVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
	
} //class
