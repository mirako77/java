package ghh.citelum.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.FoldersDAO;
import ghh.citelum.model.Folders;

@Service
public class FoldersServiceImpl implements FoldersService {

	private FoldersDAO foldersDAO;
	
	public void setFoldersDAO(FoldersDAO foldersDAO) {
		this.foldersDAO = foldersDAO;
	}
	
	@Override
	@Transactional
	public void addFolders(Folders f) {
		this.foldersDAO.addFolder(f);
	}

	@Override
	@Transactional
	public void updateFolders(Folders f) {
		this.foldersDAO.updateFolder(f);

	}

	@Override
	@Transactional
	public List<Folders> listFolders() {
		return this.foldersDAO.listFolders();
	}

	@Override
	@Transactional
	public Folders getFolders(int id) {
		return this.foldersDAO.getFoldersById(id);
	}

	@Override
	@Transactional
	public void removeFolders(int id) {
		this.foldersDAO.removeFolders(id);
	}

	@Override
	@Transactional
	public int maxId() {
		return this.foldersDAO.maxId();
	}
	@Override
	@Transactional
	public int minId() {
		return this.foldersDAO.minId();
	}

}
