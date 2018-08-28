package ghh.citelum.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import ghh.citelum.model.Projects;
import ghh.citelum.model.Staff;

@Repository
public class ProjectsDAOImpl implements ProjectsDAO {
	
	private static final Logger logger = Logger.getLogger(ProjectsDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addProject(Projects p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		
		logger.info("Project saved successfully, Project Details="+p);
		
	}

	@Override
	public void updateProject(Projects p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		
		logger.info("Project updated successfully, Project Details="+p);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Projects> listProjects() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Projects> projectsList = session.createQuery("from Projects order by id").list();
		
		for (Projects p : projectsList) {
			logger.info("Project List::"+p);
		}
		
		return projectsList;
	}
	
	@Override
	public List<Projects> listProjectsByCountry(String country) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Projects WHERE country = :countryName order by ID");
		query.setParameter("countryName", country);
		
		List<Projects> projectListByCountry = query.list();
		
		
		return projectListByCountry;
	}
	
	@Override
	public List<Projects> listProjectsByStaffId(int staffId) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select p from Projects p JOIN p.staffList WHERE staff_id = :staffId");
		query.setParameter("staffId", staffId);
		
		List<Projects> projectsListByStaffId = query.list();
		
		return projectsListByStaffId;
	}
	
	@Override
	public List<Projects> listProjectsByProjectManagerId(int projectManagerId) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Projects WHERE projectManager_id = :projectManagerId order by ID");
		query.setParameter("projectManagerId", projectManagerId);
		
		List<Projects> projectsListByStaffId = query.list();
		
		return projectsListByStaffId;
	}

	@Override
	public Projects getProjectById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Projects p = (Projects) session.load(Projects.class, new Integer(id));
		
		logger.info("Project loaded successfully, Project Details="+p);
		
		return p;
	}

	@Override
	public void removeProject(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Projects p = (Projects) session.load(Projects.class, new Integer(id));
		
		if ( null != p) {
			session.delete(p);
		}
		
		logger.info("Project deleted successfully, Project Details="+p);
		
	}

	@Override
	public int maxId() {
		Session session = this.sessionFactory.getCurrentSession();
		
		int maxId = (int) session.createCriteria(Projects.class).setProjection(Projections.max("id")).uniqueResult();
		
		return maxId;
		
	}

	@Override
	public boolean getArchiveProjectState(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Projects p = (Projects) session.load(Projects.class, new Integer(id));
		
		Query query = session.createQuery("SELECT project_archived FROM Projects WHERE id = :ida"); //to eliminate nulls from the list
		query.setParameter("ida", id);
		
		boolean archive = (boolean) query.uniqueResult();
		

//		System.out.println(archive);
		//Logger.info("Project deleted successfully, Project Details="+p);
		
		return archive;
	
	}
	
	@Override
	public Date getDeadline(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Projects p = (Projects) session.load(Projects.class, new Integer(id));
		
		Query query = session.createQuery("SELECT project_deadline FROM Projects WHERE id = :ida"); //to eliminate nulls from the list
		query.setParameter("ida", id);
		
		Date deadline = (Date) query.uniqueResult();
		
//		LocalDate deadlineJava = deadline.toLocalDate();

//		System.out.println(deadlineJava);
		//Logger.info("Project deleted successfully, Project Details="+p);
		
//		return deadlineJava;
		return deadline;
	
	}

/*	@Override
	public String getStaff(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		

		Query query = session.createQuery("SELECT staff FROM Projects WHERE id = :ida");
		query.setParameter("ida", id);
		
		String a = query.uniqueResult().toString();
		return a;

	}
*/	
}
