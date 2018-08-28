package ghh.citelum.utils;

public class FrontEndFilePaths {

	private String userFiles = "../WEB-INF/jsp/user/";
	private String projectFiles = "../WEB-INF/jsp/project/";
	private String sharedFiles = "../WEB-INF/jsp/shared/";
	private String utilsFiles = "../WEB-INF/jsp/utils/";
	private String notificationFiles = "../WEB-INF/jsp/notifications/";
	private String templateFiles = "../WEB-INF/jsp/template/";
	
	public String getNotificationFiles() {
		return notificationFiles;
	}
	public String getUserFiles() {
		return userFiles;
	}
	public String getProjectFiles() {
		return projectFiles;
	}
	public String getSharedFiles() {
		return sharedFiles;
	}
	public String getUtilsFiles() {
		return utilsFiles;
	}
	public String getTemplateFiles() {
		return templateFiles;
	}	
	
}
