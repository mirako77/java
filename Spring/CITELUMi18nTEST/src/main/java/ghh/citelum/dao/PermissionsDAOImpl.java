package ghh.citelum.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ghh.citelum.model.Permissions;

@Repository
public class PermissionsDAOImpl implements PermissionsDAO {

	private static final Logger logger = Logger.getLogger(Permissions.class);
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void updatePermission(Permissions p) {
		Session session = this.sessionFactory.getCurrentSession();
		
		session.update(p);
		
		logger.info("Permissions updated successfully, Permissions Details="+p);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Permissions> listPermissions() {

		Session session = this.sessionFactory.getCurrentSession();
		System.out.println("hey");
		
		List<Permissions> permissionsList = session.createQuery("from Permissions order by id").list();
		/*
		for ( Permissions p : permissionsList ) {
			logger.info("Permissions List::" + permissionsList);
		}
		*/
		return permissionsList;
	}

	@Override
	public Permissions getPermissionById(int id) {
		
		Session session = this.sessionFactory.getCurrentSession();

		Permissions p = (Permissions) session.load(Permissions.class, new Integer(id));
		
		logger.info("Permission loaded successfully, Permission Detail = " + p);
		
		return p;
	}

	@Override
	public Permissions getPermissionByRole(String role) {

		Session session = this.sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Permissions.class);
		
		Permissions permission = (Permissions) criteria.add(Restrictions.eq("role", role)).uniqueResult();
		
		logger.info("Permission loaded successfully, Permission details=" + permission);

		return permission;
	}

}
