package com.my.app;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.app.domain.LikeDto;
import com.my.app.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml", "file:src/main/webapp/WEB-INF/spring/**/spring-security.xml"})
public class BoardServiceTest {

	@Autowired
	BoardService boardService;
	
	@Test
	public void insertLikeTest() throws Exception{
		
		LikeDto dto = new LikeDto(221, "dlawogud", 1);
		
		assertTrue(boardService.insertLike(dto) == 1);
		
	}
	
	@Test
	public void updateLikeTest() throws Exception{
		
		LikeDto dto = new LikeDto(221, "dlawogud", 0);
		
		assertTrue(boardService.updateLike(dto) == 1);
		
	}

}
