package kr.or.kosa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.EmpDao;
import kr.or.kosa.dto.Emp;

@Service
public class EmpService {
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	/*
	void insert(Emp emp);
	
	List<Emp> select();
	
	Emp selectByEmpno(int empno);
	
	int update(Emp emp);
	
	int delete(int empno);
	*/
	
	public void insertEmp(Emp emp) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		empdao.insert(emp);
	}
	
	public List<Emp> selectAllEmpList(){
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		//인터페이스를 mapper가 구현했다(장확한 표현은 아님)
		List<Emp> list = empdao.select();
		return list;
	}
	
	public Emp selectEmpByEmpno(int empno) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		return empdao.selectByEmpno(empno);
	}
	
	public int updateEmp(Emp emp) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		return empdao.update(emp);
	}
	
	public int deleteEmp(int empno) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		return empdao.delete(empno);
	}
}
