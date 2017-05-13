package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Score;

@Repository
public class ScoreDAO extends BaseDao<Score, String> {

	public List<Score> findByClassId(String classId) {
		String sql = "select s.* from score s inner join class_course clc on clc.course_id = s.course_id where clc.class_id = ?";
		return findBySQL(sql, Score.class, classId);
	}

	public List<Score> findByUserId(String userId) {
		String hql = "from Score where users.userId = ?";
		return findByHQL(hql, userId);
	}
}