package com.my.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.app.dao.BoardDao;
import com.my.app.domain.BoardDto;
import com.my.app.domain.LikeDto;
import com.my.app.domain.SearchCondition;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public int write(BoardDto dto) throws Exception{
		
		return boardDao.insert(dto);
	}
	
	@Override
	public int getCount() throws Exception{
		
		return boardDao.count();
	}
	@Override
	public List<BoardDto> getList() throws Exception{

		return boardDao.selectAll();
	}
	
	@Override
	public List<BoardDto> getPage(Map map) throws Exception{
		
		return boardDao.selectPage(map);
	}
	
	@Override
	public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception{
		
		return boardDao.searchSelectPage(sc);
	}
	@Override
	public int getSearchResultCnt(SearchCondition sc) throws Exception{
		
		return boardDao.searchResultCnt(sc);
	}
	
	@Override
	public BoardDto read(int num) throws Exception{
		
		return boardDao.select(num);
	}
	
	@Override
	public int modify(BoardDto boardDto) throws Exception{
		
		return boardDao.update(boardDto);
	}
	
	@Override
	public int remove(Map map) throws Exception{
		
		return boardDao.delete(map);
	}
	
	@Override
	public int updateCommentCnt(Integer bno, Integer cnt) throws Exception{
		
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("cnt", cnt);
		
		return boardDao.updateCommentCnt(map);
	}
	
	@Override
	public int updateViewCnt(Integer bno) throws Exception{
		
		return boardDao.increaseViewCnt(bno);
	}
	
	@Override
	public int updateLikeCnt(int bno, int cnt) {
		
		HashMap map = new HashMap();
		map.put("bno", bno);
		map.put("cnt", cnt);
		
		return boardDao.updateLikeCnt(map);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) 
	public int insertLike(LikeDto dto) throws Exception{
		
		HashMap map = new HashMap();
		
		map.put("bno", dto.getBno());
		map.put("cnt", 1);
		
		boardDao.updateLikeCnt(map);
		
		return boardDao.insertLike(dto);
	}
	@Override
	@Transactional(rollbackFor = Exception.class) 
	public int updateLike(LikeDto dto) throws Exception{
		
		HashMap map = new HashMap();
		
		map.put("bno", dto.getBno());
		map.put("userId", dto.getUserId());
		
		boardDao.updateLike(dto);
		
		if(getLikeInfo(dto.getBno(), dto.getUserId()) == 1) {
			map.put("cnt", 1);
		}else {
			map.put("cnt", -1);
		}
		
		
		return boardDao.updateLikeCnt(map);
	}
	
	@Override
	public Integer getLikeInfo(int bno, String userId) throws Exception{
		
		HashMap map = new HashMap();
		
		map.put("bno", bno);
		map.put("userId", userId);
		
		return boardDao.selectLike(map);
	}
}
