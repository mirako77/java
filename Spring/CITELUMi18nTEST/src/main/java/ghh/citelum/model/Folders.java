package ghh.citelum.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author FranciscoFilipe
 *
 */

@Entity
@Table(name="FOLDERS")
public class Folders {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String parent;
	private String description;
	private String path;
	private String node_id;
	private String dir;
	private boolean inUse;
	private int is_file;
	private int ordenation;
	
	public int getOrdenation() {
		return ordenation;
	}
	public void setOrdenation(int ordenation) {
		this.ordenation = ordenation;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public boolean isInUse() {
		return inUse;
	}
	public void setInUse(boolean inUse) {
		this.inUse = inUse;
	}
	public String getNode_id() {
		return node_id;
	}
	public void setNode_id(String node_id) {
		this.node_id = node_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
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
	public int getIs_file() {
		return is_file;
	}
	public void setIs_file(int is_file) {
		this.is_file = is_file;
	}
	@Override
	public String toString() {
		return "Folders [id=" + id + ", parent=" + parent + ", description=" + description + ", path=" + path
				+ ", node_id=" + node_id + ", is_file=" + is_file + "]";
	}
	
	

	
	
	

	
}
