package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.ClassCourse;
import com.bean.Grade;
import com.bean.Score;
import com.bean.UserClass;
import com.bean.Users;
import com.services.ClassCourseService;
import com.services.ScoresService;
import com.services.StudentServices;
import com.services.UserClassService;
import com.services.UserServices;
import com.util.WebUtil;

@Controller
@RequestMapping(value="/student")
public class StudnetController {
	@Autowired
	private StudentServices studentServices;
	@Autowired
	private UserServices userServices;
	@Autowired
	private UserClassService userClassService;
	@Autowired
	private ClassCourseService classCourseService;
	@Autowired
	private ScoresService scoresService;
	
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String findInfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		String UserId = user.getUserId();
		Users users = studentServices.findByUserId(UserId);
		model.addAttribute("user", users);
		return "student/querystu";
	}
	
	@RequestMapping(value="/modpasswd", method = RequestMethod.GET)
	public String modPasswd(HttpServletRequest request) {
		return "student/modpasswd";
	}
	
	@RequestMapping(value="/modps", method = RequestMethod.POST)
	public String modPS(Model model, HttpServletRequest request, Users users) {
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		user.setUserPasswd(users.getUserPasswd());
		userServices.update(user);
		return "redirect:/user/login";
	}	
	
	@RequestMapping(value="/modinfo", method = RequestMethod.GET)
	public String toModiInfo() {
		return "student/updateinfo";
	}	
	
	@RequestMapping(value="/modinfo", method = RequestMethod.POST)
	public String modiInfo(Users users) {
		try {
			Users user = (Users)WebUtil.getSession().getAttribute("user");
			if(null != users && null != user) {
				user.setUserName(users.getUserName());
				user.setUserAccount(users.getUserAccount());
				user.setUserAddress(users.getUserAddress());
				user.setUserIdcard(user.getUserIdcard());
				user.setUserTel(users.getUserTel());
			}
			userServices.update(user);
			return "student/updateinfo";
		} catch (Exception e) {
			return "fail";
		}
	}
	//查询班级
	@RequestMapping(value="/seeclass", method = RequestMethod.GET)
	public String toClass(Model model) {
		Users user = (Users)WebUtil.getSession().getAttribute("user");
		List<UserClass> userClasses = userClassService.findByUserId(user.getUserId());
		if(!CollectionUtils.isEmpty(userClasses)) {
			com.bean.Class clazz = userClasses.get(0).getClazz();
			Grade grade = clazz.getGrade();
			model.addAttribute("clazz", clazz);
			model.addAttribute(grade);
		}
		return "student/seeclass";
	}	
	//查询班级课程
	@RequestMapping(value="/seeclasscour", method = RequestMethod.GET)
	public String toClassCourse(Model model) {
		Users user = (Users)WebUtil.getSession().getAttribute("user");
		List<UserClass> userClasses = userClassService.findByUserId(user.getUserId());
		if(!CollectionUtils.isEmpty(userClasses)) {
			com.bean.Class clazz = userClasses.get(0).getClazz();
			List<ClassCourse> classCourses = classCourseService.findByClassId(clazz.getClassId());
			Grade grade = clazz.getGrade();
			model.addAttribute("clazz", clazz);
			model.addAttribute(grade);
			model.addAttribute("classCourses", classCourses);
		}
		return "student/seeclasscour";
	}
	
	//查询班级课程
	@RequestMapping(value="/seecourse", method = RequestMethod.GET)
	public String toCourse(Model model) {
		Users user = (Users)WebUtil.getSession().getAttribute("user");
		List<Score> scores = scoresService.findByUserId(user.getUserId());
		model.addAttribute("scores", scores);
		return "student/seecourse";
	}
}
