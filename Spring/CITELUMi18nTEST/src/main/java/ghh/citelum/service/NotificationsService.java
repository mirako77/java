package ghh.citelum.service;

import java.util.List;

import ghh.citelum.model.Notifications;

public interface NotificationsService {
	
	public void addNotification(Notifications n);
	public void updateNotification(Notifications n);
	public List<Notifications> listNotifications();
	public List<Notifications> getListReceivedNotificationsByStaffId(int id);
	public List<Notifications> getListSentNotificationsByStaffId(int id);
	public Notifications getNotificationsById(int id);
	public void removeNotification(int id);
	public int countNewNotifications(int user);
	public int maxId();
	
}
