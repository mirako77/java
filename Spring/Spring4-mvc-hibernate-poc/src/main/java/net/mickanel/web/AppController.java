package net.mickanel.web;

import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.mickanel.service.InfoService;

@Controller
@RequestMapping("/info") // niveau supplémentaire {{ info }} dans l'url
public class AppController {

	private final Logger logger = LoggerFactory.getLogger(AppController.class);
	private static final String INDEX_VIEW = "index";
	private final InfoService infoService = new InfoService();

	@GetMapping(path = "")
	public String index(Map<String, Object> model) {
		logger.debug("index() is executed!");

		model.put("title", infoService.getTitle(""));
		model.put("msg", infoService.getDesc());
		
		return INDEX_VIEW;
	}
	
	@GetMapping(value = "/locale")
	public String locale(Locale locale) {
		logger.info("locale() is executed ! The client locale is {}.", locale);
		return "locale";
	}
	
	@GetMapping(value = "/hello")
	public String hello(Map<String, Object> model) {

		logger.debug("hello() is executed without name !");
		
		return INDEX_VIEW;
	}

	@GetMapping(value = "/hello/{name:.+}")
	public ModelAndView hello(@PathVariable("name") String name) {

		logger.info("Entrer dans hello() is executed - $name {}", name);
		logger.debug("hello() is executed - $name {}", name);

		ModelAndView model = new ModelAndView();
		model.setViewName(INDEX_VIEW);
		
		model.addObject("title", infoService.getTitle(name));
		model.addObject("msg", infoService.getDesc());
		
		return model;

	}

}