package com.xworkz.sahana.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String onSave(Model model) {
		log.info("GetMapping onSave in SignUpController");
		return "SignUp";
	}

	@PostMapping("/register")
	public String onSave(SignUpDTO dto, Model model) {

		Set<ConstraintViolation<SignUpDTO>> violations = this.service.validateAndSave(dto);
		if (violations != null && violations.isEmpty()) {

			model.addAttribute("message", "data saved successfull");
			System.out.println("" + dto);
			model.addAttribute("dto", dto);
			return "SignUpSuccessPage";
		} else {
			model.addAttribute("errors", violations);
			model.addAttribute("message", "data not saved");
		}
		return "SignUp";
	}

	@PostMapping("/login")
	public String signIn(String userId, String password, Model model, HttpServletRequest request) {
		try {
			SignUpDTO dto = this.service.signIn(userId, password);
			log.info("signIn : " + dto);
			if (dto.getLoginCount() >= 3) {
				model.addAttribute("msg", "Account locked Reset password");
				log.info("Account locked due to wrong password entering 3 times");
				return "SignIn";
			}

			if (dto != null) {
				if (dto.getReSetPassword() == true) {
					log.info("Running in ResetPassword true condition");
					if (!dto.getPasswordChangedTime().isAfter(LocalTime.now())) {
						log.info("Running in time warifying condition");
						model.addAttribute("msgs", "Time out plz try again");
						return "SignIn";
					}
					model.addAttribute("userID", dto.getUserId());
					log.info("Running in reset condition");
					log.info("ResetPassword---" + dto.getReSetPassword());
					log.info("Timer-----" + dto.getPasswordChangedTime().isBefore(LocalTime.now()));
					return "UpdatePassword";
				}
				log.info("User ID and password is matched");
				// model.addAttribute("userID", udto.getUserId());//request scope
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("userID", dto.getUserId());
				httpSession.setAttribute("dtoPic", dto.getPicName());
				httpSession.setAttribute("dto", dto);
				return "LoginSuccess";
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.info(e.getMessage());
		}
		log.info("UserID OR Password is not matching");
		model.addAttribute("match", "UserID OR Password is not matching");
		return "SignIn";
	}

	@PostMapping("/reset")
	public String resetPassword(String email, Model model) {
		SignUpDTO udto = this.service.reSetPassword(email);
		if (udto.getReSetPassword() == true) {
			model.addAttribute("msg", "Password reset sucessful plz login");
			return "Resetpassword";
		}
		return "Resetpassword";
	}

	@PostMapping("/passwordUpdate")
	public String updatePassword(String userId, String password, String confirmPassword) {
		this.service.updatePassword(userId, password, confirmPassword);
		return "UpdateSucess";
	}

	@PostMapping("/upload")
	public String onUpload(@RequestParam("sahana") MultipartFile multipartFile, String userId, String email,
			Long mobile, Model model) throws IOException {
		log.info("multipartFile" + multipartFile);
		log.info(multipartFile.getOriginalFilename());
		log.info(multipartFile.getContentType());
		log.info("Size of file" + multipartFile.getSize());
		log.info("Size of bite" + multipartFile.getBytes());
		if (multipartFile.isEmpty()) {
			log.info("file not uploaded");
			model.addAttribute("error", "please select file");
			return "profileUpdate";
		}
		model.addAttribute("sucess", "image uploaded sucessfully");
		byte[] bytes = multipartFile.getBytes();
		Path path = Paths.get("D:\\highway\\" + userId + System.currentTimeMillis() + ".jpg");
		Files.write(path, bytes);
		String imageName = path.getFileName().toString();
		log.info("Image name--" + imageName);
		log.info("Image name in tostring--" + path.toString());
		log.info("Image file name--" + path.getFileName());
		this.service.updateProfile(userId, email, mobile, imageName);
		return "ProfileUpdate";
	}

	@GetMapping("/download")
	public void onDownload(HttpServletResponse response, @RequestParam String fileName, SignUpDTO dto)
			throws IOException {
		Path path = Paths.get("D:\\highway\\" + dto.getPicName());
		path.toFile();
		response.setContentType("image/jpeg");
		File file = new File("D:\\highway\\" + fileName);
		InputStream in = new BufferedInputStream(new FileInputStream(file));
		ServletOutputStream out = response.getOutputStream();
		IOUtils.copy(in, out);
		response.flushBuffer();

	}
}
