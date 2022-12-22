package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Emp;

public interface EmpDao {
	//CRUD 함수
	
	//삽입
	int insert(Emp emp);
	
	//전체조회
	List<Emp> select();
	//조건조회
	Emp selectByEmpno(int empno);
	//수정
	int update(Emp emp);
	//삭제
	int delete(int empno);
}
