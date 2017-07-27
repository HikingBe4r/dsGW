package com.project.groupware.service;

import java.util.List;

import com.project.groupware.domain.BoardVO;

public interface BoardService {

	//게시판 등록
	public void registerBoard(BoardVO board);
	
	//게시판 리스트
	public List<BoardVO> retrieveBoardList();
	
	//게시판 수정
	public void modifyBoard(BoardVO board);
	
	//게시판 삭제
	public void removeBoard(int id);
 	
 	//게시판에 등록된 게시글 수를 구하는 매퍼 
	public int articleCount(int id);
	 
}
