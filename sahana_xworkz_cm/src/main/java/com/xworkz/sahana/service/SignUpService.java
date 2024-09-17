package com.xworkz.sahana.service;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import javax.enterprise.inject.Default;
import javax.validation.ConstraintViolation;
import com.xworkz.sahana.dto.SignUpDTO;
import com.xworkz.sahana.dto.TechnologyListDTO;

public interface SignUpService {
	Set<ConstraintViolation<SignUpDTO>> validateAndSave(SignUpDTO dto);

	default SignUpDTO signIn(String userId, String password) {
		return null;
	}

	default List<SignUpDTO> findAll() {
		return Collections.emptyList();
	}

	default Long findByEmail(String email) {
		return null;
	}

	default Long findByMobile(Long mobile) {
		return null;
	}

	default Long findByUser(String user) {
		return null;
	}
	default SignUpDTO findById(int id) {
		return null;
	}
	

	default SignUpDTO reSetPassword(String email) {
		return null;
	}

	default SignUpDTO updatePassword(String userId, String password, String confirmPassword) {
		return null;
	}

	default SignUpDTO updateProfile(String userId, String email, Long mobile, String path) {
		return null;
	}

	boolean sendMail(String email);

	Set<ConstraintViolation<TechnologyListDTO>> validateAndAdd(TechnologyListDTO dto);
 
	
	default List<TechnologyListDTO> findlistById(int id){
		return Collections.emptyList();
	}
}
