package blueberry.user;

import java.io.Serializable;



public class UserVO implements Serializable{
	
	private static final long serialVersionUID = 3647233284813657927L;
	
	private String user_id;
	private String user_password;
	private String name;
	private String role;
	
	private String id;

	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password="
				+ user_password +  ", name=" + name + ", role="
				+ role + "]";
	}
	
	//id, user_id, user_password, name, role
}
