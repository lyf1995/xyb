package xyb.controller;

import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import xyb.entity.CompanyInfo;
import xyb.entity.SchoolInfo;
import xyb.entity.StudentInfo;
import xyb.entity.User;
import xyb.service.StudentService;
import xyb.service.UserService;
import xyb.util.MailUtil;
import xyb.service.CompanyService;
import xyb.service.SchoolService;

@Controller
public class UserControllers {
	@Autowired
    private MailUtil mailUtil;
	@Autowired
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	private StudentService studentService;
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	@Autowired
	private CompanyService companyService;
	public CompanyService getCompanyService() {
		return companyService;
	}
	public void CompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	@Autowired
	private SchoolService schoolService;
	public SchoolService getSchoolService() {
		return schoolService;
	}
	public void setSchoolService(SchoolService schoolService) {
		this.schoolService = schoolService;
	}
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String username,String password,int type,HttpSession httpSession)
	{
		String url=null;
		if(type==1){
			StudentInfo studentInfo=this.studentService.login(username,password);
			 if(studentInfo==null){
				     int erro=1;
					 /*mav.addObject("erro",erro );
					 mav.setViewName("index");*/
				     url="redirect:/login.html";
			   }
			 else{
				 httpSession.setAttribute("studentInfo", studentInfo);
				 User user=this.userService.getUser(studentInfo.getUsername(),1);	
				 httpSession.setAttribute("user", user);
				 url="redirect:/html/Student/studentInfo.html";
			 }
		}
		if(type==2){
			CompanyInfo companyInfo=this.companyService.login(username,password);
			 if(companyInfo==null){
				     int erro=1;
					 /*mav.addObject("erro",erro );
					 mav.setViewName("index");*/
				     url="redirect:/login.html";
			   }
			 else{
				 httpSession.setAttribute("companyInfo", companyInfo);
				 User user=this.userService.getUser(companyInfo.getUsername(),2);
				 httpSession.setAttribute("user", user);
				 url="redirect:/html/Company/companyInfo.html";
			 }
		}
		if(type==3){
			SchoolInfo schoolInfo=this.schoolService.login(username,password);
			 if(schoolInfo==null){
				     int erro=1;
					 /*mav.addObject("erro",erro );
					 mav.setViewName("index");*/
				     url="redirect:/login.html";
			   }
			 else{
				 httpSession.setAttribute("schoolInfo", schoolInfo);
				 User user=this.userService.getUser(schoolInfo.getUsername(),3);
				 httpSession.setAttribute("user", user);
				 url="redirect:/html/School/schoolInfo.html";
			 }
		}
		return url;
	  }
	
	  
	 /* QQ邮箱发送测试*/
	  @RequestMapping("/mail")
	  @ResponseBody
	  public String Mail(){
		  System.out.println("aa");
		  mailUtil.sendMail("2646926186@qq.com", "a", "b");
		  System.out.println("bb");
		  return "success";
	  }

	
}
