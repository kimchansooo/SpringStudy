package dao;

import java.sql.SQLException;
import java.util.List;

import vo.Emp;



public interface EmpDao {
	//게시물 개수
	int getCount(String field, String query) throws ClassNotFoundException, SQLException;
	
	//전체 게시물
	List<Emp> getEmps() throws ClassNotFoundException, SQLException;
	
	//게시물 삭제
	int delete(String seq) throws ClassNotFoundException, SQLException;
	
	//게시물 수정
	int update(Emp emp) throws ClassNotFoundException, SQLException;
	
	//게시물 상세
	Emp getEmp(String empno) throws ClassNotFoundException, SQLException;
	
	//게시물 입력
	int insert(Emp emp) throws ClassNotFoundException, SQLException;

}
