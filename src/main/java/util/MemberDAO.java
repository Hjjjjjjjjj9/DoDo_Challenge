package util;

import java.sql.*;

import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MemberDAO {
	
	Connection cn = DBConnection.getConnection();
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	String sql;

	public MemberVO selectOne(MemberVO vo) {
		sql="select * from d_member where id=?" ;
		try {
			pst=cn.prepareStatement(sql);
			pst.setString(1,vo.getId());
			rs = pst.executeQuery();
			if (rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPassword(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setMail(rs.getString(4));
				vo.setNick(rs.getString(5));
				vo.setRid(rs.getString(6));
				vo.setPoint(rs.getInt(7));
				vo.setPrefer(rs.getString(8));
			}else {
				System.out.println("** 해당하는 자료가 없습니다 ~~ **");
				vo=null;
			}
		} catch (Exception e) {
			System.out.println("** selectOne Exception => "+e.toString());
			vo=null;
		}
		return vo;
	} //selectOne	
	
	public int insert(MemberVO vo) {
		sql="insert into d_member (id,password,name,mail,nick,rid,prefer)values(?,?,?,?,?,?,?)";
		// insert into d_member VALUES ('test','12345','테스트',
			//'email@naver.com','닉네임','추천인',1000,'운동','spare');
		try {
			pst=cn.prepareStatement(sql);
			pst.setString(1,vo.getId());
			pst.setString(2,vo.getPassword());
			pst.setString(3,vo.getName());
			pst.setString(4,vo.getMail());
			pst.setString(5,vo.getNick());
			pst.setString(6,vo.getRid());
			pst.setString(7,vo.getPrefer()); 
			return pst.executeUpdate();
			// executeUpdate() => 처리된 row 의 갯수 return
		} catch (Exception e) {
			System.out.println("** insert Exception => "+e.toString());
			return 0;
		}
	} //insert
	
} //class
