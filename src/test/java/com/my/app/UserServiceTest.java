package com.my.app;

import static org.junit.Assert.assertTrue;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.app.domain.UserDto;
import com.my.app.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml", "file:src/main/webapp/WEB-INF/spring/**/spring-security.xml"})
public class UserServiceTest {

	@Autowired
	UserService userService;
	
	@Test
	public void connect() {
		
		assertTrue(userService != null);
		System.out.println("userService = " + userService);
	}
	
	@Test
	public void registerUserTest() throws Exception{
		
		userService.removeAllUser();
		assertTrue(userService.countUser() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));
		
		cal.clear();
		cal.set(1992, 8, 16);
		UserDto dto2 = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		System.out.println("dto = " + dto);
		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.registerUser(dto2) == 1);
	}
	
	@Test
	public void getUserTest() throws Exception{
		
		userService.removeAllUser();
		assertTrue(userService.countUser() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 1);
		
		cal.clear();
		cal.set(1992, 8, 16);
		dto = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 2);
		
		UserDto dto2 = userService.getUser("asdf");
		
		System.out.println("dto = " + dto);
		System.out.println("dto2 = " + dto2);
		assertTrue(dto.getName().equals(dto2.getName()));
	}
	
	@Test
	public void getUsersTest() throws Exception{
		
		userService.removeAllUser();
		assertTrue(userService.countUser() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 1);
		
		cal.clear();
		cal.set(1992, 8, 16);
		dto = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 2);
		
		assertTrue(userService.getUsers().size() == 2);
	}
	@Test
	public void amendUserTest() throws Exception{
		
		userService.removeAllUser();
		assertTrue(userService.countUser() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 1);
		
		dto.setGrade(0);
		assertTrue(userService.amendUser(dto) == 1);
	}
	
	@Test
	public void removeUser() throws Exception{
		
		userService.removeAllUser();
		assertTrue(userService.countUser() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 1);
		
		cal.set(1999, 3, 15);
		dto = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		assertTrue(userService.registerUser(dto) == 1);
		assertTrue(userService.countUser() == 2);
		
		assertTrue(userService.removeUser("asdf") == 1);
	}
}
