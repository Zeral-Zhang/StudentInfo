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
 * Grade entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "grade", schema = "dbo", catalog = "school")
public class Grade implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	
	private String gradeId;
	private String gradeName;
	private Set<Class> classes = new HashSet<Class>(0);

	// Constructors

	/** default constructor */
	public Grade() {
	}

	/** full constructor */
	public Grade(String gradeName, Set<Class> classes) {
		this.gradeName = gradeName;
		this.classes = classes;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "grade_id", unique = true, nullable = false, length = 32)
	public String getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	@Column(name = "grade_name", length = 32)
	public String getGradeName() {
		return this.gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "grade")
	public Set<Class> getClasses() {
		return this.classes;
	}

	public void setClasses(Set<Class> classes) {
		this.classes = classes;
	}

}