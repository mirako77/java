package ghh.citelum.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.NotificationsDAO;
import ghh.citelum.model.Notifications;

@Service
public class NotificationsServiceImpl implements NotificationsService {

	private NotificationsDAO notificationsDAO;
	
	public void setNotificationsDAO(NotificationsDAO notificationsDAO) {
		this.notificationsDAO = notificationsDAO;
	}

	@Override
	@Transactional
	public void addNotification(Notifications n) {
		this.notificationsDAO.addNotification(n);
	}

	@Override
	@Transactional
	public void updateNotification(Notifications n) {
		this.notificationsDAO.updateNotification(n);
	}

	@Override
	@Transactional
	public List<Notifications> listNotifications() {
		return this.notificationsDAO.listNotifications();
	}

	@Override
	@Transactional
	public List<Notifications> getListReceivedNotificationsByStaffId(int id) {
		return this.notificationsDAO.getListReceivedNotificationsByStaffId(id);
	}

	@Override
	@Transactional
	public List<Notifications> getListSentNotificationsByStaffId(int id) {
		return this.notificationsDAO.getListSentNotificationsByStaffId(id);
	}

	@Override
	@Transactional
	public Notifications getNotificationsById(int id) {
		return this.notificationsDAO.getNotificationsById(id);
	}

	@Override
	@Transactional
	public void removeNotification(int id) {
		this.notificationsDAO.removeNotification(id);
	}

	@Override
	@Transactional
	public int maxId() {
		return 0;
	}

	@Override
	@Transactional
	public int countNewNotifications(int user) {
		return this.notificationsDAO.countNewNotifications(user);
	}

}
