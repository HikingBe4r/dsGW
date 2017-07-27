package com.project.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.BoardVO;
import com.project.groupware.persistent.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	public void registerBoard(BoardVO board) {
		boardMapper.insertBoard(board);
	}

	public List<BoardVO> retrieveBoardList() {
		return boardMapper.selectBoardList();
	}

	public void modifyBoard(BoardVO board) {
		boardMapper.updateBoard(board);
		
	}

	public void removeBoard(int id) {
		boardMapper.deleteBoard(id);
		
	}
	
	//게시판에 등록된 게시글 수를 구하는 매퍼 
	public int articleCount(int id) {
		return boardMapper.articleCount(id);
	}
	
	
	
}
