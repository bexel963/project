package com.my.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.app.dao.UserDao;
import com.my.app.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	UserDao userDao;
	
	@Override
	public boolean idCheck(String id, String pwd) throws Exception {
		
		boolean check = false;
		
		UserDto dto = getUser(id);
		
		if(dto!=null && passwordEncoder.matches(pwd, dto.getPwd())){
			check = true;
		}
		return check;
	}
	@Override
	public int registerUser(UserDto dto) throws Exception{
		
		String pwd = dto.getPwd();
		String encPw = passwordEncoder.encode(pwd);
		dto.setPwd(encPw);
		
		return userDao.insert(dto);
	}
	
	@Override
	public int countUser() throws Exception{
		
		return userDao.count();
	}
	@Override
	public UserDto getUser(String id) throws Exception{
		
		return userDao.select(id);
	}
	
	@Override
	public List<UserDto> getUsers() throws Exception{
		
		return userDao.selectAll();
	}
	
	@Override
	public int amendUser(UserDto dto) throws Exception{
		
		return userDao.update(dto);
	}
	
	@Override
	public int removeUser(String id) throws Exception{
		
		return userDao.delete(id);
	}
	
	@Override
	public int removeAllUser() throws Exception{
		
		return userDao.deleteAll();
	}
}
