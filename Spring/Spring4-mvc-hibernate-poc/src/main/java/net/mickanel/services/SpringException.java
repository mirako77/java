package net.mickanel.services;

public class SpringException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private String exceptionMsg;
	
	// Constructeur
	public SpringException(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}

	public String getExceptionMsg() {
		return this.exceptionMsg;
	}

	public void setExceptionMsg(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}
}
