package com.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.ClassCourse;
import com.bean.Course;
import com.dao.BaseDao;
import com.dao.ClassCourseDAO;
import com.dao.CourseDAO;

@Service
public class CourseServices extends BaseServices<Course> {
	@Autowired
	private CourseDAO courseDAO;
	@Autowired
	private ClassCourseDAO classCourseDAO;
	
	@Override
	public BaseDao<Course, String> getDao() {
		return courseDAO;
	}

	/**
	 * 根据课程名查找相似的课程
	 * @param courseName
	 */
	public List<Course> findByCourseNameLike(String courseName) {
		String hql = "from Course where courseName like '%"+courseName+"%'";
		return courseDAO.findByHQL(hql);
	}

	/**
	 * 增加课程并增加之间的关系
	 * @param course
	 */
	public void saveCourseAndRela(Course course, String classId) {
		save(course);
		classCourseDAO.save(new ClassCourse(classId, course.getCourseId()));
	}
	/**
	 * 查询所有课程
	 * @param gradeId
	 * @return
	 */
	public List<Course> findAllCourse() {
		List<Course> course = courseDAO.findAll();
		List<Course> courses = new ArrayList<Course>();
		
		for(Course coursess:course) {
			courses.add(coursess);
		}
		return courses;
	}
}
