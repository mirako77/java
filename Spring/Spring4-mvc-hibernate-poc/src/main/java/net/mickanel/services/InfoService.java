package net.mickanel.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class InfoService {

	private static final Logger logger = LoggerFactory.getLogger(InfoService.class);

	public String getDesc() {
		logger.debug("getDesc() is executed!");

		return "Maven + Spring4 MVC Example";
	}

	public String getTitle(String name) {
		logger.debug("getTitle() is executed! $name : {}", name);

		if(StringUtils.isEmpty(name)){
			return "Tonga Soa !!!";
		}else{
			return "Manahona " + name;
		}
	}

}