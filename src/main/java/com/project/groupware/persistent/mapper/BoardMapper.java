package com.project.groupware.persistent.mapper;

import java.util.List;

import com.project.groupware.domain.BoardVO;

public interface BoardMapper {

	//게시판 등록
	public void insertBoard(BoardVO board);
	
	//게시판 목록조회
	public List<BoardVO> selectBoardList();
	
	//게시판 수정
	public void updateBoard(BoardVO board);	
	
	//게시판 삭제
	public void deleteBoard(int id);
	
	//게시판에 등록된 게시글 수를 구하는 매퍼 
	public int articleCount(int id);
	
	public BoardVO selectBoard(int boardId);
}
