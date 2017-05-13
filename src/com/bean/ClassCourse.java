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
 * ClassCourse entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="class_course"
    ,schema="dbo"
    ,catalog="school"
)

public class ClassCourse  implements java.io.Serializable {


    // Fields    

	private static final long serialVersionUID = 1L;
	
	private String classCourseId;
     private Class clazz;
     private Course course;

     private String clazzId;
     private String courseId;

    // Constructors

    /** default constructor */
    public ClassCourse() {
    }

    
    /** full constructor */
    public ClassCourse(Class clazz, Course course) {
        this.clazz = clazz;
        this.course = course;
    }
    
    
	public ClassCourse(String clazzId, String courseId) {
		super();
		this.clazzId = clazzId;
		this.courseId = courseId;
	}


	// Property accessors
    @GenericGenerator(name="generator", strategy="uuid")@Id @GeneratedValue(generator="generator")
    
    @Column(name="class_course_id", unique=true, nullable=false, length=32)

    public String getClassCourseId() {
        return this.classCourseId;
    }
    
    public void setClassCourseId(String classCourseId) {
        this.classCourseId = classCourseId;
    }
    
	@ManyToOne(fetch=FetchType.EAGER)
        @JoinColumn(name="class_id", nullable = false, insertable = false, updatable = false)
    public Class getClazz() {
        return this.clazz;
    }
    
    public void setClazz(Class clazz) {
        this.clazz = clazz;
    }
    
	@ManyToOne(fetch=FetchType.EAGER)
        @JoinColumn(name="course_id", nullable = false, insertable = false, updatable = false)
    public Course getCourse() {
        return this.course;
    }
    
    public void setCourse(Course course) {
        this.course = course;
    }
   

    @Column(name="class_id")
    public String getClazzId() {
		return clazzId;
	}


	public void setClazzId(String clazzId) {
		this.clazzId = clazzId;
	}


	@Column(name="course_id")
	public String getCourseId() {
		return courseId;
	}


	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}






}