package kr.or.kosa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import kr.or.kosa.dto.Emp;
import kr.or.kosa.service.EmpService;

@RestController
@RequestMapping("/emp")
public class EmpController {
	
	//controller는 service에 의존한다.
	private EmpService empservice;
	
	@Autowired
	public void setEmpservice(EmpService empservice) {
		this.empservice = empservice;
	}
	
	/*
	Restful 방식의 annotation도 존재한다.
	@GetMapping
	@PostMapping
	@DeleteMapping
	@PutMapping
	@PatchMapping
	 */
	
	/* 가장 쉬운 방식
	 * @RequestMapping(value="",method=RequestMethod.GET) public List<Emp>
	 * emplist(){ return empservice.selectAllEmpList(); }
	 */
	
	//전체조회(RESTFUL)방식
	@RequestMapping(value="",method=RequestMethod.GET)
	public ResponseEntity<List<Emp>> emplist(){
		List<Emp> list = new ArrayList<Emp>();
		
		try {
			System.out.println("정상실행");
			list = empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list,HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<Emp>>(list,HttpStatus.BAD_REQUEST);
		}
	}
	
	 //조건조회
	   //http://localhost:8090/kosa/emp/7788 >> {}
	   @RequestMapping(value="{empno}", method=RequestMethod.GET)
	   public Emp emplistByempno(@PathVariable("empno") int empno) {
	      return empservice.selectEmpByEmpno(empno);
	   }
	   //삽입
	   //데이터(empno=3000,ename=아무개,sal=10)서버로 전달
	   @RequestMapping(value="",method = RequestMethod.POST)
	   public ResponseEntity<List<Emp>> insert(@RequestBody Emp emp) {
		  List<Emp> list=null;
		   try {
			   System.out.println("insert 실행");
			empservice.insert(emp);
			list=empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("insert 실패");
			return new ResponseEntity<List<Emp>>(list , HttpStatus.BAD_REQUEST);
		}
	  }
	   
	   //update(PUT or PATCH)
	   //수정
	   @RequestMapping(value="",method = RequestMethod.PUT)
	   public ResponseEntity<List<Emp>> update(@RequestBody Emp emp) {
			List<Emp> list = null;
		   try {
			   System.out.println("update 실행");
			empservice.update(emp);
			list=empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list , HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("update 실패");
			return new ResponseEntity<List<Emp>>(list , HttpStatus.BAD_REQUEST);
		}
	  }
	   //삭제
	   //delete (DELETE)
	   @RequestMapping(value="{empno}",method = RequestMethod.DELETE)
	   public ResponseEntity<List<Emp>> delete(@PathVariable("empno") int empno) {
		  List<Emp> list = null;
		   try {
			System.out.println("delete 실행");
			empservice.delete(empno);
			list=empservice.selectAllEmpList();
			return new ResponseEntity<List<Emp>>(list , HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("delete 실패");
			return new ResponseEntity<List<Emp>>(list , HttpStatus.BAD_REQUEST);
		}
	  }
	/*
	 * @RequestMapping(value="view.kosa") public String ViewPage(){
	 * System.out.println("view.kosa"); return "view.jsp 문자열 리턴"; }
	 */
	/*
	 * @RequestMapping(value="view.ajax") public String ViewPage(){ //converter에 의해서
	 * 문자열 전달 System.out.println("view.ajax"); //ModelAndView mv = new
	 * ModelAndView("view.jsp"); return "view.jsp 문자열 리턴"; }
	 * 
	 * @GetMapping("update.ajax") public EmpDto updateform(int empno) { EmpDto emp =
	 * empservice.selectEmp(empno+""); return emp; }
	 * 
	 * @PostMapping("update.ajax") public List<EmpDto> update(EmpDto empdto) {
	 * empservice.updateEmp(empdto); List<EmpDto> list = empservice.getEmpList();
	 * return list; }
	 * 
	 * @PostMapping("insert.ajax") public List<EmpDto> insert(EmpDto empdto) {
	 * empservice.insertEmp(empdto); List<EmpDto> list = empservice.getEmpList();
	 * return list; }
	 * 
	 * @PostMapping("delete.ajax") public List<EmpDto> delete(int empno) {
	 * empservice.deleteEmp(empno+"");; List<EmpDto> list = empservice.getEmpList();
	 * return list; }
	 */
		
	   
	   
}
