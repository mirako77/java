package net.mickanel.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Voyage {
	private String stationStart;
	private String stationEnd;
	private String startedJourneyAt;
	private String costInCents;
	private String zoneFrom;
	private String zoneTo;
	private boolean isWritable;
	
	public Voyage(String stationStart, String stationEnd, String startedJourneyAt, String costInCents, String zoneFrom,
			String zoneTo) {
		super();
		this.stationStart = stationStart;
		this.stationEnd = stationEnd;
		this.startedJourneyAt = startedJourneyAt;
		this.costInCents = costInCents;
		this.zoneFrom = zoneFrom;
		this.zoneTo = zoneTo;
		this.isWritable = true;
	}
	
	public String getStationStart() {
		return stationStart;
	}
	public void setStationStart(String stationStart) {
		this.stationStart = stationStart;
	}
	public String getStationEnd() {
		return stationEnd;
	}
	public void setStationEnd(String stationEnd) {
		this.stationEnd = stationEnd;
	}
	public String getStartedJourneyAt() {
		return startedJourneyAt;
	}
	public void setStartedJourneyAt(String startedJourneyAt) {
		this.startedJourneyAt = startedJourneyAt;
	}
	public String getCostInCents() {
		return costInCents;
	}
	public void setCostInCents(String costInCents) {
		this.costInCents = costInCents;
	}
	public String getZoneFrom() {
		return zoneFrom;
	}
	public void setZoneFrom(String zoneFrom) {
		this.zoneFrom = zoneFrom;
	}
	public String getZoneTo() {
		return zoneTo;
	}
	public void setZoneTo(String zoneTo) {
		this.zoneTo = zoneTo;
	}
	@JsonIgnore
	public boolean isWritable() {
		return isWritable;
	}
	public void setWritable(boolean isWritable) {
		this.isWritable = isWritable;
	}
	
	@Override
	public String toString() {
		return "Voyage [stationStart=" + stationStart + ", stationEnd=" + stationEnd + ", startedJourneyAt="
				+ startedJourneyAt + ", costInCents=" + costInCents + ", zoneFrom=" + zoneFrom + ", zoneTo=" + zoneTo
				+ ", isWritable=" + isWritable + "]";
	} 
	
	
}
