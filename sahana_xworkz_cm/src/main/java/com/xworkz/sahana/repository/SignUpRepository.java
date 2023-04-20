package com.xworkz.sahana.repository;

import java.util.Collections;
import java.util.List;

import com.xworkz.sahana.entity.SignUpEntity;

public interface SignUpRepository {

	boolean save(SignUpEntity entity);

	default SignUpEntity signIn(String userId) {
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

    boolean logincount(String userId, int count);

    default SignUpEntity reSetPassword(String email) {
		return null;
	}
   boolean update(SignUpEntity Entity);
	
	boolean updatePassword(String userId, String password,Boolean resetPassword);
}
