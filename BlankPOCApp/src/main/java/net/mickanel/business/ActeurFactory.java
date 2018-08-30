package net.mickanel.business;

public class ActeurFactory {
	private static final ActeurImpl acteurImpl = new ActeurImpl("N/A", "N/A");;
	
	public ActeurImpl getDefaultActeur() {
		return acteurImpl;
	}
}
