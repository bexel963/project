package com.my.app;

import static org.junit.Assert.assertTrue;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)		
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DBConnectionTest {

	@Autowired
	DataSource ds;
	
	// Test 메서드들은 각각 별도의 객체에서 실행을 시킨다.
	// 그래서 ds가 iv이긴 해도, 같은 클래스에 있는 각 테스트 메서드들이 이 ds를 공유하지 않는다.
	
	// Test 메서드는 public 이어야함.
	@Test
    public void springjdbcConnectionTest() throws Exception {
      
        Connection conn = ds.getConnection(); 

        System.out.println("conn = " + conn);
        
        assertTrue(conn!=null); 	   
		
		System.out.println(ds);
	}

}
