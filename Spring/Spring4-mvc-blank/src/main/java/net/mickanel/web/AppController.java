package net.mickanel.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.mickanel.service.InfoService;

@Controller
//@RequestMapping("/hello") // Si besoin d'un niveau supplémentaire dans l'url
public class AppController {

	private final Logger logger = LoggerFactory.getLogger(AppController.class);
	private final InfoService infoService = new InfoService();

//	@Autowired
//	// constructor -- Ne sert pas !!!
//	public AppController(HelloWorldService helloWorldService) {
//		this.helloWorldService = helloWorldService;
//	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(Map<String, Object> model) {

		logger.debug("index() is executed!");

		model.put("title", infoService.getTitle(""));
		model.put("msg", infoService.getDesc());
		
		return "index";
	}
	
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello(Map<String, Object> model) {

		logger.debug("hello() is executed without name !");
		
		return "hello";
	}

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable("name") String name) {

		logger.info("Entrer dans hello() is executed - $name {}", name);
		logger.debug("hello() is executed - $name {}", name);

		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		model.addObject("title", infoService.getTitle(name));
		model.addObject("msg", infoService.getDesc());
		
		return model;

	}

}