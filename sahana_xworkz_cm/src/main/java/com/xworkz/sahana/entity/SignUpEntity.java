package com.xworkz.sahana.entity;

import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQuery;

import com.xworkz.sahana.dto.AbstractAuditDTO;
import lombok.Data;

@Data
@Entity
@Table(name ="signup_table")
@NamedQuery(name = "find",query = "select ent from SignUpEntity ent")
@NamedQuery(name = "userId",query = "select count(*) from  SignUpEntity ent where ent.userId=:userBy")
@NamedQuery(name = "emailId",query = "select count(*) from  SignUpEntity ent where ent.email=:emailBy")
@NamedQuery(name = "mobileId",query = "select count(*) from  SignUpEntity ent where ent.mobile=:mobileBy")
@NamedQuery(name="userANDpassword",query = "select ent from SignUpEntity ent where ent.userId=:ui and ent.password=:pwd ")
public class SignUpEntity{

	@Id
	@Column(name = "id")
	private int id;
	
	@Column(name ="userId")
	private String userId;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "mobile")
	private long mobile;
	
	@Column(name = "password")
	private String password;

	@Column(name ="createdBy")
	private String createdBy;
	
	@Column(name = "createdDate")
	private LocalDateTime createdDate;
	
	@Column(name ="updatedBy")
	private String updatedBy;
	
	@Column(name ="updatedDate")
	private LocalDateTime updatedDate;
	
}
