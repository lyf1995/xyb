package xyb.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.Post;
import xyb.entity.PostPojo;
import xyb.entity.StGrjj;
import xyb.entity.StQzyx;
import xyb.entity.StSchoolInfo;
import xyb.entity.StXmjy;
import xyb.entity.StXnzw;
import xyb.entity.StYynl;
import xyb.entity.StudentInfo;
import xyb.entity.User;
import xyb.service.StudentService;

@Controller
@RequestMapping("/html/Student")
public class StudentControllers {
	@Autowired
	private StudentService studentService;
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	//学生个人信息
	@RequestMapping(value="studentInfo")
	public ModelAndView studentInfo(HttpSession httpSession)
	{
		StudentInfo studentInfo1=(StudentInfo)httpSession.getAttribute("studentInfo");
		ModelAndView mav =new ModelAndView();
		StudentInfo studentInfo=this.studentService.studentInfoById(studentInfo1.getId());
		
		
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String birth =new String();
        if(studentInfo.getBirth()!=null){
        	Date date = new Date(studentInfo.getBirth()* 1000L);
        	birth = simpleDateFormat.format(date);
        }
		mav.addObject("studentInfo",studentInfo);
		mav.addObject("birth",birth);
		mav.addObject("status",httpSession.getAttribute("status"));
		httpSession.removeAttribute("status");
		mav.setViewName("/html/Student/studentInfo");
		return mav;
	}
	//修改学生个人信息
	@RequestMapping(value="editStudentInfo",method = RequestMethod.POST)
	public String editStudentInfo(HttpServletRequest req,HttpSession httpSession) throws ParseException
	{
		StudentInfo studentInfo1=(StudentInfo)httpSession.getAttribute("studentInfo");
		StudentInfo studentInfo=new StudentInfo();
		//照片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		String path = req.getSession().getServletContext().getRealPath("file");
		// 获得文件：     
        MultipartFile file = multipartRequest.getFile("picture");
        String filename=file.getOriginalFilename();
      
        File newfile=new File(path,filename);
        if(newfile.exists()){
        	
    		if(filename==null || "".equals(filename)){      			
    			studentInfo.setPicture(studentInfo1.getPicture());
    			System.out.println(1);
    		}
    		else{
    			studentInfo.setPicture("../../file/"+filename);
    			System.out.println(2);
    		}
        		  	
        }
        else{
        	try {  
                file.transferTo(newfile);  
            } catch (Exception e) {  
                e.printStackTrace();  
            }
            if(filename==null ||"".equals(filename))
            {
            	 studentInfo.setPicture(studentInfo1.getPicture());
            	 System.out.println(5);
            }
            else{
            	studentInfo.setPicture("../../file/"+filename);
            	System.out.println(6);
            }
        }
        
		studentInfo.setRelName(req.getParameter("relName"));
		studentInfo.setSex(req.getParameter("sex"));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String birthSt=req.getParameter("birth");
        Date date = simpleDateFormat.parse(birthSt);
        int birth = (int) (date.getTime()/1000);
        /*System.out.println(birth);*/
        studentInfo.setBirth(birth);
        studentInfo.setTel(req.getParameter("tel"));
        studentInfo.setEmail(req.getParameter("email"));
        studentInfo.setAddress(req.getParameter("address"));
		this.studentService.editStudentInfo(studentInfo,studentInfo1.getId());
		
		httpSession.setAttribute("status", "sucess");
		StudentInfo studentInfo2=this.studentService.studentInfoById(studentInfo1.getId());
		httpSession.setAttribute("studentInfo", studentInfo2);
		return "redirect:/html/Student/studentInfo.html";
	}
	
	//学生学籍信息
	@RequestMapping(value="schoolInfo")
	public ModelAndView schoolInfo(HttpSession httpSession)
	{
		ModelAndView mav=new ModelAndView();
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		StSchoolInfo stSchoolInfo=this.studentService.schoolInfo(studentInfo.getId());
		mav.addObject("stSchoolInfo",stSchoolInfo);
		mav.addObject("status",httpSession.getAttribute("status"));
		httpSession.removeAttribute("status");
		mav.setViewName("/html/Student/schoolInfo");
		return mav;
	}
	
