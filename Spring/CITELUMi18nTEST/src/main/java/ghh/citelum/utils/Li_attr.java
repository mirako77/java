package ghh.citelum.utils;

public class Li_attr {

	private String path;
	private String primaryKey;
	private String id;
	private int identity;
	private boolean finished;
	private String dir;
	private boolean copied;
	private boolean newFile;
	private String copiedDir;
	//private String treeLevel;
	//private String listNumber;
	private int treelevel;
	private String listnumber;

	public String getCopiedDir() {
		return copiedDir;
	}
	public void setCopiedDir(String copiedDir) {
		this.copiedDir = copiedDir;
	}
	public boolean isNewFile() {
		return newFile;
	}
	public void setNewFile(boolean newFile) {
		this.newFile = newFile;
	}
	public boolean isCopied() {
		return copied;
	}
	public void setCopied(boolean copied) {
		this.copied = copied;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public boolean isFinished() {
		return finished;
	}
	public void setFinished(boolean finished) {
		this.finished = finished;
	}
	public int getIdentity() {
		return identity;
	}
	public void setIdentity(int identity) {
		this.identity = identity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getPrimaryKey() {
		return primaryKey;
	}
	public void setPrimaryKey(String primaryKey) {
		this.primaryKey = primaryKey;
	}
	public int getTreelevel() {
		return treelevel;
	}
	public void setTreelevel(int treelevel) {
		this.treelevel = treelevel;
	}
	public String getListnumber() {
		return listnumber;
	}
	public void setListnumber(String listnumber) {
		this.listnumber = listnumber;
	}
	
	@Override
	public String toString() {
		return "Li_attr [path=" + path + ", primaryKey=" + primaryKey + ", id=" + id + ", identity=" + identity + "]";
	}

	
}
