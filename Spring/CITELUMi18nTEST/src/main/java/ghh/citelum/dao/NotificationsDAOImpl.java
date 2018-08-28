package ghh.citelum.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import org.springframework.stereotype.Repository;

import ghh.citelum.model.Notifications;
import ghh.citelum.model.Projects;


@Repository
public class NotificationsDAOImpl implements NotificationsDAO {
	
	private static final Logger logger = Logger.getLogger(NotificationsDAOImpl.class);
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addNotification(Notifications n) {
		Session session = this.sessionFactory.getCurrentSession();
		
		session.persist(n);
		
		logger.info("Notification saved successfully, Notification Details=" + n);

	}

	@Override
	public void updateNotification(Notifications n) {
		Session session = this.sessionFactory.getCurrentSession();
		
		session.update(n);
		
		logger.info("Notification updated successfully, Notification Details=" + n);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notifications> listNotifications() {
		Session session = this.sessionFactory.getCurrentSession();
		
		List<Notifications> notifications = session.createQuery("from Notifications").list();
		
		for ( Notifications note : notifications) {
			logger.info("Notification list::" + note);
		}
		
		return notifications;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notifications> getListReceivedNotificationsByStaffId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Notifications where staff_receiver_id = :ida order by ID DESC");
		query.setParameter("ida", id);
				
		List<Notifications> notifications = query.list();	
		
		for (Notifications note : notifications) {
			logger.info("Notifications List::" + note);
		}
		
		return notifications;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Notifications> getListSentNotificationsByStaffId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Notifications where staff_sender_id = :ida order by ID");
		query.setParameter("ida", id);
				
		List<Notifications> notifications = query.list();	
		
		for (Notifications note : notifications) {
			logger.info("Notifications List::" + note);
		}
		
		return notifications;
	}

	@Override
	public Notifications getNotificationsById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Notifications note = (Notifications) session.load(Notifications.class, new Integer(id));

		logger.info("Notification loaded successfully, Notification details=" + note);
		
		return note;
	}

	@Override
	public void removeNotification(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Notifications note = (Notifications) session.load(Notifications.class, new Integer(id));
		
		if(null !=note) {
			session.delete(note);
			
		}
		
		logger.info("Notification deleted successfully, Notification details=" + note);

	}

	@Override
	public int maxId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countNewNotifications(int user) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count(state) from Notifications where state=0 AND staff_receiver_id = :userid");
		query.setParameter("userid", user);	

		Long count = (Long) query.uniqueResult();
		
		int intCount = Math.toIntExact(count);
		System.out.println(intCount);
		return intCount;
	}

}
