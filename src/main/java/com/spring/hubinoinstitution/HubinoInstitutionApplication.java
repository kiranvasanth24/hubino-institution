package com.spring.hubinoinstitution;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class HubinoInstitutionApplication {

	public static void main(String[] args) {
		SpringApplication.run(HubinoInstitutionApplication.class, args);
	}

}
