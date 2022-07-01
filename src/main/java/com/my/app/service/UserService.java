package com.my.app.service;

import java.util.List;

import com.my.app.domain.UserDto;

public interface UserService {

	int registerUser(UserDto dto) throws Exception;

	UserDto getUser(String id) throws Exception;

	List<UserDto> getUsers() throws Exception;

	int amendUser(UserDto dto) throws Exception;

	int removeUser(String id) throws Exception;

	int countUser() throws Exception;

	int removeAllUser() throws Exception;

	boolean idCheck(String id, String pwd) throws Exception;

}