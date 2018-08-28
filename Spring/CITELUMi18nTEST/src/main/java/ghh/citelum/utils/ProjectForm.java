package ghh.citelum.utils;

import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//TODO: delete me!
public class ProjectForm {
	@NotNull
	@Size(min=2, max = 255)
	private String projectTitle;
	
	@NotNull
	private String projectDescription;
	
	@NotNull
	private Date projectDeadline;

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public Date getProjectDeadline() {
		return projectDeadline;
	}

	public void setProjectDeadline(Date projectDeadline) {
		this.projectDeadline = projectDeadline;
	}

	@Override
	public String toString() {
		return "ProjectForm [projectTitle=" + projectTitle + ", projectDescription=" + projectDescription
				+ ", projectDeadline=" + projectDeadline + "]";
	}
	

}
