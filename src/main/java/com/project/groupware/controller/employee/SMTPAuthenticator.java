package com.project.groupware.controller.employee;
import javax.mail.*;

public class SMTPAuthenticator extends Authenticator{
	 protected PasswordAuthentication getPasswordAuthentication() {
		  String username = "dsgroupware43@naver.com"; // gmail 사용자;
		  String password = "java1234";  // 패스워드;
		  return new PasswordAuthentication(username, password);
		 }
}
