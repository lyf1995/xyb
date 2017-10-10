package xyb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.PostPojo;
import xyb.entity.Recruit;
import xyb.entity.RecruitPojo;
import xyb.entity.StudentInfo;
import xyb.entity.User;
import xyb.service.CompanyService;

@Controller
@RequestMapping("/html/Company")
public class CompanyControllers {
	@Autowired
	private CompanyService companyService;
	public CompanyService getCompanyService() {
		return companyService;
	}
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	@InitBinder
    public void initBinder(WebDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	//公司信息
	@RequestMapping(value="companyInfo",method=RequestMethod.GET)
	public ModelAndView companyInfo(HttpSession httpSession)
	{
		CompanyInfo companyInfo1=(CompanyInfo)httpSession.getAttribute("companyInfo");
		ModelAndView mav =new ModelAndView();
		CompanyInfo companyInfo=this.companyService.companyInfoById(companyInfo1.getId());
		mav.addObject("companyInfo",companyInfo);
		mav.addObject("status",httpSession.getAttribute("status"));
		httpSession.removeAttribute("status");
		mav.setViewName("/html/Company/companyInfo");
		return mav;
	}
	
	//修改公司信息
	@RequestMapping(value="editCompanyInfo",method = RequestMethod.POST)
	public String editCompanyInfo(HttpServletRequest req,HttpSession httpSession){
		CompanyInfo companyInfo1=(CompanyInfo) httpSession.getAttribute("companyInfo");
		
		CompanyInfo companyInfo=new CompanyInfo();
		companyInfo.setComName(req.getParameter("comName"));
		companyInfo.setComContacts(req.getParameter("comContacts"));
		companyInfo.setContactsSex(req.getParameter("contactsSex"));
		companyInfo.setComIndustry(req.getParameter("comIndustry"));
		companyInfo.setComEmail(req.getParameter("comEmail"));
		companyInfo.setComAddress(req.getParameter("comAddress"));
		companyInfo.setComProfile(req.getParameter("comProfile"));
		//照片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		String path = req.getSession().getServletContext().getRealPath("file");
		// 获得文件：     
        MultipartFile file = multipartRequest.getFile("comLogo");
        String filename=file.getOriginalFilename();
        System.out.println("filename="+filename);
        File newfile=new File(path,filename);
        if(newfile.exists()){
    		if(filename==null || "".equals(filename)){     
    			companyInfo.setComLogo(companyInfo1.getComLogo());
    			System.out.println(1);
    		}
    		else{
    			companyInfo.setComLogo("../../file/"+filename);
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
             	 companyInfo.setComLogo(companyInfo1.getComLogo());
             	 System.out.println(4);
             }
             else{
             	 companyInfo.setComLogo("../../file/"+filename);
             	System.out.println(5);
             }
        }
       
       
        
		this.companyService.editCompanyInfo(companyInfo,companyInfo1.getId());
		httpSession.setAttribute("status", "sucess");
		CompanyInfo companyInfo2=this.companyService.companyInfoById(companyInfo1.getId());
		httpSession.setAttribute("companyInfo", companyInfo2);
		return "redirect:/html/Company/companyInfo.html";
	}
	
	//岗位管理
	@RequestMapping(value="jobManager",method=RequestMethod.GET)
	public ModelAndView jobManager(HttpSession httpSession){
		ModelAndView mav=new ModelAndView("/html/Company/jobManager");
		CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
		List<PostPojo> postPojos=this.companyService.jobManager(companyInfo.getId());
		
		String addStatus=(String) httpSession.getAttribute("addStatus");
		String deleteStatus=(String) httpSession.getAttribute("deleteStatus");
		mav.addObject("postPojos",postPojos);
		mav.addObject("addStatus",addStatus);
		mav.addObject("deleteStatus",deleteStatus);
		httpSession.removeAttribute("addStatus");
		httpSession.removeAttribute("deleteStatus");
		return mav;
	}
	
	//跳转到添加岗位页面
	@RequestMapping(value="addPost",method=RequestMethod.GET)
	public String addPostPage(){
		return "/html/Company/addPost";
	}
	
	//添加岗位
	@RequestMapping(value="addPost",method=RequestMethod.POST)
	public String addPost(Post post,HttpSession httpSession) throws ParseException{
		CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
		post.setCompanyInfo(companyInfo);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String postTimeStr=simpleDateFormat.format(new Date());
		Date date = simpleDateFormat.parse(postTimeStr);
		int postTime = (int) (date.getTime()/1000);
		post.setPostTime(postTime);
		this.companyService.addPost(post);
		httpSession.setAttribute("addStatus", "sucess");
		return "redirect:/html/Company/jobManager.html";
	}
	
	//跳转到修改岗位页面
	@RequestMapping(value="editPost",method=RequestMethod.GET)
	public ModelAndView editPostPage(Integer postId){
		ModelAndView mav=new ModelAndView("/html/Company/editPost");
		Post post=this.companyService.getPostById(postId);
		mav.addObject("post",post);
		return mav;
	}
	
	//修改岗位
	@RequestMapping(value="editPost",method=RequestMethod.POST)
	public ModelAndView editPost(Post editpost,Integer postId,HttpSession httpSession){
		ModelAndView mav=new ModelAndView("/html/Company/editPost");
		this.companyService.editPost(editpost,postId);
		Post post=this.companyService.getPostById(postId);
		mav.addObject("post",post);
		mav.addObject("status","sucess");
		return mav;
	}
	
	//删除岗位
	@RequestMapping(value="deletePost",method=RequestMethod.GET)
	public String deletePost(Integer postId,HttpSession httpSession){
		this.companyService.deletePost(postId);
		httpSession.setAttribute("deleteStatus", "sucess");
		return "redirect:/html/Company/jobManager.html";
	}
	
	//查看校招
	@RequestMapping(value="companyRecruit",method=RequestMethod.GET)
	public ModelAndView companyRecruit(){
		ModelAndView mav=new ModelAndView("/html/Company/companyRecruit");
		List<RecruitPojo> recruitPojos=this.companyService.companyRecruit();
		mav.addObject("recruitPojos",recruitPojos);
		return mav;
	}
	
	//查看应聘
	@RequestMapping(value="lookApply",method=RequestMethod.GET)
	public ModelAndView lookApply(Integer postId){
		ModelAndView mav=new ModelAndView();
		Post post=this.companyService.getPostById(postId);
		List<HasPost> hasPosts=this.companyService.getHasPostById(postId);
		mav.addObject("post",post);
		mav.addObject("hasPosts",hasPosts);
		mav.setViewName("/html/Company/lookApply");
		return mav;
	}
	
	//查看应聘详情
	@RequestMapping(value="lookApplyDetailed",method=RequestMethod.GET)
	public ModelAndView lookApplyDetailed(Integer studentId,Integer postId,HttpSession httpSession){
		ModelAndView mav=new ModelAndView();
		StudentInfo studentInfo=this.companyService.getStudentInfoById(studentId);
		HasPost hasPost=this.companyService.getHasPostByDoubleId(studentId,postId);
		if(hasPost.getStatus().equals("未被查看")){
			this.companyService.postStatus(studentId,postId,"待沟通");
		}
		HasPost nowHasPost=this.companyService.getHasPostByDoubleId(studentId,postId);
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String birth =new String();
        if(studentInfo.getBirth()!=null){
        	Date date = new Date(studentInfo.getBirth()* 1000L);
        	birth = simpleDateFormat.format(date);
        }
        CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
        User user=this.companyService.getUser(companyInfo.getUsername(),2);
        mav.addObject("birth",birth);
		mav.addObject("studentInfo",studentInfo);
		mav.addObject("postId",postId);
		mav.addObject("nowHasPost",nowHasPost);
		mav.addObject("user",user);
		mav.setViewName("/html/Company/lookApplyDetailed");
		return mav;
	}
	
	//设置简历为通知面试或不合适
	@RequestMapping(value="postStatus",method=RequestMethod.GET)
	@ResponseBody
	public HasPost PostStatus(Integer studentId,Integer postId,String postStatus){
		this.companyService.postStatus(studentId, postId, postStatus);
		HasPost hasPost=this.companyService.getHasPostByDoubleId(studentId,postId);
		return hasPost;
	}
	
	//查看校招详情
	@RequestMapping(value="companyRecruitDetailed",method=RequestMethod.GET)
	public ModelAndView companyRecruitDetailed(Integer recruitId,HttpSession httpSession){
		ModelAndView mav=new ModelAndView();
		Recruit recruit=this.companyService.companyRecruitDetailed(recruitId);
		
		
		mav.addObject("recruit",recruit);
		mav.setViewName("/html/Company/companyRecruitDetailed");
		return mav;
	}
	
	//申请校招
	@RequestMapping(value="applyRecruit",method=RequestMethod.GET)
	@ResponseBody
	public String applyRecruit(Integer recruitId,HttpSession httpSession){
		String status=null;
		CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
		status=this.companyService.applyRecruit(recruitId,companyInfo);
		return status;
	}
	
	//查看已经申请的校招
	@RequestMapping(value="hasApply",method=RequestMethod.GET)
	public ModelAndView hasApply(HttpSession httpSession){
		ModelAndView mav =new ModelAndView();
		CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
		List<HasRecruit> hasRecruits=this.companyService.hasApply(companyInfo);
		mav.addObject("hasRecruits",hasRecruits);
		mav.setViewName("/html/Company/hasApply");;
		return mav;
	}
	
	//下载附件
	@RequestMapping(value="downloadFujian",method=RequestMethod.GET)
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		String filename=request.getParameter("filename");
		
		String path = request.getSession().getServletContext().getRealPath("file");
		File file = new File(path,filename);
		String fileName=new String(file.getName().getBytes("utf-8"),"iso-8859-1");
	    byte[] body = null;
	    @SuppressWarnings("resource")
		InputStream is = new FileInputStream(file);
	    body = new byte[is.available()];
	    is.read(body);
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Disposition", "attchement;filename=" + fileName);
	    HttpStatus statusCode = HttpStatus.OK;
	    ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
	    return entity;
	}
	