	//修改学生学籍信息
	@RequestMapping(value="editSchoolInfo",method=RequestMethod.POST)
	public String editSchoolInfo(StSchoolInfo stSchoolInfo,HttpSession httpSession)
	{
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		this.studentService.editSchoolInfo(stSchoolInfo, studentInfo.getId());
		httpSession.setAttribute("status", "sucess");
		return "redirect:/html/Student/schoolInfo.html";
	}
	
	//学生简历信息
	@RequestMapping(value="resumeInfo")
	public ModelAndView resumeInfo(HttpSession httpSession)
	{
		ModelAndView mav=new ModelAndView();
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String birth =new String();
        if(studentInfo.getBirth()!=null){
        	Date date = new Date(studentInfo.getBirth()* 1000L);
        	birth = simpleDateFormat.format(date);
        }
        mav.addObject("birth",birth);
		//学籍信息
		StSchoolInfo stSchoolInfo=this.studentService.schoolInfo(studentInfo.getId());
		mav.addObject("stSchoolInfo",stSchoolInfo);
		
		//个人简介
		StGrjj stGrjj=this.studentService.stGrjj(studentInfo.getId());
		mav.addObject("stGrjj",stGrjj);
		
		//求职意向
		StQzyx stQzyx=this.studentService.stQzyx(studentInfo.getId());
		mav.addObject("stQzyx",stQzyx);
		
		//项目经验
		List<StXmjy> stXmjys=this.studentService.stXmjy(studentInfo.getId());
		mav.addObject("stXmjys",stXmjys);
		
		//校内职务
		List<StXnzw> stXnzws=this.studentService.stXnzw(studentInfo.getId());
		mav.addObject("stXnzws",stXnzws);
		
		//语言能力
		List<StYynl> stYynls=this.studentService.stYynl(studentInfo.getId());
		mav.addObject("stYynls",stYynls);
		
		mav.setViewName("/html/Student/resumeInfo");
		return mav;
	}
	
	//学生修改基本信息
	@RequestMapping(value="editJbxx",method=RequestMethod.POST)
	@ResponseBody
	public String editJbxx(HttpServletRequest req,HttpSession httpSession) throws ParseException{
		
		StudentInfo studentInfo1=(StudentInfo)httpSession.getAttribute("studentInfo");
		
		StudentInfo studentInfo=new StudentInfo();
		String picUrl="../../images/defalut.png";
		//照片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		String path = req.getSession().getServletContext().getRealPath("file");
		// 获得文件：     
        MultipartFile file = multipartRequest.getFile("picture");
        String filename=file.getOriginalFilename();
        File newfile=new File(path,filename);
        if(newfile.exists()){
    		if(filename==null || "".equals(filename)){      			
    			studentInfo.setPicture(studentInfo1.getPicture());
    			if(studentInfo1.getPicture()==null ||"".equals(studentInfo1.getPicture())){
    				picUrl="../../images/defalut.png";
    				System.out.println(1);
    			}
    			else{
    				picUrl=studentInfo1.getPicture();
    				System.out.println(2);
    			}
    			
    			
    		}
    		else{
    			studentInfo.setPicture("../../file/"+filename);
    			picUrl="../../file/"+filename;
    			System.out.println(3);
    		}
        }
        else{
        	try {  
                file.transferTo(newfile);  
            } catch (Exception e) {  
                e.printStackTrace();  
            }
            if(filename==null ||"".equals(filename))
            {
            	 studentInfo.setPicture(studentInfo1.getPicture());
            	 picUrl=studentInfo1.getPicture();
            	 System.out.println(4);
            }
            else{
            	studentInfo.setPicture("../../file/"+filename);
            	picUrl="../../file/"+filename;
            	System.out.println(5);
            }
        }
       
       		
		studentInfo.setRelName(req.getParameter("name"));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String birthSt=req.getParameter("birth");
        Date date = simpleDateFormat.parse(birthSt);
        int birth = (int) (date.getTime()/1000);
        /*System.out.println(birth);*/
        studentInfo.setBirth(birth);
        
		studentInfo.setRelName(req.getParameter("name"));
		studentInfo.setSex(req.getParameter("sex"));
		studentInfo.setTel(req.getParameter("tel"));
		studentInfo.setEmail(req.getParameter("email"));
		studentInfo.setAddress(req.getParameter("address"));
		StSchoolInfo stSchoolInfo=new StSchoolInfo();
		stSchoolInfo.setSchool(req.getParameter("school"));
		stSchoolInfo.setMajor(req.getParameter("major"));
		
		this.studentService.editJbxx(studentInfo,stSchoolInfo,studentInfo1.getId());
		StudentInfo studentInfo2=this.studentService.studentInfoById(studentInfo1.getId());
		httpSession.setAttribute("studentInfo", studentInfo2);
		return picUrl;
	}
	
