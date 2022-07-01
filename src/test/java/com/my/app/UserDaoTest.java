package com.my.app;

import static org.junit.Assert.assertTrue;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.app.dao.UserDao;
import com.my.app.domain.UserDto;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml", "file:src/main/webapp/WEB-INF/spring/**/spring-security.xml"})
public class UserDaoTest {

	@Autowired
	UserDao userDao;
	
	@Test
	public void connect() {
		
		assertTrue(userDao != null);
		System.out.println("boardDao = " + userDao);
	}
	
	@Test
	public void insertTest() {
		
		userDao.deleteAll();
		assertTrue(userDao.count() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));
		
		cal.clear();
		cal.set(1992, 8, 16);
		UserDto dto2 = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		System.out.println("dto = " + dto);
		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.insert(dto2) == 1);
	}
	
	@Test
	public void selectTest() {
		
		userDao.deleteAll();
		assertTrue(userDao.count() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 1);
		
		cal.clear();
		cal.set(1992, 8, 16);
		dto = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 2);
		
		UserDto dto2 = userDao.select("asdf");
		
		System.out.println("dto = " + dto);
		System.out.println("dto2 = " + dto2);
		assertTrue(dto.getName().equals(dto2.getName()));
	}
	
	@Test
	public void selectAllTest() {
		
		userDao.deleteAll();
		assertTrue(userDao.count() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 1);
		
		cal.clear();
		cal.set(1992, 8, 16);
		dto = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 2);
		
		assertTrue(userDao.selectAll().size() == 2);
	}
	@Test
	public void updateTest() {
		
		userDao.deleteAll();
		assertTrue(userDao.count() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 1);
		
		dto.setGrade(0);
		assertTrue(userDao.update(dto) == 1);
	}
	
	@Test
	public void delete() {
		
		userDao.deleteAll();
		assertTrue(userDao.count() == 0);
		
		Calendar cal = Calendar.getInstance();
		cal.clear();
		cal.set(1990, 1, 16);
		
		UserDto dto = new UserDto("qwer", "1234", "홍길동", "청주시 서원구 수곡2동, 세원홍실 101동 408호", "010-5608-0601", "sdfsr@naver.com", new Date(cal.getTimeInMillis()));

		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 1);
		
		cal.set(1999, 3, 15);
		dto = new UserDto("asdf", "4567", "임꺽정", "충남시 탕정면 탕정동, 프루지오 101동 408호", "010-4321-6781", "ppprty@naver.com", new Date(cal.getTimeInMillis()));
		assertTrue(userDao.insert(dto) == 1);
		assertTrue(userDao.count() == 2);
		
		assertTrue(userDao.delete("asdf") == 1);
	}

}
