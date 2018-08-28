package ghh.citelum.model;

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author FranciscoFilipe
 *
 */

@Entity
@Table(name="STAFF")
public class Staff {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String country;

	/*
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name="staff_projects",
			joinColumns=@JoinColumn(name="staff_id", referencedColumnName="ID"),
			inverseJoinColumns=@JoinColumn(name="project_id", referencedColumnName="ID")
	)*/
	@ManyToMany(mappedBy = "staffList", fetch = FetchType.EAGER, cascade =
        {
                CascadeType.DETACH
        })
	private List<Projects> projectsList;
	
	private String name;
	private String picture_path;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Permissions permissions;
	
	private String login;
	private String email;
	/*
	@ManyToOne(fetch = FetchType.EAGER)
	private Projects projects;
	*/
	//private String email;
	//private Long phone;
	//private String adress;
	//private String country;
	//private String Skype_id;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Projects> getProjectsList() {
		return projectsList;
	}

	public void setProjectsList(List<Projects> projectsList) {
		this.projectsList = projectsList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPicture_path() {
		return picture_path;
	}

	public void setPicture_path(String picture_path) {
		this.picture_path = picture_path;
	}

	public Permissions getPermissions() {
		return permissions;
	}

	public void setPermissions(Permissions permissions) {
		this.permissions = permissions;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/*
	@Override
	public String toString() {
		return "Staff [id=" + id + ", country=" + country + ", projectsList=" + projectsList + ", name=" + name
				+ ", picture_path=" + picture_path + ", permissions=" + permissions + "]";
	}
*/

	
	

}
