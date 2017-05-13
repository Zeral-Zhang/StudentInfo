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
 * UserClass entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="user_class"
    ,schema="dbo"
    ,catalog="school"
)

public class UserClass  implements java.io.Serializable {

    // Fields    
	
	private static final long serialVersionUID = 1L;
	
	private String userClassId;
     private Users users;
     private Class clazz;
     
     private String userId;
     private String classId;


    // Constructors

    /** default constructor */
    public UserClass() {
    }

    
    /** full constructor */
    public UserClass(Users users, Class clazz) {
        this.users = users;
        this.clazz = clazz;
    }
    
   
    public UserClass(String userId, String classId) {
		super();
		this.userId = userId;
		this.classId = classId;
	}


	// Property accessors
    @GenericGenerator(name="generator", strategy="uuid")
    @Id @GeneratedValue(generator="generator")
    
    @Column(name="user_class_id", unique=true, nullable=false, length=32)

    public String getUserClassId() {
        return this.userClassId;
    }
    
    public void setUserClassId(String userClassId) {
        this.userClassId = userClassId;
    }
    
	@ManyToOne(fetch=FetchType.EAGER)
        @JoinColumn(name="user_id", nullable = false, insertable = false, updatable = false)
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    
	@ManyToOne(fetch=FetchType.EAGER)
        @JoinColumn(name="class_id", nullable = false, insertable = false, updatable = false)
    public Class getClazz() {
        return this.clazz;
    }
    
    public void setClazz(Class clazz) {
        this.clazz = clazz;
    }


    @Column(name="user_id")
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Column(name="class_id")
	public String getClassId() {
		return classId;
	}


	public void setClassId(String classId) {
		this.classId = classId;
	}
   
}