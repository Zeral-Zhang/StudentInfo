package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Class;
import com.bean.ClassCourse;
import com.bean.Course;
import com.bean.Grade;
import com.bean.Score;
import com.bean.UserClass;
import com.bean.Users;
import com.services.ClassCourseService;
import com.services.ClassServices;
import com.services.CourseServices;
import com.services.GradeServices;
import com.services.ScoresService;
import com.services.UserClassService;
import com.services.UserServices;
import com.util.WebUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/teacher")

public class TeacherController {
	@Autowired
	private UserServices userServices;
	@Autowired
	private ClassServices classServices;
	@Autowired
	private CourseServices courseService;
	@Autowired
	private UserClassService userClassService;
	@Autowired
	private ClassCourseService classCourseService;
	@Autowired
	private ScoresService scoreService;
	@Autowired
	private GradeServices gradeService;

	@RequestMapping(value = "/studnet", method = RequestMethod.GET)
	public String queryAllUser(Model model) {
		List<Users> users = userServices.findStu();
		model.addAttribute("users", users);
		return "teacher/querystu";
	}

	// 跳转查询班级页面
	@RequestMapping(value = "/class", method = RequestMethod.GET)
	public String queryAllClass() {
		return "teacher/queryclass";
	}

	// 查询班级信息
	@RequestMapping(value = "/cls", method = RequestMethod.GET)
	public void queryAllClss(HttpServletRequest request, HttpServletResponse response) {
		List<Class> classes = classServices.findAll();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		for (Class clazz : classes) {
			jsonObject.put("classDep", clazz.getClassDep());
			jsonObject.put("gradeName", clazz.getGrade().getGradeName());
			jsonObject.put("className", clazz.getClassName());
			jsonObject.put("classTeacher", clazz.getClassTeacher());
			jsonArray.add(jsonObject);
		}
		WebUtil.sendJSONArrayResponse(jsonArray, response);
	}

	@RequestMapping(value = "/course", method = RequestMethod.GET)
	public String queryAllCourse(Model model) {
		List<Course> courses = courseService.findAll();
		model.addAttribute("courses", courses);
		return "teacher/querycourse";
	}

	@RequestMapping(value = "/toStuCourseManager", method = RequestMethod.GET)
	public String toStuCourseManager(Model model) {
		List<Class> classes = classServices.findAll();
		model.addAttribute("classes", classes);
		return "teacher/stuscoremanager";
	}

	@RequestMapping(value = "/findClassStudentAndScore", method = RequestMethod.GET)
	public String findClassStudentAndScore(String classId, Model model) {
		List<Class> classes = classServices.findAll();
		model.addAttribute("classes", classes);
		List<UserClass> userClasses = userClassService.findByClassId(classId);
		model.addAttribute("userClasses", userClasses);
		List<ClassCourse> classCourses = classCourseService.findByClassId(classId);
		model.addAttribute("classCourses", classCourses);
		List<Score> scores = scoreService.findByClassId(classId);
		Map<String, String> userCourseScore = new HashMap<>();
		for (Score score : scores) {
			userCourseScore.put(score.getUsers().getUserId() + "_" + score.getCourse().getCourseId(), score.getScore());
		}
		model.addAttribute("userCourseScore", userCourseScore);
		model.addAttribute("classId", classId);
		return "teacher/stuscoremanager";
	}

	@RequestMapping(value = "/updateScore", method = RequestMethod.POST)
	public String updateScore(String classId, Score score, RedirectAttributes attributes) {
		scoreService.saveOrUpdate(score);
		attributes.addAttribute("classId", classId);
		return "redirect:/teacher/findClassStudentAndScore";
	}

	@RequestMapping(value = "/coursefind", method = RequestMethod.GET)
	public String toCourseFind() {
		return "teacher/coursefind";
	}

	@RequestMapping(value = "/findCourseByName", method = RequestMethod.POST)
	public String findCourseByName(String courseName, Model model) {
		if (StringUtils.isNotBlank(courseName)) {
			List<Course> courses = courseService.findByCourseNameLike(courseName);
			model.addAttribute("courses", courses);
		}
		return "teacher/coursefind";
	}

	@RequestMapping(value = "/stuCourseAdd", method = RequestMethod.GET)
	public String stuCourseAdd() {
		return "teacher/stucourseadd";
	}
	//跳转查询学生
	@RequestMapping(value = "/tofindStudent", method = RequestMethod.GET)
	public String tofindStudent() {
		return "teacher/stufind";
	}
	@RequestMapping(value = "/findStudent", method = {RequestMethod.GET, RequestMethod.POST})
	public String findStudent(Users user, Model model) {
		List<Users> students = userServices.findByExample(user);
		model.addAttribute("students", students);
		return "teacher/stufind";
	}
	// 查找班级
	@RequestMapping(value = "/classfind", method = RequestMethod.GET)
	public String toClassFind(Model model) {
		List<Grade> grades = gradeService.findAll();
		model.addAttribute("grades", grades);
		return "teacher/classfind";
	}
	//跳转查询学生成绩
	
	@RequestMapping(value = "/tofindStudentCourse", method = RequestMethod.GET)
	public String tofindStudentCourse(Model model) {
		List<Score> scores = scoreService.findAll();
		model.addAttribute("scores", scores);
		return "teacher/stucoursefind";
	}
}
