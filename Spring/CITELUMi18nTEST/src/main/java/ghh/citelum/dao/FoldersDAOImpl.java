package ghh.citelum.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import ghh.citelum.model.Folders;

@Repository
public class FoldersDAOImpl implements FoldersDAO {


	private static final Logger logger = Logger.getLogger(FoldersDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addFolder(Folders f) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(f);
		logger.info("Folder saved successfully, Folder Details="+f);

	}

	@Override
	public void updateFolder(Folders f) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(f);
		logger.info("Folder updated successfully, Folder Details="+f);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Folders> listFolders() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Folders> foldersList = session.createQuery("from Folders order by ORDENATION").list();

		for (Folders f : foldersList) {
			logger.debug("Folders List::"+f);
		}

		return foldersList;
	}

	@Override
	public Folders getFoldersById(int id) {
		Session session = this.sessionFactory.getCurrentSession();

		Folders f = (Folders) session.load(Folders.class, new Integer(id));

		logger.info("Folder loaded successfully, Folder Details="+f);

		return null;
	}

	@Override
	public void removeFolders(int id) {
		Session session = this.sessionFactory.getCurrentSession();

		Folders f = (Folders) session.load(Folders.class, new Integer(id));

		if(null !=f) {
			session.delete(f);
		}

		logger.info("Folder deleted successfully, Folder Details="+f);

	}
/*
	@Override
	public int getFoldersMaxId() {
		Session session = this.sessionFactory.getCurrentSession();

		//System.out.println();
        	//int maxId = (int) session.createCriteria(Folders.class).setProjection(Projections.max("id")).uniqueResult();

		return 2;
	}
*/

	@Override
	public int maxId() {
		Session session = this.sessionFactory.getCurrentSession();

		int maxId = (int) session.createCriteria(Folders.class).setProjection(Projections.max("id")).uniqueResult();

		return maxId;
	}

	@Override
	public int minId() {
		Session session = this.sessionFactory.getCurrentSession();

		int minId = (int) session.createCriteria(Folders.class).setProjection(Projections.min("id")).uniqueResult();

		return minId;
	}

}
