package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dto.EmpDto;
import service.EmpService;

@RestController   //@Controller + @ResponseBody
public class AjaxRestController {

	@Autowired
	private EmpService empservice;
	
	@RequestMapping(value="restcon.ajax")
	public List<EmpDto> ajaxResponseBody(){
	
		List<EmpDto> list = empservice.getEmpList();
		return list;  
	}
	
	
	@RequestMapping(value="view.ajax")
	public String ViewPage(){   //converter에 의해서 문자열 전달
		System.out.println("view.ajax");
		//ModelAndView mv = new ModelAndView("view.jsp"); 
		return "view.jsp 문자열 리턴";
	}
	@GetMapping("update.ajax")
	public EmpDto updateform(int empno) {
		EmpDto emp = empservice.selectEmp(empno+"");
		return emp;  
	}
	
	@PostMapping("update.ajax")
	public List<EmpDto> update(EmpDto empdto) {
		empservice.updateEmp(empdto);
		List<EmpDto> list = empservice.getEmpList();
		return list;  
	}
	
	@PostMapping("insert.ajax")
	public List<EmpDto> insert(EmpDto empdto) {
		empservice.insertEmp(empdto);
		List<EmpDto> list = empservice.getEmpList();
		return list;  
	}
	
	@PostMapping("delete.ajax")
	public List<EmpDto> delete(int empno) {
		empservice.deleteEmp(empno+"");;
		List<EmpDto> list = empservice.getEmpList();
		return list;  
	}
	
}
