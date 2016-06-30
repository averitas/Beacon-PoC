package com.web.beacon.model;

import java.util.Properties;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class CustomMailSender {

	public static void sendMail(String receiver, String message) throws MailException{
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		senderImpl.setHost("smtp.gmail.com");
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(receiver);  
        mailMessage.setFrom("lewis9224test@gmail.com");  
        mailMessage.setSubject("One patient has been created!");  
        mailMessage.setText(message);  
        senderImpl.setUsername("lewis9224test@gmail.com");
        senderImpl.setPassword("b2-ef2000");
        senderImpl.setPort(587);
        Properties prop = new Properties();  
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.debug", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        senderImpl.setJavaMailProperties(prop);  
        
        senderImpl.send(mailMessage); 
	}
}
