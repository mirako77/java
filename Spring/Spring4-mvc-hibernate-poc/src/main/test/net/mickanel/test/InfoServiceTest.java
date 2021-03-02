package net.mickanel.test;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import net.mickanel.services.InfoService;

//@RunWith(SpringJUnit4ClassRunner.class)
//@Configuration(classes = AppConfig.class)
public class InfoServiceTest {

    @Autowired
    private InfoService infoService;

    @Test
    public void testGetDesc() {
    	String desc = infoService.getDesc();
    	Assert.assertEquals(desc, "Maven + Spring4 MVC Example");
    }
}