package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Score entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "score", schema = "dbo", catalog = "school")
public class Score implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private String scoreId;
	private Users users;
	private Course course;
	private String score;
	
	private String userId;
	private String courseId;

	// Constructors

	/** default constructor */
	public Score() {
	}

	
	public Score(String userId, String courseId) {
		super();
		this.userId = userId;
		this.courseId = courseId;
	}


	/** full constructor */
	public Score(Users users, Course course, String score) {
		this.users = users;
		this.course = course;
		this.score = score;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "score_id", unique = true, nullable = false, length = 32)
	public String getScoreId() {
		return this.scoreId;
	}

	public void setScoreId(String scoreId) {
		this.scoreId = scoreId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", nullable = false, insertable = false, updatable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "course_id", nullable = false, insertable = false, updatable = false)
	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Column(name = "score", length = 32)
	public String getScore() {
		return this.score;
	}

	public void setScore(String score) {
		this.score = score;
	}


	@Column(name = "user_id")
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Column(name = "course_id")
	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

}