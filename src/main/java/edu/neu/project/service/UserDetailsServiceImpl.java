package edu.neu.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.neu.project.dao.UsrDAO;
import edu.neu.project.domain.UserRole;
import edu.neu.project.domain.Usr;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UsrDAO usrDAO;
	
	@Transactional
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		System.out.println("started Authentication");
		Usr user = usrDAO.getUserbyEmail(email);
		if(user != null) {
			
			System.out.println("User is present");
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

			for (UserRole role : user.getRole()){
	            authorities.add(new SimpleGrantedAuthority(role.getRole()));
	        }
			return new User(email, user.getPassword(), authorities);
		}
		
//		Usr user = usrDAO.getUserbyEmail(email);
//		if(email.equals("khamar.v@gmail.com")) {
//			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//
//			for (UserRole role : user.getRole()){
//	            authorities.add(new SimpleGrantedAuthority(role.getRole()));
//	        }
//			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//			authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
//			return new User(email, user.getPassword(), authorities);
//		}
//		else if(email.equals("vaibhavi.k@gmail.com")) {
//			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//			authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
//			return new User(email, "4495", authorities);
//		}
		throw new UsernameNotFoundException("User or Password is not valid");
	}

}
