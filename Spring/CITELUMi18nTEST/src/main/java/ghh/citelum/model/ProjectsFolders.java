package ghh.citelum.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PROJECTS_FOLDERS")
public class ProjectsFolders {
	/*
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_client", insertable = true, updatable = true)
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private Client client;
	*/
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Projects project;

	@ManyToOne(fetch = FetchType.LAZY)
	private Staff staff;
	
	private String nodeId;
	private String parent;
	private int is_file;	
	private String description;
	private String path;
	private boolean inUse;				//Each time project preview is opened, this variable is set to false. Then, on saving, this is set to true.
	private boolean finished;			//When a contributor finish a task, this variable is set to true.
	private int ordenation;
	private int treeLevel;
	private String listnumber;
	
	public boolean isFinished() {
		return finished;
	}
	public void setFinished(boolean finished) {
		this.finished = finished;
	}
	public boolean isInUse() {
		return inUse;
	}
	public void setInUse(boolean inUse) {
		this.inUse = inUse;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Projects getProject() {
		return project;
	}
	public void setProject(Projects project) {
		this.project = project;
	}
	public String getNodeId() {
		return nodeId;
	}
	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parents) {
		this.parent = parents;
	}
	public int getIs_file() {
		return is_file;
	}
	public void setIs_file(int is_file) {
		this.is_file = is_file;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getTreeLevel() {
		return treeLevel;
	}
	public void setTreeLevel(int treeLevel) {
		this.treeLevel = treeLevel;
	}
	public String getListnumber() {
		return listnumber;
	}
	public void setListnumber(String listnumber) {
		this.listnumber = listnumber;
	}
	public int getOrdenation() {
		return ordenation;
	}
	public void setOrdenation(int ordenation) {
		this.ordenation = ordenation;
	}
	@Override
	public String toString() {
		return "ProjectsFolders [id=" + id + ", project=" + project + ", staff=" + staff + ", nodeId=" + nodeId
				+ ", parent=" + parent + ", is_file=" + is_file + ", description=" + description + ", path=" + path
				+ ", inUse=" + inUse + ", finished=" + finished + ", ordenation=" + ordenation + "]";
	}

	
	
}
