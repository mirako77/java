package net.mickanel.services;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.mickanel.dao.CustomerDAO;
import net.mickanel.entity.Customer;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);

	@Autowired(required=true)
	@Qualifier("customerDAO")
	private CustomerDAO customerDAO;
	
	@Transactional
	public Customer addCustomer(String customerName, String country) {
		
		logger.debug(customerName, "Customer Service create invoked: {0}");
		Customer customer  = new Customer();
		customer.setCountry(country);
		customer.setCustomerName(customerName);
		customer.setCreatedDate(LocalDate.now());
		customer.setUpdateDate(LocalDateTime.now());
		customer = customerDAO.addCustomer(customer);
		return customer;
	}
	@Transactional
	public Customer updateCustomer(long customerId,String customerName, String country) {
		
		logger.debug(customerName, "Customer Service Update invoked:");
		Customer customer  = new Customer();
		customer.setCustomerId(customerId);
		customer.setCountry(country);
		customer.setCustomerName(customerName);
		customer.setUpdateDate(LocalDateTime.now());
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
