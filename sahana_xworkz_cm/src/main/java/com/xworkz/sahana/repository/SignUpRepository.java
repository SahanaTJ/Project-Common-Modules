package com.xworkz.sahana.repository;

import java.util.Collections;
import java.util.List;

import com.xworkz.sahana.entity.SignUpEntity;

public interface SignUpRepository {

	boolean save(SignUpEntity entity);

	default SignUpEntity signIn(String userId, String password) {
		return null;
	}
	default List<SignUpEntity> findAll() {
		return Collections.emptyList();
	}

	default Long findByUser(String user) {
		return null;
	}
default Long findByEmail(String email) {
	return null;
}

default Long findByMobile(Long number) {
	return null;
}

SignUpEntity entity(String userId, String password);
}