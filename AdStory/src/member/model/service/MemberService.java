package member.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import member.model.dao.MemberDAO;
import member.model.vo.Member;
import pointlog.DAO.PointLogDAO;

import static common.JDBCTemplate.*;

public class MemberService {

	public static final String USER_MEMBER_ROLE = "U";
	public static final String ADMIN_MEMBER_ROLE = "A";
	public static final String COMPANY_MEMBER_ROLE = "C";
	
	private MemberDAO memberDAO = new MemberDAO();
	private PointLogDAO pointLogDAO = new PointLogDAO();
	
	public Member selectOne(String memberId) {
		System.out.println("memberId@service = " + memberId);
		//1. DB Connection객체 생성
		Connection conn = getConnection();
		System.out.println("conn = " + conn);
		//2. DAO 처리 요청
		Member member = memberDAO.selectOne(conn, memberId);
		
		System.out.println("member@service = " + member);
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		close(conn);
		
		return member; 
	}

	public int updateMemberPoint(String userId, int pointAmount) {
		//1. DB Connection객체 생성
		Connection conn = getConnection();
		System.out.println("conn = " + conn);
		//2. DAO 처리 요청
		int result = memberDAO.updateMemberPoint(conn, userId, pointAmount);
		
		int result2 = pointLogDAO.AdminInsertPointLog(conn, userId, pointAmount);
		
		//3. DML요청인 경우, Transaction 처리
		//4. Connection 반납(close)
		if(result>0 && result2>0 )
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result*result2;
	}
	
	
	
}





