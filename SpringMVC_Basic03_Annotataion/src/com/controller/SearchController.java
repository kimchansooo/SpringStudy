package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	/*
	 1. 전통적인 방법
	 public ModelAndView searchExternal(HttpServletRequest request) {
	 	String id= request.getParameter("id");
	 }
	 
	 2. DTO 객체를 통한 전달 방법(게시판, 회원가입 데이터)
	 public ModelAndView searchExternal(Member Dto member) {
	 	/search/external.do?id=hong&name=김유신&age=100
	 	2.1 DTO 있는 member field 이름이 >>
	 	private String id;
	 	private String name;
	 	
	 }
	 
	 3.	가장 만만한 방법 
	 public ModelAndView searchExternal(String id, String name , int age) {
	 	/search/external.do?id=hong&name=김유신&age=100
	 	 ** 각각의 parameter 에 자동 매핑
	 }
	 
	 4. @RequestParam Annotation 사용하기
	 4.1 유효성 처리
	 4.2 기본값 처리
	 
	 5. REST 방식(비동기 처리) method= GET , POST , PUT , DELETE
	 @PathVariable >> /member/{memberid} >> /member/100
	 
	 100 추출해서 parameter로 사용
 	 */
	@RequestMapping("/search/external.do")
	public ModelAndView searchExternal(@RequestParam(value="query" , defaultValue="kosa") String query ,
									   @RequestParam(value="p" , defaultValue = "10") int p) {
		
		System.out.println("param : " + query);
		System.out.println("param p : " + p);
		
		
		return new ModelAndView("search/external"); //public String searchExternal() view주소
	}
}
