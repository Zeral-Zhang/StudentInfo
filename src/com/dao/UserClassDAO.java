package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.UserClass;

@Repository
public class UserClassDAO extends BaseDao<UserClass, String> {

	/**
	 * 通过用户Id查找用户班级对应信息
	 * @param userId
	 * @return
	 */
	public List<UserClass> findByUserId(String userId) {
		String hql = "from UserClass where users.userId = ?";
		return findByHQL(hql, userId);
	}

	/**
	 * 通过班级Id查找用户班级对应信息
	 * @param classId
	 * @return
	 */
	public List<UserClass> findByClassId(String classId) {
		String hql = "from UserClass where clazz.classId = ?";
		return findByHQL(hql, classId);
	}

	
}