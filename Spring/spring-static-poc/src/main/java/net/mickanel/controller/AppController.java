package net.mickanel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController {

	@GetMapping(path = "/")
	public ModelAndView getData() {
	
		return new ModelAndView("hello");
//		return new ModelAndView("hello1");
		
	}

}