package com.xworkz.sahana.configuration;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import lombok.extern.slf4j.Slf4j;

@Configuration
@ComponentScan("com.xworkz.sahana")
@Slf4j
@EnableWebMvc
public class SignUpConfiguration {

	public SignUpConfiguration() {
		log.info("Created" + this.getClass().getSimpleName());
	}
	
	@Bean
	public MultipartResolver multipartResolver() {
		log.info("registring MultipartResolver");
		return new StandardServletMultipartResolver();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		log.info("registring ViewResolver");
		return new InternalResourceViewResolver("/", ".jsp");
	}
	
	@Bean
	public LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean() {
		log.info("registering LocalContainerEntityManagerFactoryBean");
		LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
		bean.setPackagesToScan("com.xworkz.sahana.entity");
		bean.setDataSource(dataSource());
		bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		return bean;
	}
	
	
	public DataSource dataSource() {
		log.info("registering DataSource");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/hibernate");
		dataSource.setPassword("Xworkzodc@123");
		dataSource.setUsername("root");
		return dataSource;
	}
	
	@Bean
	public PasswordEncoder encoder() {
		log.info("Registring the PasswordEncoder");
		return new BCryptPasswordEncoder();
	}
}
