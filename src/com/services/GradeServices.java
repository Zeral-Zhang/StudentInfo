package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.bean.Grade;
import com.dao.BaseDao;
import com.dao.GradeDAO;

@Service
public class GradeServices extends BaseServices<Grade> {
	
	@Autowired
	private GradeDAO gradeDao;

	@Override
	public BaseDao<Grade, String> getDao() {
		return gradeDao;
	}
	/**
	 * 增加年级系
	 * @param grade
	 */
	public void saveGrade(Grade grade) {
		gradeDao.save(grade);
	}
	/**
	 * 根据班级名查询
	 * @param gradeName
	 * @return
	 */
	public Grade findByName(String gradeName) {
		Grade grade = new Grade();
		grade.setGradeName(gradeName);
		if(CollectionUtils.isEmpty(findByExample(grade))) {
			return null;
		}
		return findByExample(grade).get(0);
	}

}

