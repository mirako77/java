package net.mickanel.ui;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.mickanel.entity.Customer;
import net.mickanel.services.CustomerService;
import net.mickanel.services.SpringException;

@Controller
@RequestMapping("/market")
public class MarketController {
	
	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired(required=true)
	@Qualifier("customerService")
	private CustomerService customerService;
	
	
	@GetMapping("")
	public String getHome(){
		logger.info("Home page invoked");
		return "redirect:customers";
	}
	
	@GetMapping("/customers")
	public ModelAndView getCustomersList(){
		logger.info("Customer page invoked");
		ModelAndView model  = new ModelAndView("customers");
		List<Customer> list = customerService.getAllCustomers();
		model.addObject("customers", list);
		return model;
	}
	
	@GetMapping("/deleteCustomer/{customerId}")
	@ExceptionHandler({SpringException.class})
	public ModelAndView deleteCustomer(@PathVariable("customerId") String customerId){
		logger.info("deleteCustomer page invoked");
		ModelAndView model  = new ModelAndView("customers");
		boolean removed = customerService.removeCustomer(Long.parseLong(customerId));
		
		if(removed==true){
			model.addObject("saveSuccess", "Customer removed SuccessFully. id = "+customerId);
		}else{
			model.addObject("saveError", "Customer remove failed! id = "+ customerId);
//			throw new SpringException("SpringException: Peux pas supprimer le = "+customerId);
		}
		
		List<Customer> list = customerService.getAllCustomers();
		model.addObject("customers", list);
		
		return model;
	}
	
	@GetMapping("/editCustomerView/{customerId}")
	public ModelAndView getEditCustomerForm(@PathVariable("customerId") String customerId){
		
		ModelAndView model  = new ModelAndView("editCustomerForm");
		Customer cus = customerService.getCustomer(Long.parseLong(customerId));
		model.addObject("customer", cus);
		return model;
	}
	
	@PostMapping(value="/editCustomerAction")
	public ModelAndView editCustomer(HttpServletRequest request,HttpServletResponse response){
		
		ModelAndView model = new ModelAndView();
		model.setViewName("customers");
		String customerId = request.getParameter("customerId");
		String name = request.getParameter("name");
		String country = request.getParameter("country");
		LocalDate createdDate = LocalDate.parse(request.getParameter("createdDate"));
		logger.info("Adding customer with name:"+name);
		Customer customer = customerService.updateCustomer(Long.parseLong(customerId),name, country, createdDate);
		if(customer!=null){
			model.addObject("saveSuccess", "Customer Updates SuccessFully: "+customer.getCustomerName());
		}else{
			model.addObject("saveError", "Customer creation failed");
		}
		List<Customer> list = customerService.getAllCustomers();
		model.addObject("customers", list);
		
		return model;
	}
		
	@GetMapping(value="/addCustomerForm")
	public ModelAndView addCustomer(HttpServletRequest request,HttpServletResponse response){
		logger.info("addCustomerForm page invoked");
		return new ModelAndView("addCustomerForm");
	}
	
	@PostMapping(value="/addCustomerAction")
	public ModelAndView addCustomerAction(HttpServletRequest request,HttpServletResponse response){
		
		ModelAndView model = new ModelAndView();
		model.setViewName("customers");
		String name = request.getParameter("name");
		String country = request.getParameter("country");
		
		Customer customer = customerService.addCustomer(name, country);
		if(customer!=null){
			model.addObject("saveSuccess", "Customer Added SuccessFully: "+customer.getCustomerName());
		}else{
			model.addObject("saveError", "Customer creation failed");
		}
		List<Customer> list = customerService.getAllCustomers();
		model.addObject("customers", list);
		
		return model;
	}
	
	
}
