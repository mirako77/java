package net.mickanel.model;

public class Step {
    private String station;
    private int customerId;
    private String unixTimestamp;
    
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getUnixTimestamp() {
		return unixTimestamp;
	}
	public void setUnixTimestamp(String unixTimestamp) {
		this.unixTimestamp = unixTimestamp;
	}
	@Override
	public String toString() {
		return "Step [station=" + station + ", customerId=" + customerId + ", unixTimestamp=" + unixTimestamp + "]";
	}
    
}
