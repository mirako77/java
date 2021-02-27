package net.mickanel.model;

import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomerSummaries {
	
	@JsonProperty("CustomerSummaries")
	private HashMap<Integer,CustomerSummariesDetail> customerSummariesDetailList;
	
	public CustomerSummaries() {
	}

	public HashMap<Integer, CustomerSummariesDetail> getCustomerSummariesDetailList() {
		return customerSummariesDetailList;
	}

	public void setCustomerSummariesDetailList(HashMap<Integer, CustomerSummariesDetail> customerSummariesDetailList) {
		this.customerSummariesDetailList = customerSummariesDetailList;
	}
	
}