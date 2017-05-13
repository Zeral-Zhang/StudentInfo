package com.controller;

import java.io.IOException;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.Class;
import com.bean.Course;
import com.bean.Grade;
import com.bean.Msg;
import com.bean.UserClass;
import com.bean.Users;
import com.services.ClassServices;
import com.services.CourseServices;
import com.services.GradeServices;
import com.services.MsgServices;
import com.services.UserClassService;
import com.services.UserServices;
import com.util.ExcelUtil;
import com.util.WebUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {
	@Autowired
	private UserServices userServices;
	@Autowired
	private ClassServices classServices;
	@Autowired
	private CourseServices courseService;
	@Autowired
	private UserClassService userClassService;
	@Autowired
	private GradeServices gradeService;
	@Autowired
	private ClassServices classService;
	@Autowired
	private MsgServices msgService;
	
	// 查询学生信息
	@RequestMapping(value = "/student", method = RequestMethod.GET)
	public void queryAllUser(HttpServletRequest request, HttpServletResponse response) {
		List<Users> users = userServices.findStu();
		com.util.WebUtil.sendJSONArrayResponse(users, new String[] { "userRoles", "userClasses", "scores", "msgs" }, response);
	}

	// 跳转查询学生信息页面
	@RequestMapping(value = "/stu", method = RequestMethod.GET)
	public String toqueryStu() {
		return "admin/querystu";
	}

	// 跳转查询班级页面
	@RequestMapping(value = "/class", method = RequestMethod.GET)
	public String queryAllClass() {
		return "admin/queryclass";
	}

	// 查询班级信息
	@RequestMapping(value = "/cls", method = RequestMethod.GET)
	public void queryAllClss(HttpServletRequest request, HttpServletResponse response) {
		List<Class> classes = classServices.findAll();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		for (Class clazz :classes ) {
			jsonObject.put("classDep", clazz.getClassDep());
			jsonObject.put("gradeName", clazz.getGrade().getGradeName());
			jsonObject.put("className", clazz.getClassName());
			jsonObject.put("classTeacher", clazz.getClassTeacher());
			jsonArray.add(jsonObject);
		}
		WebUtil.sendJSONArrayResponse(jsonArray, response);
	}

	@RequestMapping(value = "/courseInfo", method = RequestMethod.GET)
	public String toCourseInfo(Model model) {
		List<Course> courses = courseService.findAll();
		model.addAttribute("courses", courses);
		return "admin/querycourse";
	}

	@RequestMapping(value = "/teacherAdd", method = RequestMethod.GET)
	public String toTeacherAdd() {
		return "admin/teacheradd";
	}

	@RequestMapping(value = "/teacherAdd", method = RequestMethod.POST)
	public String teacherAdd(Users users) {
		userServices.registerTeacher(users);
		return "redirect:/admin/teacherAdd";
	}

	@RequestMapping(value = "/courseAdd", method = RequestMethod.GET)
	public String toCourseAdd(Model model) {
		List<Class> classes = classServices.findAll();
		model.addAttribute("classes", classes);
		return "admin/courseadd";
	}

	// 查询课程
	@RequestMapping(value = "/findCourseByName", method = RequestMethod.POST)
	public void findCourseByName(HttpServletRequest request, HttpServletResponse response) {
		String courseName = request.getParameter("courseName");
		if (StringUtils.isNotBlank(courseName)) {
			List<Course> courses = courseService.findByCourseNameLike(courseName);
			WebUtil.sendJSONArrayResponse(courses, new String[] { "classCourses", "scores" }, response);
		}
	}

	@RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
	public void updateCourse(Course course, HttpServletResponse response) {
		courseService.update(course);
		WebUtil.sendResponse("修改成功", response);
	}

	@RequestMapping(value = "/coursefind", method = RequestMethod.GET)
	public String toCourseFind() {
		return "admin/coursefind";
	}

	// 新增课程
	@RequestMapping(value = "/courseAdd", method = RequestMethod.POST)
	public String courseAdd(Course course, String classId) {
		courseService.saveCourseAndRela(course, classId);
		return "redirect:/admin/courseAdd";
	}
	//跳转查询学生
	@RequestMapping(value = "/tofindStudent", method = RequestMethod.GET)
	public String tofindStudent() {
		return "admin/stufind";
	}

	@RequestMapping(value = "/toStuclassfind", method = RequestMethod.GET)
	public String toStuclassfind(Model model) {
		List<Class> classes = classServices.findAll();
		model.addAttribute("classes", classes);
		return "admin/stuclassfind";
	}

	@RequestMapping(value = "/findClassStudent", method = RequestMethod.POST)
	public String findClassStudent(String classId, Model model) {
		List<Class> classes = classServices.findAll();
		model.addAttribute("classes", classes);
		List<UserClass> userClasses = userClassService.findByClassId(classId);
		model.addAttribute("userClasses", userClasses);
		return "admin/stuclassfind";
	}

	@RequestMapping(value = "/findStudent", method = {RequestMethod.GET, RequestMethod.POST})
	public String findStudent(Users user, Model model) {
		List<Users> students = userServices.findByExample(user);
		model.addAttribute("students", students);
		return "admin/stufind";
	}

	@RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
	public String updateStudent(Users users, RedirectAttributes redirectAttributes) {
		Users user = userServices.findById(users.getUserId());
		user.setUserAddress(users.getUserAddress());
		user.setUserCard(users.getUserCard());
		user.setUserIdcard(users.getUserIdcard());
		user.setUserName(users.getUserName());
		user.setUserTel(users.getUserTel());
		userServices.update(user);
		redirectAttributes.addAttribute("userName", users.getUserName());
		return "redirect:/admin/findStudent";
	}

	// 添加年级
	@RequestMapping(value = "/gradeAdd", method = RequestMethod.GET)
	public String togradeAdd() {
		return "admin/gradeadd";
	}

	@RequestMapping(value = "/gradeAdd", method = RequestMethod.POST)
	public String gradeAdd(Grade grade) {
		gradeService.saveGrade(grade);
		return "redirect:/admin/gradeAdd";
	}

	// 添加班级
	@RequestMapping(value = "/classAdd", method = RequestMethod.GET)
	public String toclassAdd(Model model) {
		List<Grade> grades = gradeService.findAll();
		model.addAttribute("grades", grades);
		return "admin/classadd";
	}

	@RequestMapping(value = "/classAdd", method = RequestMethod.POST)
	public String classAdd(Class clazz) {
		classService.saveClassAndGrade(clazz);
		return "redirect:/admin/classAdd";
	}

	// 查找班级
	@RequestMapping(value = "/classfind", method = RequestMethod.GET)
	public String toClassFind(Model model) {
		List<Grade> grades = gradeService.findAll();
		model.addAttribute("grades", grades);
		return "admin/classfind";
	}

	@RequestMapping(value = "/findClassByName", method = RequestMethod.POST)
	public void findClassByName(HttpServletRequest request, HttpServletResponse response) {
		String className = request.getParameter("className");
		if (StringUtils.isNotBlank(className)) {
			List<Class> clazzs = classService.findByClassNameLike(className);
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			for (Class clazz : clazzs) {
				jsonObject.put("classId", clazz.getClassId());
				jsonObject.put("classDep", clazz.getClassDep());
				jsonObject.put("gradeId", clazz.getGrade().getGradeId());
				jsonObject.put("gradeName", clazz.getGrade().getGradeName());
				jsonObject.put("className", clazz.getClassName());
				jsonObject.put("classTeacher", clazz.getClassTeacher());
				jsonArray.add(jsonObject);
			}
			WebUtil.sendJSONArrayResponse(jsonArray, response);

		}
	}
	//更新班级
	@RequestMapping(value = "/updateClass", method = RequestMethod.POST)
	public String updateClass(Class clazz) {
		classService.update(clazz);
		return "redirect:/admin/classfind";
	}
	// 添加消息
	@RequestMapping(value = "/toMsgAdd", method = RequestMethod.GET)
	public String toMsgAdd() {
		return "admin/msg";
	}
	
	@RequestMapping(value = "/msgAdd", method = RequestMethod.POST)
	public String MsgAdd(Msg msg) {
		try {
			Users user = (Users) WebUtil.getSession().getAttribute("user");
			msg.setUsers(user);
			msg.setPbDate(new Date());
			msgService.save(msg);
			List<Msg> msgs = msgService.findAll();
    		WebUtil.getSession().setAttribute("msgs", msgs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/toMsgAdd";
	}
	
	/**
	 * 批量导入学生数据
	 * @param file
	 * @param response
	 */
	@RequestMapping(value = "/importStudentsByExcel", method = RequestMethod.POST)
	public void importStudentsByExcel(MultipartFile file, HttpServletResponse response) {
		try {
			if (file == null) {
				WebUtil.sendResponse("请上传Excel文件！", response);
				return;
			}
			if (!file.getOriginalFilename().matches(".+\\.(xls|xlsx)")) {
				WebUtil.sendResponse("“" + file.getName() + "”不是标准的Excel文件！", response);
				return;
			}
			List<Map<String, Object>> list = ExcelUtil.parseExcelSingleSheet(
					file.getInputStream(), false);
			userServices.batchSaveStudents(list);
			WebUtil.sendResponse("导入成功！", response);
		} catch (jxl.JXLException e) {
			WebUtil.sendResponse("Excel解析出错，请按模板要求填写！", response);
		} catch (IOException e) {
			WebUtil.sendResponse("Excel解析出错，请按模板要求填写！", response);
		} catch (RuntimeException e) {
			WebUtil.sendResponse(e.getMessage(), response);
		} catch (Exception e) {
			WebUtil.sendResponse("导入失败！请检查数据！", response);
		}
	}
}
