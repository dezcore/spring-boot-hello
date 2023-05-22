package com.example.springbootdocker;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SpringBootDockerApplication {
	private Logger logger = LoggerFactory.getLogger(SpringBootDockerApplication.class);
	
	@Value("${swagger.google.clien}")
    private String googleApiUrl;

	@RequestMapping("/")
	public String home() {
		logger.info("env : " + String.valueOf(googleApiUrl));
		return "Hello World!";
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootDockerApplication.class, args);

	}

}
