package com.test.controller;


import java.io.IOException;
import java.io.PrintWriter;

import java.io.UnsupportedEncodingException;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.test.dao.ConsultDao;
import com.test.dao.Hos_doctorDao;
import com.test.dao.HospitalDao;
import com.test.dao.Que_answerDao;
import com.test.dao.UserDao;
import com.test.entity.Consult;
import com.test.entity.Hos_doctor;
import com.test.entity.Hospital;
import com.test.entity.Pagedata;
import com.test.entity.Que_answer;
import com.test.entity.User;



@Controller
public class controller {
	Map<Integer, User> users = new HashMap<Integer, User>();
	private User user;
	@Autowired
	private ConsultDao Cdao;
	@Autowired
	private UserDao dao;
	@Autowired
	private Que_answerDao quedao;
	@Autowired
	private Hos_doctorDao docdao;
	@Autowired
	private HospitalDao hosdao; 
@RequestMapping("test")
	public void fun1(){
	System.out.println("hello");
}
@RequestMapping("Login")
public String fun2(String user_name,String user_password,HttpSession session,ModelMap mp,HttpServletRequest request) throws Exception{
	String lng = (String) request.getSession().getAttribute("lng");
	String lat = (String) request.getSession().getAttribute("lat");
user=dao.login(user_name, user_password);
if(user!=null){
	session.setAttribute("user", user);
	 if(lng==null||lat==null){
		 return "redirect:index_before.html";
	 }
	return "redirect:searchall.do";
}else{
	return "login";
}	
}
@RequestMapping("Register")
public String fun3(User user,String password){	
	if(password.equals(user.getUser_password())){
		System.out.println(user.getUser_nike());
		System.out.println(user.getUser_name());
		System.out.println(user.getUser_password());
		dao.register(user);
return "redirect:searchall.do";
	}
return "register";
}
@RequestMapping("Revise")
public String fun4(User user,String password){
	if(password.equals(user.getUser_password())){
		System.out.println(user.getUser_name());
		dao.revise(user);
return "login";
	}
return "revise";
}
@RequestMapping("Question")
public String fun5(Que_answer que){
	Timestamp q = new Timestamp(new Date().getTime());
	que.setQue_time(q);
	quedao.ask(que);
return "index";
}
@RequestMapping("BrowseQue")
public String fun6(ModelMap mp,HttpSession session){
user=(User) session.getAttribute("user");
List<Que_answer> allque=quedao.browseque(user.getUser_id());
mp.addAttribute("allque",allque);
return "showque";
}
@RequestMapping("AnsQue")
public void fun7(Que_answer que,HttpSession session){
Timestamp a = new Timestamp(new Date().getTime());
user=(User) session.getAttribute("user");
System.out.println(user.getUser_id());
que.setQues_answer_id(user.getUser_id());
que.setAns_time(a);
quedao.ans(que);
}
/*健康问答*/
@RequestMapping("BrowseDoc")
public String fun8(ModelMap mp){
List<Que_answer> allanswer=quedao.findall();
List<Hos_doctor> alldoc=docdao.doc();
mp.addAttribute("alldoc",alldoc);
mp.addAttribute("allanswer",allanswer);
return "Health";
}
@RequestMapping("BrowseProject")
public String fun13(ModelMap mp, String ques_depart){
List<Que_answer> allanswer=quedao.browseproject(ques_depart);
List<Hos_doctor> alldoc=docdao.doc();
mp.addAttribute("alldoc",alldoc);
mp.addAttribute("allanswer",allanswer);
mp.addAttribute("ques_depart", ques_depart);
return "Health";
}
@RequestMapping("Doctor")
public String fun9(ModelMap mp,int id){
List<Que_answer> allans=quedao.browseans(id);
mp.addAttribute("allans",allans);
return "doctor";
}
@RequestMapping("Myqa")
public String fun11(ModelMap mp,HttpSession session){
	user=(User) session.getAttribute("user");
	if(user==null){
		return "login";
	}else if(user.getUser_groupid()==1){
		List<Que_answer> unanswer=quedao.browseque(user.getUser_id());
		List<Que_answer> answer=quedao.browseans(user.getUser_id());
		mp.addAttribute("unanswer", unanswer);
		mp.addAttribute("answer", answer);
		return "ask-doc";
	}
		
		List<Que_answer> unanswer=quedao.quebrowse(user.getUser_id());
		List<Que_answer> answer=quedao.ansbrowse(user.getUser_id());
		mp.addAttribute("unanswer", unanswer);
		mp.addAttribute("answer", answer);
		return "ask-pat";
}



@RequestMapping("details")
public String fun12(int id,ModelMap mp){
	 
	Hos_doctor doctor=docdao.onedoc(id);
	List<Que_answer> answer=quedao.browseans(id);
	Hospital hospital=hosdao.hs(doctor.getHos_id());
	mp.addAttribute("hs", hospital);
	mp.addAttribute("answer", answer);
	mp.addAttribute("dc", doctor);
return "xiangxiye";
}

@RequestMapping("searchall")
public String fun2(HttpServletRequest request, ModelMap mp) throws Exception{
Pagedata pagedata = new Pagedata();
 String lng = request.getParameter("lng");
 String lat = request.getParameter("lat");
 System.out.println("lng:"+lng+"lat:"+lat);
 if(lng!=null&lat!=null){
	 request.getSession().setAttribute("lng", lng);
	 request.getSession().setAttribute("lat", lat);
 }else if(request.getSession().getAttribute("lng")!=null){
	 lng = (String) request.getSession().getAttribute("lng");
	 lat = (String) request.getSession().getAttribute("lat");
 }else {
	 return "redirect:index_before.html";
 }
	 
	int size = 5;
	int resultcount;
	int currentpage = (request.getParameter("currentpage")==null)?1:Integer.parseInt(request.getParameter("currentpage"));
	int sqllimitstart  = (currentpage-1)*size;
	List<Hospital> list = hosdao.SearchAll(lng,lat,sqllimitstart);
	resultcount = hosdao.Pagenext(lng,lat);
	pagedata.setResultCount(resultcount);
	System.out.println(pagedata.getResultCount());
	pagedata.setPageindex(currentpage);
	pagedata.setPageCount((resultcount%size==0)?resultcount/size:(resultcount/size+1));
	mp.addAttribute("listall", list);
	mp.addAttribute("pagedata", pagedata);
	System.out.println("resultcount"+resultcount);
	return "homepage";
	 
	
} 


@RequestMapping("searchbyeva")

public String fun3(HttpServletRequest request, ModelMap mp) throws Exception{
	String lng = (String) request.getSession().getAttribute("lng");
	String lat = (String) request.getSession().getAttribute("lat");
Pagedata pagedata = new Pagedata();
request.getParameter("currentpage");
 
int size = 5;
int resultcount;
int currentpage = (request.getParameter("currentpage")==null)?1:Integer.parseInt(request.getParameter("currentpage"));
System.out.println("currentpage"+currentpage);
int sqllimitstart  = (currentpage-1)*size;
System.out.println("sqllimitstart"+sqllimitstart);

List<Hospital> list = hosdao.Searchbyeva(lng,lat,sqllimitstart);
 
resultcount = hosdao.Pagenext(lng,lat);
pagedata.setResultCount(resultcount);
System.out.println(pagedata.getResultCount());
pagedata.setPageindex(currentpage);
pagedata.setPageCount((resultcount%size==0)?resultcount/size:(resultcount/size+1));
mp.addAttribute("listall", list);
mp.addAttribute("pagedata", pagedata);
return "homepage2";
 

} 
/*判断*/
@RequestMapping("Login1")
public ModelAndView doLogin0(User user, HttpServletRequest request) {
	System.out.println(user.getUser_id());
	request.getSession().setAttribute("uid", 110);
	request.getSession().setAttribute("name", 120);
	return new ModelAndView("redirect:talk.do");
}
@RequestMapping("Login2")
public ModelAndView doLogin1(User user, HttpServletRequest request) {
	System.out.println("userid:"+user.getUser_id());
	request.getSession().setAttribute("uid", 120);
	request.getSession().setAttribute("name", 120);
	return new ModelAndView("redirect:talk2.do");
}
//跳转到交谈聊天页面----病人端
	@RequestMapping(value = "talk", method = RequestMethod.GET)
	public ModelAndView talk(String docid,HttpServletRequest request) {
		user=(User)request.getSession().getAttribute("user");
		if(user==null){
			return new ModelAndView("redirect:login.jsp");
		}else{
		System.out.println("userid:"+user.getUser_id());
		request.getSession().setAttribute("uid",user.getUser_id());
		request.getSession().setAttribute("name", user.getUser_nike());
		ModelAndView mv = new ModelAndView("QandA");
		System.out.println("fromuser:"+docid);
		if(docid==null){
			mv.addObject("fromtouser",docid);
			System.out.println("病人1已登录");
		}else{
		mv.addObject("fromtouser", docid);
 
		}
		
		return mv;
	}
	}
	//跳转到交谈聊天页面----医生端
		@RequestMapping(value = "talk2", method = RequestMethod.GET)
		public ModelAndView talk2(String docid,HttpServletRequest request) {
			user=(User)request.getSession().getAttribute("user");
			request.getSession().setAttribute("uid",user.getUser_id());
			request.getSession().setAttribute("name", user.getUser_nike());		 
			//这里需要医生在登录的时候获取医生的id和姓名。	
			System.out.println("医生聊天页面："+user.getUser_id());
			ModelAndView mv = new ModelAndView("QandA2");
				if(docid==null){
					mv.addObject("fromtouser", 000);
					System.out.println("病人1已登录");
				}else{
				mv.addObject("fromtouser", docid);
		 
				}
			
			return mv;
		}
		/* 医师页面获取问题
		 * 参数两个
		 * Text
		 *docid
		 * */
		@RequestMapping(value = "askquestion", method = RequestMethod.POST)
		public void fun10(Que_answer que,HttpSession session){
			user=(User) session.getAttribute("user");
			Timestamp q = new Timestamp(new Date().getTime());
			que.setQue_time(q);
			que.setQues_tittle_id(user.getUser_id());
			quedao.ask(que);
		 
		}
		/* 医师评价获取问题
		 * 参数一个
		 *eva
		 * */
/*		@RequestMapping(value = "doctoreva", method = RequestMethod.POST)
		public void fun11(HttpServletRequest request){
			 
			int eva = (Integer.parseInt(request.getParameter("eva")));
			System.out.println(eva);
		 
		}*/

