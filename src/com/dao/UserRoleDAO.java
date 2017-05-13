package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.UserRole;

@Repository
public class UserRoleDAO extends BaseDao<UserRole, String> {

	/**
	 * 通过用户Id查找用户角色关系
	 * @param userId
	 * @return
	 */
	public List<UserRole> findByUsersId(String userId) {
		String hql = "from UserRole ur where ur.users.userId = ?";
		return findByHQL(hql, userId);
	}

}