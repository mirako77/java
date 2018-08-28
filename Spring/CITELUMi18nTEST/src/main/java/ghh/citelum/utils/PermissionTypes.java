package ghh.citelum.utils;

public class PermissionTypes {
	
	private static int globalAdminLevel 	= 1;
	private static int localAdminLevel 		= 2;
	private static int projectManagerLevel 	= 3;
	private static int contributeurLevel 	= 4;
	
	public static int getGlobalAdminLevel() {
		return globalAdminLevel;
	}
	public static int getLocalAdminLevel() {
		return localAdminLevel;
	}
	public static int getProjectManagerLevel() {
		return projectManagerLevel;
	}
	public static int getContributeurLevel() {
		return contributeurLevel;
	}


}
