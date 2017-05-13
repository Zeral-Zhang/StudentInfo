package com.bean;

import java.util.HashSet;
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
 * Course entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "course", schema = "dbo", catalog = "school")
public class Course implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private String courseId;
	private String courseName;
	private String courseNum;
	private String courseTime;
	private Set<ClassCourse> classCourses = new HashSet<ClassCourse>(0);
	private Set<Score> scores = new HashSet<Score>(0);

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** full constructor */
	public Course(String courseName, String courseNum,String courseTime,
			Set<ClassCourse> classCourses, Set<Score> scores) {
		this.courseName = courseName;
		this.courseNum = courseNum;
		this.classCourses = classCourses;
		this.scores = scores;
		this.courseTime = courseTime;
	}



	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "course_id", unique = true, nullable = false, length = 32)
	public String getCourseId() {
		return this.courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	@Column(name = "course_name", length = 32)
	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	@Column(name = "course_time", length = 32)
	public String getCourseTime() {
		return courseTime;
	}

	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	@Column(name = "course_num", length = 32)
	public String getCourseNum() {
		return this.courseNum;
	}

	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "course")
	public Set<ClassCourse> getClassCourses() {
		return this.classCourses;
	}

	public void setClassCourses(Set<ClassCourse> classCourses) {
		this.classCourses = classCourses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "course")
	public Set<Score> getScores() {
		return this.scores;
	}

	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}

}