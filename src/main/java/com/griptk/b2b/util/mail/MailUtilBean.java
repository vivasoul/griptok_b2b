package com.griptk.b2b.util.mail;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MailUtilBean {
	@Bean
	public MailSender getMailSender() {
	  String username = "unknown";
	  String password = "what_is_ur_passwd";
		
      Properties props = new Properties(); 
      props.put("mail.smtp.user",username); 
      props.put("mail.smtp.password", password);
      props.put("mail.smtp.host", "smtp.gmail.com"); 
      props.put("mail.smtp.port", "25"); 
      props.put("mail.debug", "true"); 
      props.put("mail.smtp.auth", "true"); 
      props.put("mail.smtp.starttls.enable","true"); 
      props.put("mail.smtp.EnableSSL.enable","true");
      props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
      props.setProperty("mail.smtp.socketFactory.fallback", "false");   
      props.setProperty("mail.smtp.port", "465");   
      props.setProperty("mail.smtp.socketFactory.port", "465"); 
		
		return new MailSender(props);
	}
}
