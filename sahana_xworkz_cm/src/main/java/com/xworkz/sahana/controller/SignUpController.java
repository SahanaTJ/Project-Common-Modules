package com.xworkz.sahana.controller;

import java.time.LocalDateTime;
import java.util.Set;
import javax.validation.ConstraintViolation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xworkz.sahana.dto.SignUpDTO;
import com.xworkz.sahana.service.SignUpService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class SignUpController {

	@Autowired
	private SignUpService service;


		public SignUpController() {
		log.info("Created" + this.getClass().getSimpleName());
	}

	@GetMapping("/register")
	public String onSave() {
		log.info("GetMapping onSave in SignUpController");
		return "SignUp";
	}

	@PostMapping("/register")
	public String OnSave(SignUpDTO dto, Model model) {
		log.info("PostMapping onSave in SignUpController" + dto);
		dto.setCreatedBy(dto.getUserId());
		dto.setCreatedDate(LocalDateTime.now());
		if (dto != null) {
			Set<ConstraintViolation<SignUpDTO>> violations = this.service.validateAndSave(dto);
			if (violations.isEmpty()) {
				System.out.println("no violations found, go to success page");
				model.addAttribute("dto", dto);
				return "SignUpSuccessPage";
			}

			log.info("Violations found " + dto);
			model.addAttribute("errors", violations);
			model.addAttribute("dto", dto);
		}
		return "SignUp";
	}
	
	@PostMapping("/login")
	public String onSave(String signInId, String password, Model model) {
		try {
	SignUpDTO dto = this.service.signIn(signInId, password);
		if (dto!=null) {
			log.info("User ID and password is matched");
			model.addAttribute("userID",dto.getUserId());
			return "LoginSuccess";
		}
		}
		catch (Exception e) {
			
		}
			model.addAttribute("Match", "UserID OR Password is not matching");
			return "SignIn";			
			
	}
}
