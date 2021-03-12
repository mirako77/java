package net.mickanel.entity;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Index;

@SuppressWarnings("deprecation")
@Entity
@Table(name="customer")
public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	private long customerId;
	
	@SuppressWarnings("deprecation")
	@Index(name="customerNameIndex")
	private String customerName;
	
	private String country;
	
	@Basic
	private java.time.LocalDate createdDate;
	
	@Basic
	private java.time.LocalDateTime updateDate;

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public java.time.LocalDate getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(java.time.LocalDate createdDate) {
		this.createdDate = createdDate;
	}

	public java.time.LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(java.time.LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}
	
}
