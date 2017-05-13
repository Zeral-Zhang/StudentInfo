package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Class;
import com.bean.Grade;
import com.dao.BaseDao;
import com.dao.ClassDAO;

@Service
public class ClassServices extends BaseServices<Class> {
	@Autowired
	private ClassDAO classDAO;
	public Class queryClassById(String ClassId) {
		return classDAO.findById(ClassId);
	}
	
	@Override
	public BaseDao<Class, String> getDao() {
		return classDAO;
	}

	/**
	 * 通过gradeId查询班级集合信息
	 * @param gradeId
	 * @return
	 */
	public List<Class> findByGradeId(String gradeId) {
		return classDAO.findByGradeId(gradeId);
	}
	/**
	 * 根据班级名查找相似的课程
	 * @param courseName
	 */
	public List<Class> findByClassNameLike(String className) {
		String hql = "from Class where className like '%"+className+"%'";
		return classDAO.findByHQL(hql);
	}
	/**
	 * 增加班级并增加之间的关系
	 * @param course
	 */
	public void saveClassAndGrade(Class clazz) {
		save(clazz);
	}

	/**
	 * 根据年级和班级名称查询班级
	 * @param className
	 * @param grade
	 * @return
	 */
	public Class find(String className, Grade grade) {
		return classDAO.findUniqueByClassNameAndGrade(className, grade);
	}

}
