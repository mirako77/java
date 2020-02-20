package net.mickanel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
public class SpringBootApp
{
    public static void main( String[] args )
    {
        System.out.println( "Hello Spring Boot !" );
        SpringApplication.run(SpringBootApp.class, args);
    }
}