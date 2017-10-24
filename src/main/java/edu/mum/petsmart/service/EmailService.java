package edu.mum.petsmart.service;

public interface EmailService {
	public void sendMail(String to, String subject, String text);
}
