package com.kmj.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("miyamotomina686@gmail.com", "itwillbs!");
	}
	
	public String getEmail(){
		return passAuth.getUserName();
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
