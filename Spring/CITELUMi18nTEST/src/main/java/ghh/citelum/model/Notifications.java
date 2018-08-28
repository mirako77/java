package ghh.citelum.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NOTIFICATIONS")
public class Notifications {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String notifications;

	@ManyToOne(fetch = FetchType.LAZY)
	private Staff staff_receiver;

	@ManyToOne(fetch = FetchType.LAZY)
	private Staff staff_sender;

	private String date; //Will be set to date type in the future dd-mm-yyyy
	private boolean state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNotifications() {
		return notifications;
	}

	public void setNotifications(String notifications) {
		this.notifications = notifications;
	}

	public Staff getStaff_receiver() {
		return staff_receiver;
	}

	public void setStaff_receiver(Staff staff_receiver) {
		this.staff_receiver = staff_receiver;
	}

	public Staff getStaff_sender() {
		return staff_sender;
	}

	public void setStaff_sender(Staff staff_sender) {
		this.staff_sender = staff_sender;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Notifications [id=" + id + ", notifications=" + notifications + ", staff_receiver=" + staff_receiver
				+ ", staff_sender=" + staff_sender + ", date=" + date + ", state=" + state + "]";
	}











}
