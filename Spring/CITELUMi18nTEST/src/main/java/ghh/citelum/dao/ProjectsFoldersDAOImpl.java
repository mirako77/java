package ghh.citelum.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import ghh.citelum.model.Folders;
import ghh.citelum.model.ProjectsFolders;

@Repository
public class ProjectsFoldersDAOImpl implements ProjectsFoldersDAO {
	
private static final Logger logger = Logger.getLogger(ProjectsFoldersDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addProjectFolder(ProjectsFolders pf) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(pf);
		
		//Logger.info("Project Folder saved successfully, Project Details="+pf);
		
	}

	@Override
	public void updateProjectFolder(ProjectsFolders pf) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(pf);

		logger.info("Project Folder updated successfully, Project Details="+pf);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProjectsFolders> listProjectsFolders() {
		Session session = this.sessionFactory.getCurrentSession();
		
		List<ProjectsFolders> projectsFolders = session.createQuery("from ProjectsFolders order by ORDENATION").list();
		
		for (ProjectsFolders pf : projectsFolders) {

			logger.debug("Project List::"+pf);

		}
		
		return projectsFolders;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProjectsFolders> getListProjectsFoldersByProjectId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//List<ProjectsFolders> projectsFoldersById = session.createQuery("from ProjectsFolders where project = 1").list();
		
		Query query = session.createQuery("from ProjectsFolders where project_id = :ida  order by ORDENATION");
		query.setParameter("ida", id);
		
		List<ProjectsFolders> projectsFoldersById = query.list();
		
		for (ProjectsFolders pf : projectsFoldersById) {

			logger.debug("Project List::"+pf);
		}
		
		return projectsFoldersById;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProjectsFolders> getListProjectsFoldersByStaffId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//List<ProjectsFolders> projectsFoldersById = session.createQuery("from ProjectsFolders where project = 1").list();
		
		Query query = session.createQuery("from ProjectsFolders where staff_id = :ida  order by ID");
		query.setParameter("ida", id);
		
		List<ProjectsFolders> projectsFoldersById = query.list();
		
		for (ProjectsFolders pf : projectsFoldersById) {

			logger.debug("Project List::"+pf);
		}
		
		return projectsFoldersById;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getListDescriptionProjectsFoldersByProjectId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//List<ProjectsFolders> projectsFoldersById = session.createQuery("from ProjectsFolders where project = 1").list();
		
		Query query = session.createQuery("select description from ProjectsFolders where project_id = :ida AND is_file = 1 order by ORDENATION");
		query.setParameter("ida", id);
		
		List<String> projectsFoldersById = query.list();
		
		/*
		for (ProjectsFolders pf : projectsFoldersById) {

			logger.debug("Project List::"+pf);
		}
		*/
		
		
		return projectsFoldersById;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ProjectsFolders getProjectsFoldersByProjectIdAndNodeName(int id, String name) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//List<ProjectsFolders> projectsFoldersById = session.createQuery("from ProjectsFolders where project = 1").list();
		
		Query query = session.createQuery("from ProjectsFolders where project_id = :ida AND nodeid = :iname");
		query.setParameter("ida", id);
		query.setParameter("iname", name);
		
		
		ProjectsFolders pfName = (ProjectsFolders) query.uniqueResult();
		
		/*
		Query query = session.createQuery("from ProjectsFolders where project_id = :ida AND nodeid = :iname");
		query.setParameter("ida", id);
		query.setParameter("iname", name);
		
		
		List<ProjectsFolders> pfName = query.list();
*/
		logger.info("Project loaded::" + pfName);
		
		return pfName;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ProjectsFolders getProjectsFoldersByProjectIdAndDescription(int id, String description) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//List<ProjectsFolders> projectsFoldersById = session.createQuery("from ProjectsFolders where project = 1").list();
		
		Query query = session.createQuery("from ProjectsFolders where project_id = :ida AND description = :description");
		query.setParameter("ida", id);
		query.setParameter("description", description);
		
		
		ProjectsFolders pfName = (ProjectsFolders) query.uniqueResult();
		
		/*
		Query query = session.createQuery("from ProjectsFolders where project_id = :ida AND nodeid = :iname");
		query.setParameter("ida", id);
		query.setParameter("iname", name);
		
		
		List<ProjectsFolders> pfName = query.list();
*/
		logger.info("Project loaded::" + pfName);
		
		return pfName;
	}
	
	
	@Override
	public ProjectsFolders getProjectsFoldersById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		ProjectsFolders pf = (ProjectsFolders) session.load(ProjectsFolders.class, new Integer(id));
		
		logger.info("Project Folder loaded successfully, Project Details="+pf);
		
		return pf;
	}
	
	@Override
	public void removeProjectsFolders(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		ProjectsFolders pf = (ProjectsFolders) session.load(ProjectsFolders.class, new Integer(id));
		
		if ( null != pf) {
			session.delete(pf);
		}
		
		logger.info("Project Folder deleted successfully, Project Details="+pf);
		
	}

	@Override
	public int maxId() {
		Session session = this.sessionFactory.getCurrentSession();
		
		int maxId = (int) session.createCriteria(ProjectsFolders.class).setProjection(Projections.max("id")).uniqueResult();
		
		return maxId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getFileNameAssignedByStaffId(int id, int sid) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//List<ProjectsFolders> projectsFoldersById = session.createQuery("from ProjectsFolders where project = 1").list();
		
		Query query = session.createQuery("select description from ProjectsFolders where project_id = :ida AND staff_id = :idstaff AND is_file = 1");
		query.setParameter("ida", id);
		query.setParameter("idstaff", sid);
		
//		List<ProjectsFolders> fileAssignedByStaffId = query.list();
		

		return query.list();
	}
	


	
}
