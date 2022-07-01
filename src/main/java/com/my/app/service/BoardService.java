package com.my.app.service;

import java.util.List;
import java.util.Map;

import com.my.app.domain.BoardDto;
import com.my.app.domain.LikeDto;
import com.my.app.domain.SearchCondition;

public interface BoardService {

	int write(BoardDto dto) throws Exception;

	List<BoardDto> getList() throws Exception;

	List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception;
	
	int getSearchResultCnt(SearchCondition sc) throws Exception;
	
	int modify(BoardDto boardDto) throws Exception;

	BoardDto read(int num) throws Exception;

	int remove(Map map) throws Exception;

	List<BoardDto> getPage(Map map) throws Exception;

	int getCount() throws Exception;

	int updateCommentCnt(Integer bno, Integer cnt) throws Exception;

	int updateViewCnt(Integer bno) throws Exception;

	int insertLike(LikeDto dto) throws Exception;

	int updateLike(LikeDto dto) throws Exception;

	Integer getLikeInfo(int bno, String userId) throws Exception;

	int updateLikeCnt(int bno, int cnt);

}