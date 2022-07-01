package com.my.app.dao;

import java.util.List;

import com.my.app.domain.UserDto;

public interface UserDao {

	int insert(UserDto dto);

	UserDto select(String id);

	List<UserDto> selectAll();

	int update(UserDto dto);

	int delete(String id);

	int deleteAll();

	int count();

}