package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Users;
import com.dao.UsersDAO;

@Service
public class StudentServices {
	@Autowired
	private UsersDAO usersDAO;
	public Users findByUserId(String userID) {
		return usersDAO.findById(userID);
	}
}
