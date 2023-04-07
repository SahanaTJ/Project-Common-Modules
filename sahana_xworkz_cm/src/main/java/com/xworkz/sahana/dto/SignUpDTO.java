package com.xworkz.sahana.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignUpDTO {

	private int id;
	@NotBlank(message = "userId must not blank")
	@Size(min = 4, max =30, message = "UserId should be greater then 4 and less than 30")
	private String userId;
	@NotBlank(message = "email must not blank")
	@Size(min = 4, max = 40, message = "email should be greater then 4 and less then 40")
	private String email;
	@NotNull(message = "mobile must not null")
	private Long mobile;
	@NotBlank(message = "password must not blank")
	@Size(min = 4, max = 12, message  ="password should ve greater then 4 and less then 12")
	private String password;
	
	private Boolean reSetPassword;
	
	

}
