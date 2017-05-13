package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.UserClass;
import com.dao.BaseDao;
import com.dao.UserClassDAO;

@Service
public class UserClassService extends BaseServices<UserClass> {

	@Autowired
	private UserClassDAO userClassDao;
	
	@Override
	public BaseDao<UserClass, String> getDao() {
		return userClassDao;
	}

	/**
	 * 通过用户Id查找用户班级对应信息
	 * @param userId
	 * @return
	 */
	public List<UserClass> findByUserId(String userId) {
		return userClassDao.findByUserId(userId);
	}

	/**
	 * 通过班级Id查找用户班级对应信息
	 * @param classId
	 * @return
	 */
	public List<UserClass> findByClassId(String classId) {
		return userClassDao.findByClassId(classId);
	}

}
