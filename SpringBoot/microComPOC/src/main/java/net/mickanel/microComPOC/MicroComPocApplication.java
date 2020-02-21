package net.mickanel.microComPOC;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Ceci est la classe principale qui me permet de lancer un projet
 * microService avec Spring Boot.
 * Nous avons besoin de cet classe pour pouvoir lancer le jar de maniére
 * autonome dans un container.
 */
@SpringBootApplication
public class MicroComPocApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroComPocApplication.class, args);
	}

}
