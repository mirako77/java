package net.mickanel.dao;

import java.util.List;

import net.mickanel.entity.Customer;

public interface CustomerDAO {
	
	public Customer addCustomer(Customer customer);
	public Customer updateCustomer(Customer customer);
	public void deleteCustomer(long customerId);
	public Customer getCustomer(long customerId);
	public List<Customer> getCustomers();

}
