package ghh.citelum.service;

import java.util.List;

import ghh.citelum.model.Folders;
import ghh.citelum.model.ProjectsFolders;

public interface FoldersService {
	
	public void addFolders(Folders f);
	public void updateFolders(Folders f);
	public List<Folders> listFolders();
	public Folders getFolders(int id);
	public void removeFolders(int id);
	public int maxId();
	public int minId();

}