		/*知识库*/
		@RequestMapping("doctoreva")
		public void fun10(ModelMap mp,HttpServletRequest request){
			Integer uid = (Integer.parseInt(request.getParameter("uid")));
			int ui = (Integer.parseInt(request.getParameter("i")));
			docdao.evaluate(ui,uid);
		}


		@RequestMapping("browseCon")
		public void funCon(HttpServletResponse response,HttpServletRequest request) throws IOException { //疾病知识库查询
			System.out.println("funCon 疾病知识库查询"+request.getParameter("kid"));
			int kid = Integer.parseInt(request.getParameter("kid"));
			Consult allCon = Cdao.browseCon(kid);//con_是点击的id
			 System.out.println(allCon.getId());
			 String jsonStr = JSON.toJSONString(allCon);
			    PrintWriter out = response.getWriter();
			    out.print(jsonStr);
			    out.close();
		}
 		@RequestMapping("searchoneof")
		public String searchone(HttpServletResponse response,HttpServletRequest request,ModelMap mp) throws IOException { //疾病知识库查询
			System.out.println("funCon 疾病知识库查询"+request.getParameter("id"));
			request.setCharacterEncoding("UTF-8");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			int id = Integer.parseInt(request.getParameter("id"));
			Hospital hos= hosdao.Searchone(id);//con_是点击的id
			  
			 mp.addAttribute("hos", hos);
			 return "hospital_message";
		} 
 		@RequestMapping("loginout")
 		public String loginout(HttpServletRequest request){
 			request.getSession().removeAttribute("user");
 		return "login";
 		}

}