	//获取聊天记录
	@RequestMapping(value="getContacts",method=RequestMethod.GET)
	@ResponseBody
	public List<Contact> getContacts(HttpSession httpSession,Integer sendId,Integer receiveId){
		CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
		User sendUser=this.companyService.getUser(companyInfo.getUsername(),2);
		StudentInfo studentInfo=this.companyService.getStudentInfoById(receiveId);
		User receiveUser=this.companyService.getUser(studentInfo.getUsername(),1);
		List<Contact> contacts=this.companyService.getContacts(sendUser,receiveUser);
		return contacts;
		
	}
	
	//添加聊天记录
	@RequestMapping(value="sendContacts",method=RequestMethod.POST)
	@ResponseBody
	public String sendContacts(HttpSession httpSession,Integer sendId,Integer receiveId,String content){
		CompanyInfo companyInfo=(CompanyInfo)httpSession.getAttribute("companyInfo");
		User sendUser=this.companyService.getUser(companyInfo.getUsername(),2);
		StudentInfo studentInfo=this.companyService.getStudentInfoById(receiveId);
		User receiveUser=this.companyService.getUser(studentInfo.getUsername(),1);
		Contact contact=new Contact();
		contact.setContent(content);
		contact.setSendUser(sendUser);
		contact.setReceiveUser(receiveUser);
		this.companyService.sendContacts(contact);
		return null;
	}
   
}
