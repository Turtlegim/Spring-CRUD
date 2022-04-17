package net.developia.project.service;

import java.util.List;

import net.developia.project.dto.BoardDTO;

public interface BoardService {

	void insertBoard(BoardDTO boardDTO) throws Exception;

	List<BoardDTO> getBoardList() throws Exception;
	
	BoardDTO getDetail(long no) throws Exception;

	void deleteBoard(BoardDTO boardDTO) throws Exception;

	void updateBoard(BoardDTO boardDTO) throws Exception;

	List<BoardDTO> getBoardListPage(long pg, long new_no) throws Exception;

	long getBoardCount(long new_no) throws Exception;

	List<BoardDTO> searchBoardListPage(long pg, long new_no, String searchType, String searchword) throws Exception;

	long searchBoardCount(long new_no, String searchType, String searchword) throws Exception;

}