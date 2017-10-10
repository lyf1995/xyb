package xyb.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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
import xyb.entity.HasRecruit;
import xyb.entity.PostPojo;
import xyb.entity.Recruit;
import xyb.entity.RecruitPojo;
import xyb.entity.SchoolInfo;
import xyb.service.SchoolService;

@Controller
@RequestMapping("/html/School")
public class SchoolControllers {
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
	
	//学校信息
	@RequestMapping(value="schoolInfo")
	public ModelAndView schoolInfo(HttpSession httpSession)
	{
		ModelAndView mav =new ModelAndView();
		SchoolInfo schoolInfo1=(SchoolInfo)httpSession.getAttribute("schoolInfo");
		SchoolInfo schoolInfo=this.schoolService.schoolInfoById(schoolInfo1.getId());
		mav.addObject("schoolInfo",schoolInfo);
		mav.addObject("status",httpSession.getAttribute("status"));
		httpSession.removeAttribute("status");
		mav.setViewName("/html/School/schoolInfo");
		return mav;
	}
	
	//修改学校信息
	@RequestMapping(value="editSchoolInfo",method = RequestMethod.POST)
	public String editSchoolInfo(HttpServletRequest req,HttpSession httpSession){
		SchoolInfo schoolInfo1=(SchoolInfo) httpSession.getAttribute("schoolInfo");
		System.out.println(schoolInfo1.getSchLogo());
		SchoolInfo schoolInfo=new SchoolInfo();
		schoolInfo.setSchName(req.getParameter("schName"));
		schoolInfo.setSchContacts(req.getParameter("schContacts"));
		schoolInfo.setContactsSex(req.getParameter("contactsSex"));
		schoolInfo.setSchEmail(req.getParameter("schEmail"));
		schoolInfo.setSchAddress(req.getParameter("schAddress"));
		schoolInfo.setSchProfile(req.getParameter("schProfile"));
		//照片
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		String path = req.getSession().getServletContext().getRealPath("file");
		// 获得文件：     
        MultipartFile file = multipartRequest.getFile("schLogo");
        String filename=file.getOriginalFilename();
        File newfile=new File(path,filename);
        if(newfile.exists()){
    		if(filename==null || "".equals(filename)){     
    			schoolInfo.setSchLogo(schoolInfo1.getSchLogo());
    			
    			System.out.println(1);
    		}
    		else{
    			schoolInfo.setSchLogo("../../file/"+filename);
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
        		 schoolInfo.setSchLogo(schoolInfo1.getSchLogo());
             	 System.out.println(3);
             }
             else{
            	 schoolInfo.setSchLogo("../../file/"+filename);
             	System.out.println(4);
             }
        }
        
        
        
		this.schoolService.editSchoolInfo(schoolInfo,schoolInfo1.getId());
		httpSession.setAttribute("status", "success");
		SchoolInfo schoolInfo2=this.schoolService.schoolInfoById(schoolInfo1.getId());
		httpSession.setAttribute("schoolInfo", schoolInfo2);
		return "redirect:/html/School/schoolInfo.html";
	}
	
	//我的校招
	@RequestMapping(value="schoolRecruit",method = RequestMethod.GET)
	public ModelAndView schoolRecruit(HttpSession httpSession){
		SchoolInfo schoolInfo=(SchoolInfo)httpSession.getAttribute("schoolInfo");
		ModelAndView mav=new ModelAndView("/html/School/schoolRecruit");
		List<RecruitPojo> recruitPojos=this.schoolService.schoolRecruit(schoolInfo.getId());
		
		mav.addObject("recruitPojos",recruitPojos);
		mav.addObject("addStatus",httpSession.getAttribute("addStatus"));
		httpSession.removeAttribute("addStatus");
		
		return mav;
	}
	
	//跳转到到添加校招界面
	@RequestMapping(value="addRecruit",method=RequestMethod.GET)
	public String addRecruitPage(){
		return "/html/School/addRecruit";
	}
	
	//添加校招
	@RequestMapping(value="addRecruit",method=RequestMethod.POST)
	public String addRecruit(RecruitPojo recruitPojo,HttpSession httpSession) throws ParseException{
		SchoolInfo schoolInfo=(SchoolInfo)httpSession.getAttribute("schoolInfo");
		Recruit recruit=new Recruit();
		recruit.setSchoolInfo(schoolInfo);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String releaseTimeStr=simpleDateFormat.format(new Date());
		//发布时间
		Date date = simpleDateFormat.parse(releaseTimeStr);
		int releaseTime = (int) (date.getTime()/1000);
		recruitPojo.setReleaseTime(releaseTime);
		//校招开始时间
		String startTimeStr=recruitPojo.getStartTimeStr();
		Date date1 = simpleDateFormat.parse(startTimeStr);
		int startTime = (int) (date1.getTime()/1000);
		recruitPojo.setStartTime(startTime);
		//校招结束时间
		String endTimeStr=recruitPojo.getEndTimeStr();
		Date date2 = simpleDateFormat.parse(endTimeStr);
		int endTime = (int) (date2.getTime()/1000);
		recruitPojo.setEndTime(endTime);	
		BeanUtils.copyProperties(recruitPojo,recruit);
		
		this.schoolService.addRecruit(recruit);
		httpSession.setAttribute("addStatus","sucess");
		return "redirect:/html/School/schoolRecruit.html";
	}
	
