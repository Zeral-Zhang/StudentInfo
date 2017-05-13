package com.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.bean.Grade;
import com.bean.UserClass;
import com.bean.UserRole;
import com.bean.Users;
import com.contant.RoleConstant;
import com.dao.BaseDao;
import com.dao.UserClassDAO;
import com.dao.UserRoleDAO;
import com.dao.UsersDAO;

@Service
public class UserServices extends BaseServices<Users> {
	@Autowired
	private UsersDAO usersDAO;
	@Autowired
	private UserRoleDAO userRoleDAO;
	@Autowired
	private UserClassDAO userClassDAO;
	@Autowired
	private GradeServices gradeServices;
	@Autowired
	private ClassServices classServices;
	/**
	 * 用户登陆，通过用户的账号和密码查找用户；
	 * 如果找到用户，返回用户；
	 * 否则返回null
	 * @param user
	 * @return
	 */
	public Users login(Users user) {
		List<Users> users = usersDAO.findByExample(user);
		if(!CollectionUtils.isEmpty(users)) {
			for(Users user1:users) {
				return user1;
			}
		}
		return null;
	}
	public List<Users> findStu() {
		List<Users> user = usersDAO.findAll();
		List<Users> users = new ArrayList<Users>();
		
		for(Users userss:user) {
			List<UserRole> userRole =  userRoleDAO.findByUsersId(userss.getUserId());
			for(UserRole userrole:userRole) {
				if(userrole.getRole().getRoleName().equals(RoleConstant.STUDENT)) {
					users.add(userss);
				}
			}		
		}
		return users;
	}
	
	/**
	 * 管理员新增学生
	 * @param user
	 */
	public void registerStudent(Users user, String classId) {
		usersDAO.save(user);
		userRoleDAO.save(new UserRole(user.getUserId(), RoleConstant.STUDENT));
		userClassDAO.save(new UserClass(user.getUserId(), classId));
	}
	
	/**
	 * 
	 * 管理员新增教师
	 * @param user
	 */
	public void registerTeacher(Users user) {
		usersDAO.save(user);
		userRoleDAO.save(new UserRole(user.getUserId(), RoleConstant.TEACHER));
	}
	@Override
	public BaseDao<Users, String> getDao() {
		return usersDAO;
	}
	
	/**
	 * 解析Map转成User对象
	 * 
	 * @date 2015-10-16
	 * @param attrs
	 * @return User
	 */
	protected Users parseUser(Map<String, Object> attrs, StringBuffer errorMsg) {
		String userAccount = (String) attrs.get("帐号");
		String userSex = (String) attrs.get("性别");
		String userName = (String) attrs.get("姓名");
		String userPwd = (String) attrs.get("密码");
		String userIdCard = (String) attrs.get("身份证");
		String userTel = (String) attrs.get("手机号");
		String userAddress = (String) attrs.get("地址");
		String userCard = (String) attrs.get("学号");
		
		if (org.apache.commons.lang.StringUtils.isNotBlank(userAccount)) {
			if (!userAccount.matches("^\\w+$")) {
				errorMsg.append("账号只能由数字、26个英文字母或下划线组成！<br />");
				return null;
			}
		} else {
			if (org.apache.commons.lang.StringUtils.isBlank(userIdCard)) {
				errorMsg.append("帐号和身份证号必须填写一项！<br />");
				return null;
			}
		}
		// 如果填写了身份证号，没有填写账号，用身份证号作为账号
		if (!StringUtils.hasLength(userAccount) && StringUtils.hasLength(userAccount)) {
			userAccount = userIdCard;
		}
		if (userName == null || "".equals(userName)) {
			errorMsg.append("帐号为：" + userAccount + " 的用户姓名没有填写！<br />");
			return null;
		}
		if (null == userSex || "".equals(userSex)) {
			userSex = "男";
		}
		if (null == userPwd || "".equals(userPwd)) {
			/*
			 * //throw new BaseException("帐号为：" + account + " 的用户 密码没有填写！");
			 * errorMsg.append("帐号为：" + account + " 的用户 密码没有填写！<br />"); return
			 * null;
			 */
			userPwd = userAccount;
		}
		if (userCard == null || userCard.length() < 1 || userCard.length() > 25) {
			errorMsg.append("帐号为：“" + userAccount + "” 的用户，学号必须为1-25位！<br />");
			return null;
		}
		Users user = new Users();
		user.setUserAccount(userAccount);
		user.setUserName(userName.replaceAll("\\s*", ""));
		user.setUserSex(userSex);
		user.setUserIdcard(userIdCard);
		user.setUserPasswd(userPwd);
		user.setUserCard(userCard);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		return user;
	}
	
	/**
	 * 批量插入学生
	 * @param list
	 */
	public void batchSaveStudents(List<Map<String, Object>> list) {
		StringBuffer errorBuffer = new StringBuffer();
		boolean flag = true;

		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			Users eStudent = parseUser(map, errorBuffer);
			if(eStudent == null) {
				flag = false;
				continue;
			}
			
			if(null == eStudent.getUserAccount()){
				eStudent.setUserAccount(eStudent.getUserIdcard());
			}
			
			String gradeName = (String) map.get("年级名称");
			String className = (String) map.get("班级名称");
			com.bean.Class clazz = null;
			
			if(className!=null&&!"".equals(className)&&gradeName!=null&&!"".equals(gradeName)){
				Grade grade = gradeServices.findByName(gradeName);
				if (grade == null) {
					errorBuffer.append("第"+i+"行系统中不存在年级名称为“" + gradeName + "”的年级<br />");
					flag = false;
					continue;
				}
				try {
                    clazz = classServices.find(className, grade);
				} catch (Exception e) {
					errorBuffer.append("第"+i+"行" + gradeName + "存在多个班级名称相同的班级！<br />");
					flag = false;
					continue;
				}
				if (clazz == null) {
					errorBuffer.append("第"+i+"行" + gradeName + "不存在班级名称为“" + className + "”的班级！<br />");
					flag = false;
					continue;
				}
			}
			if(flag) {
				try {
					registerStudent(eStudent, clazz.getClassId());
				} catch (RuntimeException e) {
					e.printStackTrace();
					throw e;
				} catch (Exception e) {
					throw new RuntimeException("帐号为：" + eStudent.getUserAccount() + " 的用户保存失败！", e);
				}
			} 
		}
		if(!flag) {
			throw new RuntimeException(errorBuffer.toString());
		}
	}
	
}
