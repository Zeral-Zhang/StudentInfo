package com.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Class entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "class", schema = "dbo", catalog = "school")
public class Class implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private String classId;
	private Grade grade;
	private String className;
	private String classDep;
	private String classTeacher;


	private Set<UserClass> userClasses = new HashSet<UserClass>(0);
	private Set<ClassCourse> classCourses = new HashSet<ClassCourse>(0);

	// Constructors

	/** default constructor */
	public Class() {
	}

	/** full constructor */
	public Class(Grade grade, String className, Set<UserClass> userClasses,
			Set<ClassCourse> classCourses) {
		this.grade = grade;
		this.className = className;
		this.userClasses = userClasses;
		this.classCourses = classCourses;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "class_id", unique = true, nullable = false, length = 32)
	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "grade_id", nullable = false)
	public Grade getGrade() {
		return this.grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	@Column(name = "class_dep", length = 32)
	public String getClassDep() {
		return classDep;
	}

	public void setClassDep(String classDep) {
		this.classDep = classDep;
	}
	@Column(name = "class_name", length = 32)
	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "clazz")
	public Set<UserClass> getUserClasses() {
		return this.userClasses;
	}

	public void setUserClasses(Set<UserClass> userClasses) {
		this.userClasses = userClasses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "clazz")
	public Set<ClassCourse> getClassCourses() {
		return this.classCourses;
	}

	public void setClassCourses(Set<ClassCourse> classCourses) {
		this.classCourses = classCourses;
	}

	@Column(name = "class_teacher", length = 32)
	public String getClassTeacher() {
		return classTeacher;
	}

	public void setClassTeacher(String classTeacher) {
		this.classTeacher = classTeacher;
	}

}