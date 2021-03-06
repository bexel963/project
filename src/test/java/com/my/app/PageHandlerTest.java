package com.my.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.app.domain.PageHandler;
import com.my.app.domain.SearchCondition;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml", "file:src/main/webapp/WEB-INF/spring/**/spring-security.xml"})
public class PageHandlerTest {

	
	@Test
	public void test() {

		SearchCondition sc = new SearchCondition();
		
		PageHandler pageHandler = new PageHandler(220, sc);
		
		System.out.println(pageHandler);
		pageHandler.print();
	}

}
