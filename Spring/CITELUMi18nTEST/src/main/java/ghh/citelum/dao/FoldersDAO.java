package ghh.citelum.dao;

import java.util.List;

import ghh.citelum.model.Folders;

public interface FoldersDAO {

	public void addFolder(Folders f);
	public void updateFolder(Folders f);
	public List<Folders> listFolders();
	public Folders getFoldersById(int id);
	public void removeFolders(int id);	
	public int maxId();
	public int minId();
	
	
}
