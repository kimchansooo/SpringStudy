package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dto.Emp;
import kr.or.kosa.service.EmpService;

@RestController
@RequestMapping("/emp")
public class EmpController {
	
	//controller는 service에 의존합니다
	
	private EmpService empservice;
	
	@Autowired
	public void setEmpservice(EmpService empservice) {
		this.empservice = empservice;
	}
	
	/*
	Restfull 방식의 annotation도 존재
	@GetMapping
	@PostMapping
	@DeleteMapping
	@PutMapping
	@PatchMapping
	*/
	/*
	가장 쉬운 방식
	@RequestMapping(value = "", method = RequestMethod.GET)
	public List<Emp> emplist(){
		return empservice.selectAllEmpList();
	}
	*/
	
	//전체조회(Restful)
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<Emp>> emplist(){
		List<Emp> list = new ArrayList<Emp>();
		
		try {
			System.out.println("정상실행");
			list = empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);//상태코드 제어 가능
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
		}
	}
	
	//조건조회
	//http://localhost:8090/kosa/emp/7788 >> {}
	@RequestMapping(value="{empno}", method = RequestMethod.GET)
	public ResponseEntity<Emp> emplistByempno(@PathVariable("empno")int empno) {
		Emp emp = new Emp();
		try {
			System.out.println("정상실행");
			emp =empservice.selectEmpByEmpno(empno);
			return new ResponseEntity<Emp>(emp,HttpStatus.OK);//상태코드 제어 가능
		} catch (Exception e) {
			return new ResponseEntity<Emp>(emp,HttpStatus.BAD_REQUEST);
		}
	}
	
	//삽입
	//데이터(empno=3000,ename='아무개',sal=10) 서버로 전달
	//http://localhost:8090/kosa/emp >> data (empno=3000,ename='아무개',sal=10)
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<List<Emp>> insertEmp(@RequestBody Emp emp) {
		List<Emp> list = null;
		try {
			System.out.println("insert 실행");
			empservice.insertEmp(emp);
			list = empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("insert 실패");
			return new ResponseEntity<List<Emp>>(list, HttpStatus.BAD_REQUEST);
		}
	}
	
	//수정
	@RequestMapping(value="", method = RequestMethod.PUT)
	public ResponseEntity<List<Emp>> updateEmp(@RequestBody Emp emp) {
		List<Emp> list = null;
		try {
			System.out.println("update 실행");
			empservice.updateEmp(emp);
			list = empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("update 실패");
			return new ResponseEntity<List<Emp>>(list, HttpStatus.BAD_REQUEST);
		}
	}
	
	//삭제
	//delete (DELETE)
	@RequestMapping(value = "{empno}", method = RequestMethod.DELETE)
	public ResponseEntity<List<Emp>> deleteEmp(@PathVariable("empno")int empno) {
		List<Emp> list = null;
		try {
			System.out.println("delete 실행");
			empservice.deleteEmp(empno);
			list = empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("delete 실패");
			return new ResponseEntity<List<Emp>>(list, HttpStatus.BAD_REQUEST);
		}
	}
}
