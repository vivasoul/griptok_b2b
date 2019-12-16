package com.griptk.b2b.util.mail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class MailSender {

	private Properties props;
	
	public MailSender(Properties props) {
		this.props = props;
	}
	
	public void send(String recipient, String subject, String body) throws AddressException, MessagingException, UnsupportedEncodingException {
		send(recipient, null, subject, body);
	}
	
	public void send(String recipient, String[] cc_recipients, String subject, String body) throws AddressException, MessagingException, UnsupportedEncodingException {
		
		String username = "";
		String password = "";
		
		Session session = Session.getInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			
			protected  PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
				
		session.setDebug(true);
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(username));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		
		if(cc_recipients != null && cc_recipients.length > 0) {
			int cc_count = cc_recipients.length;
			
			InternetAddress[] ccs = new InternetAddress[cc_count];
			for(int i=0; i<cc_count; i++) {
				ccs[i] = new InternetAddress(cc_recipients[i]);
			}
			mimeMessage.setRecipients(RecipientType.CC, ccs);
		}
		
		mimeMessage.setSubject(MimeUtility.encodeText(subject,"UTF-8","B"));
		mimeMessage.setContent(body, "text/html; charset=UTF-8");
		//mimeMessage.setText(body, "UTF-8");
		Transport.send(mimeMessage);
	}
}