	//学生修改个人简历
	@RequestMapping(value="editGrjj",method=RequestMethod.POST)
	@ResponseBody
	public String editGrjj(StGrjj stGrjj,HttpSession httpSession){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		this.studentService.editGrjj(stGrjj,studentInfo.getId());
		return "";
	}
	
	//学生修改求职意向
	@RequestMapping(value="editQzyx",method=RequestMethod.POST)
	@ResponseBody
	public String editQzyx(StQzyx stQzyx,HttpSession httpSession){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		this.studentService.editQzyx(stQzyx,studentInfo.getId());
		return "";
	}
	
	//学生添加项目经验
	@RequestMapping(value="addXmjy",method=RequestMethod.POST)
	@ResponseBody
	public int addXmjy(StXmjy stXmjy,HttpSession httpSession){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		stXmjy.setStudentInfo(studentInfo);
		int id=this.studentService.addXmjy(stXmjy);
		return id;
	}
	
	//学生修改项目经验
	@RequestMapping(value="editXmjy",method=RequestMethod.POST)
	@ResponseBody
	public String editXmjy(StXmjy stXmjy){
		this.studentService.editXmjy(stXmjy);
		return "";
	}
	
	//学生删除项目经验
	@RequestMapping(value="deleteXmjy",method=RequestMethod.POST)
	@ResponseBody
	public String deleteXmjy(int id){
		this.studentService.deleteXmjy(id);
		return "";
	}
	
	//学生添加校内职务
	@RequestMapping(value="addXnzw",method=RequestMethod.POST)
	@ResponseBody
	public int addXnzw(StXnzw stXnzw,HttpSession httpSession){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		stXnzw.setStudentInfo(studentInfo);
		int id=this.studentService.addXnzw(stXnzw);
		return id;
	}
	
	//学生修改校内职务
	@RequestMapping(value="editXnzw",method=RequestMethod.POST)
	@ResponseBody
	public String editXnzw(StXnzw stXnzw){
		this.studentService.editXnzw(stXnzw);
		return "";
	}
	
	//学生删除校内职务
	@RequestMapping(value="deleteXnzw",method=RequestMethod.POST)
	@ResponseBody
	public String deleteXnzw(int id){
		this.studentService.deleteXnzw(id);
		return "";
	}
	
	//学生添加语言能力
	@RequestMapping(value="addYynl",method=RequestMethod.POST)
	@ResponseBody
	public int addYynl(StYynl stYynl,HttpSession httpSession){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		stYynl.setStudentInfo(studentInfo);
		int id=this.studentService.addYynl(stYynl);
		return id;
	}
	
	//学生修改语言能力
	@RequestMapping(value="editYynl",method=RequestMethod.POST)
	@ResponseBody
	public String editYynl(StYynl stYynl){
		this.studentService.editYynl(stYynl);
		return "";
	}
	
	//学生删除语言能力
	@RequestMapping(value="deleteYynl",method=RequestMethod.POST)
	@ResponseBody
	public String deleteYynl(int id){
		this.studentService.deleteYynl(id);
		return "";
	}
	
	//查看岗位
	@RequestMapping(value="searchPosts",method=RequestMethod.GET)
	public ModelAndView searchPosts(){
		ModelAndView mav=new ModelAndView("/html/Student/searchPosts");
		List<PostPojo> postPojos=this.studentService.searchPosts();
		
		mav.addObject("postPojos",postPojos);
		return mav;
	}
	
	//查看岗位详情
	@RequestMapping(value="searchPostsDetailed",method=RequestMethod.GET)
	public ModelAndView searchPostsDetailed(Integer postId,HttpSession httpSession){
		ModelAndView mav=new ModelAndView("/html/Student/searchPostsDetailed");
		PostPojo postPojo=this.studentService.searchPostsDetailed(postId);
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		User user=this.studentService.getUser(studentInfo.getUsername(),1);
		mav.addObject("postPojo",postPojo);
		mav.addObject("user",user);	
		return mav;
	}
	
