package net.mickanel.services;

import java.util.Date;
import java.util.List;

import net.mickanel.dao.CustomerDAO;
import net.mickanel.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired(required=true)
	@Qualifier("customerDAO")
	private CustomerDAO customerDAO;
	
	@Transactional
	public Customer addCustomer(String customerName, String country) {
		
		System.out.println("Cusomer Service create invoked:"+customerName);
		Customer customer  = new Customer();
		customer.setCountry(country);
		customer.setCustomerName(customerName);
		customer.setCreatedDate(new Date());
		customer.setUpdateDate(new Date());
		customer = customerDAO.addCustomer(customer);
		return customer;
	}
	@Transactional
	public Customer updateCustomer(long customerId,String customerName, String country) {
		
		System.out.println("Cusomer Service Update invoked:"+customerName);
		Customer customer  = new Customer();
		customer.setCustomerId(customerId);
		customer.setCountry(country);
		customer.setCustomerName(customerName);
		customer.setUpdateDate(new Date());
		customer = customerDAO.updateCustomer(customer);
		return customer;
	}

	public Customer getCustomer(long customerId) {
		return customerDAO.getCustomer(customerId);
	}

	public List<Customer> getAllCustomers() {
		return customerDAO.getCustomers();
	}


}
