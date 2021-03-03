package net.mickanel.test;

import static org.hamcrest.MatcherAssert.assertThat;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.mickanel.services.InfoService;
import net.mickanel.test.cfg.AppConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {AppConfig.class})
/**
 * vu sur : https://mkyong.com/unittest/junit-spring-integration-example/
 * 
 * @author mickado
 *
 */
public class InfoServiceTest {

    @Autowired
    private InfoService infoService;

    @Test
    public void testGetDesc() {
//    	org.hamcrest.MatcherAssert.assertThat(InfoService, instanceof(InfoService.class));
    	
    	String desc = infoService.getDesc();
    	Assert.assertEquals(desc, "Maven + Spring4 MVC Example");
    }
}