	//投递简历
	@RequestMapping(value="postRecume")
	@ResponseBody
	public String postRecume(Integer postId,HttpSession httpSession){
		String status=null;
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		status=this.studentService.postRecume(postId,studentInfo);
		return status;
	}
	
	//查看已经投递的简历
	@RequestMapping(value="hasPost",method=RequestMethod.GET)
	public ModelAndView hasPost(HttpSession httpSession){
		ModelAndView mav =new ModelAndView();
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		List<HasPost> hasPosts=(List<HasPost>)this.studentService.hasPost(studentInfo);
		mav.addObject("hasPosts",hasPosts);
		mav.setViewName("/html/Student/hasPost");
		return mav;
	}
	
	//查看教师推荐
	@RequestMapping(value="teacherRecommend",method=RequestMethod.GET)
	public ModelAndView teacherRecommend(HttpSession httpSession){
		ModelAndView mav=new ModelAndView();
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		List<Post> posts=this.studentService.teacherRecommend(studentInfo);
		mav.addObject("posts",posts);
		mav.setViewName("/html/Student/recPost");
		return mav;
	}
	
	//添加附件
	@RequestMapping(value="addfujian",method=RequestMethod.POST)
	@ResponseBody
	public String addfujian(HttpSession httpSession,HttpServletRequest req){
		StudentInfo studentInfo1=(StudentInfo)httpSession.getAttribute("studentInfo");
		StudentInfo studentInfo=new StudentInfo();
		//照片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		String path = req.getSession().getServletContext().getRealPath("file");
		// 获得文件：     
        MultipartFile file = multipartRequest.getFile("fujian");
        String filename=file.getOriginalFilename();
      
        File newfile=new File(path,filename);
        if(newfile.exists()){
			studentInfo.setFujian("../../file/"+filename);
			studentInfo.setFujianName(filename);
			System.out.println(1);		  	
        }
        else{
        	try {  
                file.transferTo(newfile);  
            } catch (Exception e) {  
                e.printStackTrace();  
            }
            	studentInfo.setFujian("../../file/"+filename);
            	studentInfo.setFujianName(filename);
            	System.out.println(2);
        }
        
        this.studentService.addfujian(studentInfo,studentInfo1.getId());
        StudentInfo studentInfo2=this.studentService.studentInfoById(studentInfo1.getId());
        httpSession.setAttribute("studentInfo", studentInfo2);
		return filename;
	}
	
	//删除附件
	@RequestMapping(value="deleteFujian",method=RequestMethod.GET)
	@ResponseBody
	public void deleteFujian(HttpSession httpSession){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		this.studentService.deleteFujian(studentInfo);
        StudentInfo studentInfo1=this.studentService.studentInfoById(studentInfo.getId());
        httpSession.setAttribute("studentInfo", studentInfo1);
	}
	
	//获取聊天记录
	@RequestMapping(value="getContacts",method=RequestMethod.GET)
	@ResponseBody
	public List<Contact> getContacts(HttpSession httpSession,Integer sendId,Integer receiveId){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		User sendUser=this.studentService.getUser(studentInfo.getUsername(),1);
		CompanyInfo companyInfo=this.studentService.getCompanyInfoById(receiveId);
		User receiveUser=this.studentService.getUser(companyInfo.getUsername(),2);
		List<Contact> contacts=this.studentService.getContacts(sendUser,receiveUser);
		
		return contacts;
		
	}
		
	//添加聊天记录
	@RequestMapping(value="sendContacts",method=RequestMethod.POST)
	@ResponseBody
	public String sendContacts(HttpSession httpSession,Integer sendId,Integer receiveId,String content){
		StudentInfo studentInfo=(StudentInfo)httpSession.getAttribute("studentInfo");
		User sendUser=this.studentService.getUser(studentInfo.getUsername(),1);
		CompanyInfo companyInfo=this.studentService.getCompanyInfoById(receiveId);
		User receiveUser=this.studentService.getUser(companyInfo.getUsername(),2);
		Contact contact=new Contact();
		contact.setContent(content);
		contact.setSendUser(sendUser);
		contact.setReceiveUser(receiveUser);
		this.studentService.sendContacts(contact);
		return null;
	}
}
