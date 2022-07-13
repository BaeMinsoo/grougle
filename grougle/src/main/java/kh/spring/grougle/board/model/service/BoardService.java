package kh.spring.grougle.board.model.service;

import java.util.List;

import kh.spring.grougle.board.domain.Board;

public interface BoardService {
	/** 
	* @param board 게시글로 추가할 내용
	* @return 추가된 글개수
	* @author Grougle
	*/ 
	public int insertBoard(Board board);
	
	/** 
	* parameter : 수정할 글 내용 Board
	* return : 수정된 글의 개수
	*/ 
	public int updateBoard(Board board);
	/** 
	* parameter : 삭제할 글번호 하나
	* return : 삭제된 글의 개수
	*/ 
	public int deleteBoard(String wb_no); 
	
	/** 
	* parameter : 삭제할 글번호 리스트
	* return : 삭제된 글의 개수
	*/ 
	public int deleteBoard(List<String> wb_no); 

	public Board selectBoard(String wb_no);
	public List<Board> selectBoardListAll();
	
	/** 
	* @param pageNum 읽을 페이지
	* @param limit 읽을 게시글 수
	* @param searchWord 검색할 단어
	* @return 추가된 글개수
	*/ 
//	public List<Board> selectBoardListAll(int pageNum, int limit, String searchWord);
}
