package service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EmpDao;
import vo.Emp;

@Service
public class ItemService{
	
	private SqlSession sqlsession;
	
	@Autowired
	public ItemService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}



	public List<Emp> items(){
		List<Emp> empList = null;
		
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			empList = empdao.getEmps();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return empList;
	}
	
	public String empInsert(Emp emp){
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			empdao.insert(emp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:items.htm";
	}
	
	
	public Emp empDetail(String empno){
		Emp emp = null;
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			emp = empdao.getEmp(empno);
		}  catch (ClassNotFoundException e) {
				e.printStackTrace();
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return emp;
	}
	
	public String empEdit(Emp emp) {
		System.out.println("asd");
		try {
			EmpDao empdao = sqlsession.getMapper(EmpDao.class);
			empdao.update(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:items.htm"; 
	}
	
	public String empDel(String empno) {
		EmpDao empdao = sqlsession.getMapper(EmpDao.class);
		try {
			empdao.delete(empno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:items.htm";
	}
}