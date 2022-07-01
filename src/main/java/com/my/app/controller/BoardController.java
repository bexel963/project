package com.my.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.app.domain.BoardDto;
import com.my.app.domain.CommentDto;
import com.my.app.domain.LikeDto;
import com.my.app.domain.PageHandler;
import com.my.app.domain.SearchCondition;
import com.my.app.service.BoardService;
import com.my.app.service.CommentService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(SearchCondition sc, HttpServletRequest request, Model m, RedirectAttributes rattr) {
		
		try {
			if(!loginCheck(request)) {   
				rattr.addFlashAttribute("msg", "LOGIN_ERR_toBoard");
				return "redirect:/login?toURL="+request.getRequestURL();
			}
			
			int totalCnt = boardService.getSearchResultCnt(sc);
			
			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			
			List<BoardDto> list = boardService.getSearchResultPage(sc);
			
			m.addAttribute("list", list);
			m.addAttribute("ph", pageHandler);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/board/boardList";
	}
	
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(SearchCondition sc, Integer bno, Model m, HttpServletRequest request) {
		
		try {
			HttpSession session = request.getSession();

			String id = (String)session.getAttribute("id");
			
			Integer likeInfo = boardService.getLikeInfo(bno, id);
			if(likeInfo != null) {				
				m.addAttribute("likeInfo", likeInfo);
			}
			BoardDto dto = boardService.read(bno);
			List<CommentDto> clist = commentService.getList(bno);
			boardService.updateViewCnt(bno);
			m.addAttribute("clist", clist);
			m.addAttribute("dto", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}		
		m.addAttribute("page", sc.getPage());
		m.addAttribute("pageSize", sc.getPageSize());
		m.addAttribute("like", "like");
		StringBuffer url = request.getRequestURL();
		m.addAttribute("url", url);
		
		return "/board/boardDetail";
	}
	
	@RequestMapping(value="/boardWrite", method=RequestMethod.GET)
	public String toBoardRegisForm() {
		
		return "/board/boardRegis";
	}
	
	@RequestMapping(value="/goBoardWrite", method=RequestMethod.POST)
	public String goRegis(BoardDto dto, RedirectAttributes rattr, Model m) {
		
		try {
			int rowCnt = boardService.write(dto);
			
			if(rowCnt != 1)
				throw new Exception("Write failed");
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("dto", dto); 
			rattr.addFlashAttribute("msg", "WRT_ERROR ");
			return "/board/boardRegis";
		}
		
		return "redirect:/boardList";
	}
	
	@RequestMapping(value="/boardAmend", method=RequestMethod.GET)
	public String amend(int bno, Model m) {
		
		BoardDto dto;
		try {
			dto = boardService.read(bno);
			m.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return "/board/boardModify";
	}
	
	@RequestMapping(value="/goBoardAmend", method=RequestMethod.POST)
	public String amendPost(BoardDto dto, RedirectAttributes rattr) {
		
		
		try {
			boardService.modify(dto);
			rattr.addFlashAttribute("msg", "AMEND_OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/boardList";
	}
	
	@RequestMapping(value="/boardRemove", method=RequestMethod.POST)
	public String remove(SearchCondition sc, Integer bno, Model m, HttpSession session, RedirectAttributes rattr) {
		
		String writer = (String)session.getAttribute("id");
		
		Map map = new HashMap();
		
		map.put("bno", bno);
		map.put("writer", writer);
		
		try {
			m.addAttribute("page", sc.getPage());
			m.addAttribute("pageSize", sc.getPageSize());
			
			int rowCnt = boardService.remove(map);
			
			if(rowCnt!=1) {
				throw new Exception("board remove error");
			}
			
			rattr.addFlashAttribute("msg", "DEL_OK");	// 세션에 잠깐 저장했다가 한번 쓰고 지워버린다.
			
		} catch (Exception e) {
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "DEL_ERR");
		}
		
		return "redirect:/boardList";
	}
	
	@RequestMapping(value="/like", method = RequestMethod.POST)		
	@ResponseBody
	public int likeChange(@RequestBody LikeDto dto)  {
		
		Integer result = 0;
		
		try {
			result = boardService.getLikeInfo(dto.getBno(), dto.getUserId());
			if(result == null) {
				dto.setLiked(1);
				boardService.insertLike(dto);
				result = boardService.getLikeInfo(dto.getBno(), dto.getUserId());
				return result;
			}
			if(dto.getLiked() == 0) {
				dto.setLiked(1);
				boardService.updateLike(dto);
				result = boardService.getLikeInfo(dto.getBno(), dto.getUserId());
				return result;
			}
			if(dto.getLiked() == 1) {
				dto.setLiked(0);
				boardService.updateLike(dto);
				result = boardService.getLikeInfo(dto.getBno(), dto.getUserId());
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	private boolean loginCheck(HttpServletRequest request) {

		HttpSession session = request.getSession();

		return session.getAttribute("id") != null;
	}
}
