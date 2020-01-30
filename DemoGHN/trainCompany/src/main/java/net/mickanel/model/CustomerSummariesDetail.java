package net.mickanel.model;

import java.util.List;

public class CustomerSummariesDetail {
	    int customerId;
	    String totalCostInCents; 
	    List<Voyage> voyages;
	    
	    
		public CustomerSummariesDetail(int customerId, String totalCostInCents, List<Voyage> voyages) {
			super();
			this.customerId = customerId;
			this.totalCostInCents = totalCostInCents;
			this.voyages = voyages;
		}
		
		public CustomerSummariesDetail() {
			// TODO Auto-generated constructor stub
		}

		public int getCustomerId() {
			return customerId;
		}
		public void setCustomerId(int customerId) {
			this.customerId = customerId;
		}
		public String getTotalCostInCents() {
			return totalCostInCents;
		}
		public void setTotalCostInCents(String totalCostInCents) {
			this.totalCostInCents = totalCostInCents;
		}
		public List<Voyage> getVoyages() {
			return voyages;
		}
		public void setVoyages(List<Voyage> voyages) {
			this.voyages = voyages;
		}
}