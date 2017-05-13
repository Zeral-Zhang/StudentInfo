package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Class;
import com.bean.Grade;
import com.bean.Users;
import com.services.ClassServices;
import com.services.GradeServices;
import com.services.UserServices;
import com.util.WebUtil;

@Controller
@RequestMapping(value="/admin")
public class RegisterController {
	
	@Autowired
	private UserServices userServices;
	
	@Autowired
	private ClassServices classServices;
	
	@Autowired
	private GradeServices gradeServices;
	
	/**
	 * 管理员到新增页面
	 * @return
	 */
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String toRegister() {
		return "admin/register";
	}
	
	/**
	 * 管理员到新增学生页面
	 * @return
	 */
	@RequestMapping(value="/register/student", method = RequestMethod.GET)
	public String toRegisterStudent(Model model) {
		List<Grade> grades = gradeServices.findAll();
		model.addAttribute("grades", grades);
		if(!CollectionUtils.isEmpty(grades)) {
			List<Class> classes = classServices.findByGradeId(grades.get(0).getGradeId());
			model.addAttribute("classes", classes);
		}
		return "admin/register";
	}
	
	/**
	 * 管理员到新增学生页面
	 * @return
	 */
	@RequestMapping(value="/register/gradeClasses/{gradeId}", method = RequestMethod.GET)
	public void getGradeClasses(HttpServletResponse response, @PathVariable String gradeId) {
		List<Class> classes = classServices.findByGradeId(gradeId);
		WebUtil.sendJSONArrayResponse(classes, new String[] {"userClasses", "classCourses", "grade"}, response);
	}
	
	
	/**
	 * 管理员新增学生
	 * @return
	 */
	@RequestMapping(value="/register/student", method = RequestMethod.POST)
	public String registerStudent(Users user, String classId) {
		userServices.registerStudent(user, classId);
		return "redirect:/admin/register/student";
	}
	
	/**
	 * 管理员新增老师
	 * @return
	 */
	@RequestMapping(value="/register/teacher", method = RequestMethod.GET)
	public String toRegisterTeacher(Users user) {
		userServices.registerTeacher(user);
		return "admin/register";
	}
	
}
