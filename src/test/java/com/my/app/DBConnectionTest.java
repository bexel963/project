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
	
	// Test �޼������ ���� ������ ��ü���� ������ ��Ų��.
	// �׷��� ds�� iv�̱� �ص�, ���� Ŭ������ �ִ� �� �׽�Ʈ �޼������ �� ds�� �������� �ʴ´�.
	
	// Test �޼���� public �̾����.
	@Test
    public void springjdbcConnectionTest() throws Exception {
      
        Connection conn = ds.getConnection(); 

        System.out.println("conn = " + conn);
        
        assertTrue(conn!=null); 	   
		
		System.out.println(ds);
	}

}
