package com.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * Msg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "msg", schema = "dbo", catalog = "school")
public class Msg implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private String msgId;
	private String msg;
	private Users users;
	private Date pbDate;

	// Constructors

	/** default constructor */
	public Msg() {
	}

	/** full constructor */
	public Msg(String msg) {
		this.msg = msg;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "msg_id", unique = true, nullable = false, length = 32)
	public String getMsgId() {
		return this.msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	@Column(name = "msg")
	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", nullable = false)
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "pb_date")
	public Date getPbDate() {
		return pbDate;
	}

	public void setPbDate(Date pbDate) {
		this.pbDate = pbDate;
	}

}