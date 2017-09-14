/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

/**
 * @author Van Gia Luat Nguyen
 *
 */
final public class User {
	private String userID;
	private String userName;
	private String password;
	private String role;
	private Profile profile;

	/**
	 * 
	 */
	private User() {
		
	}
	
	/**
	 * 
	 * @param userID
	 * @param userName
	 * @param password
	 * @param role
	 */
	User(String userID, String userName, String password, String role) {
		this.userID = userID;
		this.userName = userName;
		this.password = password;
		this.role = role;
	}

	/**
	 * @return the userID
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @param userID the userID to set
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @return the profile
	 */
	public Profile getProfile() {
		return profile;
	}

	/**
	 * @param profile the profile to set
	 */
	void setProfile(Profile profile) {
		this.profile = profile;
	}

	
}
