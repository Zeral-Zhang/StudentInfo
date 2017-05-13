package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.ClassCourse;
import com.dao.BaseDao;
import com.dao.ClassCourseDAO;

@Service
public class ClassCourseService extends BaseServices<ClassCourse> {

	@Autowired
	private ClassCourseDAO classCourseDAO;
	
	@Override
	public BaseDao<ClassCourse, String> getDao() {
		return classCourseDAO;
	}

	/**
	 * 根据班级id查找班级课程信息
	 * @param classId
	 * @return
	 */
	public List<ClassCourse> findByClassId(String classId) {
		return classCourseDAO.findByClassId(classId);
	}

}
