package com.griptk.b2b;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;

@SpringBootApplication
@EnableAutoConfiguration
@MapperScan({"com.griptk.b2b.*.mapper"})
//@ServletComponentScan({"com.ppcwiz.http.filter"})
public class GriptokB2BApplication {
	
	public static void main(String[] args) {		
		SpringApplication.run(GriptokB2BApplication.class, args);
	} 
	
	@Bean
	public TaskScheduler taskScheduler() {
		return new ConcurrentTaskScheduler();
	}
}
