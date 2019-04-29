package edu.neu.project.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Role")
public class UserRole {
	
	@Id
	@GeneratedValue
	private long userRoleId;
	private String role;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private Usr user;

	public Usr getUser() {
		return user;
	}
	public void setUser(Usr user) {
		this.user = user;
	}	
	public long getUserRoleId() {
		return userRoleId;
	}	
	public void setUserRoleId(long userRoleId) {
		this.userRoleId = userRoleId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
