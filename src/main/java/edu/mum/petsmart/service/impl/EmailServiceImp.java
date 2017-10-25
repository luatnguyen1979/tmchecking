package edu.mum.petsmart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import edu.mum.petsmart.service.EmailService;

@Service
public class EmailServiceImp implements EmailService{

	@Autowired
	private JavaMailSender emailSender;

	@Override
	public void sendMail(String to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("kelevi@mum.edu");
		message.setFrom("coolkent7777777@gmail.com");
		message.setSubject(subject);
		message.setText(text);
		emailSender.send(message);
	}
	
	
}
