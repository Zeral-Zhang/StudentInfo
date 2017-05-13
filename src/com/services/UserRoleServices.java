package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.bean.UserRole;
import com.bean.Users;
import com.contant.RoleConstant;
import com.dao.BaseDao;
import com.dao.UserRoleDAO;

@Service
public class UserRoleServices extends BaseServices<UserRole> {

	@Autowired
	private UserRoleDAO userRoleDAO;
	
	@Override
	public BaseDao<UserRole, String> getDao() {
		return userRoleDAO;
	}
	
	public boolean hasTeacherRole(Users user) {
		boolean flag = false;
		List<UserRole> userRole =  userRoleDAO.findByUsersId(user.getUserId());
		if(!CollectionUtils.isEmpty(userRole)) {
			for(UserRole userrole:userRole) {
				if(userrole.getRole().getRoleName().equals(RoleConstant.TEACHER)) {
					flag = true;
					break;
				}
		}
	}
	return flag;	
	}
	
	public boolean hasStudentRole(Users user) {
		boolean flag = false;
		List<UserRole> userRole =  userRoleDAO.findByUsersId(user.getUserId());
		if(!CollectionUtils.isEmpty(userRole)) {
			for(UserRole userrole:userRole) {
				if(userrole.getRole().getRoleName().equals(RoleConstant.STUDENT)) {
					flag = true;
					break;
				}
			}
		}
		return flag;
	}

}
