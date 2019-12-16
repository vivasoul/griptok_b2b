package com.griptk.b2b.util.password;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.griptk.b2b.util.password.PasswordGenerator.PasswordGeneratorBuilder;

@Configuration
public class PasswordUtilBean {
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public PasswordGenerator getPasswordGenerator() {
		return new PasswordGenerator(new PasswordGenerator.PasswordGeneratorBuilder());
	}
}
