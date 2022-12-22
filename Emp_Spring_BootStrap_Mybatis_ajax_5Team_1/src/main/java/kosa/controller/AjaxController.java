package kosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosa.vo.EmpDto;
import service.EmpService;

@RestController //@Controller + 함수(@ResponseBody)
public class AjaxController {
	
	@Autowired
	private EmpService empserivce;
	
	@RequestMapping("view.ajax")
	public String ViewPage() {
		System.out.println("view.ajax");
		return "view.ajax 문자열이 반환";
	}
	
	@GetMapping("update.ajax")
	public EmpDto updateform(int empno) {
		EmpDto emp = empserivce.selectEmp(empno+"");
		return emp;
	}
	@PostMapping("update.ajax")
	public List<EmpDto> update(EmpDto empdto) {
		empserivce.updateEmp(empdto);
		List<EmpDto> list = empserivce.getEmpList();
		return list;  
	}
}
