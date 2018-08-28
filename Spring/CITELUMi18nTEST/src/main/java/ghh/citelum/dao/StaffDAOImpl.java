package ghh.citelum.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.model.Staff;


@Repository
public class StaffDAOImpl implements StaffDAO {

	private static final Logger logger = Logger.getLogger(StaffDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	@Override
	public void addStaff(Staff p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Staff Member saved successfully, Staff Member Details=" + p);
	}
	
	@Override
	public void updateStaff(Staff p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Staff Member updates successfully, Person Details="+p);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Staff> listStaff() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Staff> staffList = session.createQuery("from Staff ORDER by id").list();
		
		for (Staff s : staffList) {
			logger.info("Staff List::"+s);
		}
		
		return staffList;
		
	}
	
	@Override
	public Staff getStaffById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Staff p = (Staff) session.load(Staff.class, new Integer(id));
		
		logger.info("Staff Member loaded successfully, Person details="+p);
		
		return p;

	}
	
	@Override
	public Staff getStaffByName(String name) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Staff.class);
		Staff staffDatabase = (Staff) criteria.add(Restrictions.eq("name", name))
		                             .uniqueResult();
		
		logger.info("Staff Member loaded successfully, Person details=" + staffDatabase);

		return staffDatabase;

	}
	
	@Override
	public Staff getStaffByLogin(String login) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Staff.class);
		Staff staffDatabase = (Staff) criteria.add(Restrictions.eq("login", login))
		                             .uniqueResult();
		
		logger.info("Staff Member loaded successfully, Person details=" + staffDatabase);

		return staffDatabase;
	}
	
	@Override
	public void removeStaff(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Staff p = (Staff) session.load(Staff.class, new Integer(id));
		
		if(null !=p) {
			session.delete(p);
			
		}
		
		logger.info("Staff Member deleted successfully, person details="+p);
		
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getStaffListByProjectId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("SELECT DISTINCT staff.id FROM ProjectsFolders PF WHERE project_id = :ida AND staff_id > 0 "); //to eliminate nulls from the list
		query.setParameter("ida", id);
		
		
	/*	for (Staff staff : staffIdByProjectId) {
			Logger.info("Staff List::"+staff);
		}*/
		return query.list();
		
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Staff> listStaffByPermissionId(int permissionId) {
		Session session = this.sessionFactory.getCurrentSession();
		
		
		Query query = session.createQuery("from Staff WHERE permissions_id = :ida ORDER by id");
		query.setParameter("ida", permissionId);
		
		List<Staff> staffList = query.list();
		
		for (Staff s : staffList) {
			logger.info("Staff List::"+s);
		}
		
		return staffList;
		
	}
	
	
/*	@Override
	public Staff getProjectManagerByProjectId(int id) {
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session.createQuery("SELECT staff_id FROM Projects WHERE id = :ida "); //to eliminate nulls from the list
		query.setParameter("ida", id);
		
		
	//	for (Staff staff : staffIdByProjectId) {
	//		Logger.info("Staff List::"+staff);
	//	}
		return (Staff) query;
		
	}*/
}


