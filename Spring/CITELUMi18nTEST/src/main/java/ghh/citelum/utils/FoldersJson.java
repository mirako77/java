package ghh.citelum.utils;

import java.io.Serializable;

public class FoldersJson {

	//private static final long serialVersionUID = 1L;
	
	private String id;
	private String parent;
	private String text;
	private String type;
	private int is_file;
	private State state;
	private String path;
	private Li_attr li_attr;
	
	
	public Li_attr getLi_attr() {
		return li_attr;
	}
	public void setLi_attr(Li_attr li_attr) {
		this.li_attr = li_attr;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public State getState() {
		return state;
	}
	public void setState(State state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getIs_file() {
		return is_file;
	}
	public void setIs_file(int is_file) {
		this.is_file = is_file;
	}

	
	
}
