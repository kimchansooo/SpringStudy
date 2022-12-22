package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
import vo.Member;



@Service
public class JoinService {

	@Autowired
	private SqlSession sqlsession;
	
	public void insertMember(Member member){

		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		dao.insertMember(member);

	}
	
	
	public int loginCheck(String username, String password){
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = dao.loginCheck(username, password);
		return result;
	}
}
