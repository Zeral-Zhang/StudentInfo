package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Score;
import com.dao.BaseDao;
import com.dao.ScoreDAO;

@Service
public class ScoresService extends BaseServices<Score> {

	@Autowired
	private ScoreDAO scoreDAO;
	
	@Override
	public BaseDao<Score, String> getDao() {
		return scoreDAO;
	}

	/**
	 * 根据班级id查找班级下所有用户的成绩
	 * @param classId
	 * @return
	 */
	public List<Score> findByClassId(String classId) {
		return scoreDAO.findByClassId(classId);
	}

	/**
	 * 根据用户查询成绩
	 * @param userId
	 * @return
	 */
	public List<Score> findByUserId(String userId) {
		return scoreDAO.findByUserId(userId);
	}

}
