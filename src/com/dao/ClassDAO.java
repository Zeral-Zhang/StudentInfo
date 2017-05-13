package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Class;
import com.bean.Grade;

@Repository
public class ClassDAO extends BaseDao<Class, String> {

	public List<Class> findByGradeId(String gradeId) {
		String hql = "from Class where grade.gradeId = ?";
		return findByHQL(hql, gradeId);
	}

	/**
	 * 根据年级和班级名称查询班级
	 * @param className
	 * @param grade
	 * @return
	 */
	public Class findUniqueByClassNameAndGrade(String className, Grade grade) {
		String hql = "from Class where grade.gradeId = ? and className = ?";
		return findByHQL(hql, grade.getGradeId(), className).get(0);
	}
	
}