package net.mickanel.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import net.mickanel.entity.Customer;
import net.mickanel.services.CustomerServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("customerDAO")
@Transactional
public class CustomerDAOImpl implements CustomerDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerDAOImpl.class);
	
	@PersistenceContext
	public EntityManager entityManager;

	@Transactional(readOnly=false)
	public Customer addCustomer(Customer customer) {
		entityManager.persist(customer);
		return customer;
	}

	@Transactional(readOnly=false)
	public Customer updateCustomer(Customer customer) {
		entityManager.merge(customer);
		return customer;
	}

	@Transactional(readOnly=false)
	public boolean removeCustomer(long customerId) {
		Customer cusToRemove = getCustomer(customerId);
		if (cusToRemove != null) {
			entityManager.remove(cusToRemove);
		} else {
			logger.debug("Customer {} to removed doesn't exist !",customerId);
			return false;
		}
		return true;
	}

	@Transactional(readOnly=true)
	public Customer getCustomer(long customerId) {
		String sql = "select customer from Customer customer where customer.customerId="+customerId;
		try{
			return (Customer) entityManager.createQuery(sql).getSingleResult();
		}catch(Exception e){
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public List<Customer> getCustomers() {
		return entityManager.createQuery("select customer from Customer customer").getResultList();
	}

}
