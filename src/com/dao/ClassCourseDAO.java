package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.ClassCourse;

@Repository
public class ClassCourseDAO extends BaseDao<ClassCourse, String> {

	public List<ClassCourse> findByClassId(String classId) {
		String hql = "from ClassCourse where clazz.classId = ?";
		return findByHQL(hql, classId);
	}
	
}