package com.samcheseny.security;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

@SpringBootApplication
@EnableAuthorizationServer
public class Oauth2ServerStarterApplication {

	public static void main(String[] args) {
		SpringApplication.run(Oauth2ServerStarterApplication.class, args);
	}

}
