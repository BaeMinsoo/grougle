package kh.spring.grougle.board.model.service;

import java.util.List;
import java.util.Map;

import kh.spring.grougle.board.domain.Board;
import kh.spring.grougle.board.domain.BoardComment;


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

	public Board selectBoard(String wb_no);
	// 조회수 증가
	public Board updateReviewCnt(String wb_no) throws Exception;
	
	public List<Board> selectBoardListAll(int currentPage, int pageSize);
	public int selectMaxWbNo();

	public int selectTotalCnt();

	public List<Board> selectBoardList(int currentPage, int pageSize);
	
	public Board selectBoardAndReComment(String wb_no);
	/** 
	* @param pageNum 읽을 페이지
	* @param limit 읽을 게시글 수
	* @param searchWord 검색할 단어
	* @return 추가된 글개수
	* @throws Exception 
	*/

	
		//댓글 조회
		public List<BoardComment> readReply(String wb_no) throws Exception;
		
		//댓글 작성
		public void writeReply(BoardComment boardCmt) throws Exception;
		
		//댓글 수정
		public void updateReply(BoardComment boardCmt) throws Exception;
		
		//댓글 삭제
		public void deleteReply(BoardComment boardCmt) throws Exception;
			
		//선택된 댓글 조회
		public BoardComment selectReply(String wbc_no) throws Exception;

	
		
}
