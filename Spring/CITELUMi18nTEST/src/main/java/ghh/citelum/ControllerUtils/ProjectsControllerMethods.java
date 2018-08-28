package ghh.citelum.ControllerUtils;

public abstract class ProjectsControllerMethods {
	
	public boolean checkCurrentUserPermission(int currentUserPerm, int requiredPerm) {
		
		if ( currentUserPerm <= requiredPerm ) {
			return true;
		} else {
			return false;
		}

	}

}
