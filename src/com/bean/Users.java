package com.bean;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "users", schema = "dbo", catalog = "school")
public class Users implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private String userId;
	/**
	 * 账号
	 */
	private String userAccount;
	/**
	 * 密码
	 */
	private String userPasswd;
	/**
	 * 姓名
	 */
	private String userName;
	/**
	 * 电话
	 */
	private String userTel;
	/**
	 * 地址
	 */
	private String userAddress;
	/**
	 * 身份证
	 */
	private String userIdcard;
	/**
	 * 学号
	 */
	private String userCard;
	/**
	 * 性别
	 */
	private String userSex;
	private Set<UserRole> userRoles = new HashSet<UserRole>(0);
	private Set<UserClass> userClasses = new HashSet<UserClass>(0);
	private List<Msg> msgs = new ArrayList<Msg>();
	private Set<Score> scores = new HashSet<Score>(0);

	// Constructors

	/** default constructor */
	public Users() {
	}
	

	/** full constructor */
	public Users(String userAccount, String userPasswd, String userName,
			String userTel, String userAddress, String userIdcard,String userCard,
			String userSex,			Set<UserRole> userRoles, Set<UserClass> userClasses,
			Set<Score> scores) {
		this.userAccount = userAccount;
		this.userPasswd = userPasswd;
		this.userName = userName;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.userIdcard = userIdcard;
		this.userSex = userSex;
		this.userCard = userCard;
		this.userRoles = userRoles;
		this.userClasses = userClasses;
		this.scores = scores;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "user_id", unique = true, nullable = false, length = 32)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "user_account", length = 32)
	public String getUserAccount() {
		return this.userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	@Column(name = "user_passwd", length = 32)
	public String getUserPasswd() {
		return this.userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	@Column(name = "user_name", length = 32)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "user_tel", length = 32)
	public String getUserTel() {
		return this.userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	@Column(name = "user_address", length = 32)
	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	@Column(name = "user_idcard", length = 32)
	public String getUserIdcard() {
		return userIdcard;
	}

	public void setUserIdcard(String userIdcard) {
		this.userIdcard = userIdcard;
	}

	@Column(name = "user_card", length = 32)
	public String getUserCard() {
		return this.userCard;
	}

	public void setUserCard(String userCard) {
		this.userCard = userCard;
	}
	@Column(name = "user_sex", length = 32)
	public String getUserSex() {
		return this.userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<UserRole> getUserRoles() {
		return this.userRoles;
	}

	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<UserClass> getUserClasses() {
		return this.userClasses;
	}

	public void setUserClasses(Set<UserClass> userClasses) {
		this.userClasses = userClasses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Score> getScores() {
		return this.scores;
	}

	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public List<Msg> getMsgs() {
		return msgs;
	}

	public void setMsgs(List<Msg> msgs) {
		this.msgs = msgs;
	}
}