package com.test.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ajax {
	@RequestMapping("test2")
	public void fun1(){
	System.out.println("hello world");
}
	@RequestMapping("ajax")
	public void fun2(HttpServletRequest request){
	String name = request.getParameter("name");  
	
}
}