	//跳转到修改校招界面
	@RequestMapping(value="editRecruit",method=RequestMethod.GET)
	public ModelAndView editRecruitPage(Integer recruitId){
		ModelAndView mav=new ModelAndView();
		RecruitPojo recruitPojo=this.schoolService.getRecruitById(recruitId);
		mav.addObject("recruitPojo",recruitPojo);
		mav.setViewName("/html/School/editRecruit");
		return mav;
	}
	
	//修改校招
	@RequestMapping(value="editRecruit",method=RequestMethod.POST)
	public ModelAndView editRecruit(RecruitPojo recruitPojo,Integer recruitId,HttpSession httpSession) throws ParseException{
		ModelAndView mav=new ModelAndView();
		this.schoolService.editRecruit(recruitPojo,recruitId);
		RecruitPojo recruitPojo1=this.schoolService.getRecruitById(recruitId);
		mav.addObject("recruitPojo",recruitPojo1);
		mav.addObject("editStatus","sucess");
		mav.setViewName("/html/School/editRecruit");
		return mav;
	}
	
	//删除校招
	@RequestMapping(value="deleteRecruit",method=RequestMethod.GET)
	public String deleteRecruit(Integer recruitId,HttpSession httpSession){
		this.schoolService.deleteRecruit(recruitId);
		httpSession.setAttribute("deleteStatus", "sucess");
		return "redirect:/html/School/schoolRecruit.html";
	}
	
	//查看岗位
	@RequestMapping(value="searchPost",method=RequestMethod.GET)
	public ModelAndView searchPost(){
		ModelAndView mav=new ModelAndView("/html/School/searchPost");
		List<PostPojo> postPojos=this.schoolService.searchPost();
		mav.addObject("postPojos",postPojos);
		return mav;
	}
	
	//查看申请
	@RequestMapping(value="lookApply",method=RequestMethod.GET)
	public ModelAndView lookApply(Integer recruitId){
		ModelAndView mav=new ModelAndView();
		RecruitPojo recruitPojo=this.schoolService.getRecruitById(recruitId);
		List<HasRecruit> hasRecruits=this.schoolService.getHasRecruitById(recruitId);
		mav.addObject("recruitPojo",recruitPojo);
		mav.addObject("hasRecruits",hasRecruits);
		mav.setViewName("/html/School/lookApply");
		return mav;
	}
	
	//查看公司详情
	@RequestMapping(value="lookApplyDetailed",method=RequestMethod.GET)
	public ModelAndView lookApplyDetailed(Integer companyInfoId,Integer recruitId,HttpSession httpSession){
		ModelAndView mav=new ModelAndView();
		CompanyInfo companyInfo=this.schoolService.getCompanyInfoById(companyInfoId);
		HasRecruit hasRecruit=this.schoolService.getHasRecruitByDoubleId(companyInfoId,recruitId);
		if(hasRecruit.getStatus().equals("未被查看")){
			this.schoolService.recruitStatus(companyInfoId,recruitId,"待沟通");
		}
		HasRecruit nowHasRecruit=this.schoolService.getHasRecruitByDoubleId(companyInfoId,recruitId);
		
		mav.addObject("companyInfo",companyInfo);
		mav.addObject("recruitId",recruitId);
		mav.addObject("nowHasRecruit",nowHasRecruit);

		mav.setViewName("/html/School/lookApplyDetailed");
		return mav;
	}
	
	//设置校招为同意对接或不合适
	@RequestMapping(value="recruitStatus",method=RequestMethod.GET)
	@ResponseBody
	public HasRecruit hasRecruit(Integer companyId,Integer recruitId,String recruitStatus){
		this.schoolService.recruitStatus(companyId, recruitId, recruitStatus);
		HasRecruit hasRecruit=this.schoolService.getHasRecruitByDoubleId(companyId,recruitId);
		return hasRecruit;
	}

	//查看岗位详情
	@RequestMapping(value="searchPostDetailed",method=RequestMethod.GET)
	public ModelAndView searchPostsDetailed(Integer postId,HttpSession httpSession){
		ModelAndView mav=new ModelAndView("/html/School/searchPostDetailed");
		PostPojo postPojo=this.schoolService.searchPostsDetailed(postId);
		
		mav.addObject("postPojo",postPojo);
		return mav;
	}
	
	//推荐岗位
	@RequestMapping(value="recommendPost",method=RequestMethod.GET)
	@ResponseBody
	public String recommendPost(Integer postId,HttpSession httpSession){
		SchoolInfo schoolInfo=(SchoolInfo)httpSession.getAttribute("schoolInfo");
		String status=null;
		status=this.schoolService.recommendPost(postId,schoolInfo);
		return status;
	}
}
