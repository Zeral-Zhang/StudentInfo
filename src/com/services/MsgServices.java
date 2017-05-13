package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Msg;
import com.dao.BaseDao;
import com.dao.MsgDAO;

@Service
public class MsgServices extends BaseServices<Msg> {
	@Autowired
	private MsgDAO msgDao;

	@Override
	public BaseDao<Msg, String> getDao() {
		return msgDao;
	}

}
