package ghh.citelum.model;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author FranciscoFilipe
 *
 */

@Entity
@Table(name="PROJECTS")
public class Projects {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	private String description;
	private String templateUpdated;
	private int project_status;
	private boolean project_archived;
	private String deadline;	//private String deadline;
	private String country;
	private boolean wizardCompleted;

	@ManyToOne(fetch = FetchType.EAGER)
	private Staff projectManager;

	public Staff getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(Staff projectManager) {
		this.projectManager = projectManager;
	}

	/*
	@ManyToMany(
			mappedBy = "projectsList",
			cascade = {
					CascadeType.MERGE
			}
	)
	*/
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name="staff_projects",
			joinColumns=@JoinColumn(name="project_id", referencedColumnName="ID"),
			inverseJoinColumns=@JoinColumn(name="staff_id", referencedColumnName="ID")
	)
	private List<Staff> staffList;
	//@JsonIgnoreProperties(value = "entiteList")
	//@ManyToMany(mappedBy = "projectsList")

	
	//*	Manipulate deadline
	
	
	public boolean isWizardCompleted() {
		return wizardCompleted;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public void setWizardCompleted(boolean wizardCompleted) {
		this.wizardCompleted = wizardCompleted;
	}
	
	public boolean getProject_archived() {
		return project_archived;
	}

	public void setProject_archived(boolean project_archived) {
		this.project_archived = project_archived;
	}


	public String getTemplateUpdated() {
		return templateUpdated;
	}

	public void setTemplateUpdated(String templateUpdated) {
		this.templateUpdated = templateUpdated;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public int getProject_status() {
		return project_status;
	}

	public void setProject_status(int project_status) {
		this.project_status = project_status;
	}

	public List<Staff> getStaffList() {
		return staffList;
	}

	public void setStaffList(List<Staff> staffList) {
		this.staffList = staffList;
	}
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "Projects [id=" + id + ", title=" + title + ", description=" + description + ", templateUpdated="
				+ templateUpdated + ", project_status=" + project_status + ", project_archived=" + project_archived
				+ ", deadline=" + deadline + ", staffList=" + staffList + "]";
	}
	
	
	
	
	
}
