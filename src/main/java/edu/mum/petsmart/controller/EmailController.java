package edu.mum.petsmart.controller;

import java.util.Properties;


import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.petsmart.domain.EmailForm;
import edu.mum.petsmart.service.EmailService;

@Controller
public class EmailController {
	
	@Autowired EmailService emailService;
	
	@RequestMapping(value="/help", method = RequestMethod.GET)
	public String contactUs(Model model) {
		model.addAttribute("emailForm", new EmailForm());
		return "contactUs";
	}
	
	@RequestMapping(value="/helpSubmit", method = RequestMethod.POST)
	public String contactSubmit(@ModelAttribute("emailForm") EmailForm emailForm,
			RedirectAttributes redirectAttributes) {
		String messageText = "Name: " + emailForm.getName() + "\n" +
			"Email: " + emailForm.getEmail() + "\n" + "Phone: " + emailForm.getMobile() + 
			"\n" + emailForm.getMessage();
		emailService.sendMail("kelevi@mum.edu", emailForm.getSubject(), messageText);
		
		return "redirect:/help";
	}

}
