package kh.spring.grougle.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.board.domain.Board;
import kh.spring.grougle.board.domain.BoardComment;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlsession;
	
	// 원글
	public int insertBoard(Board board) {
		return sqlsession.insert("Board.insertBoard",board);
	}
	// 답글-seq업데이트
	public int updateBoardReplySeq(Board board) {
		return sqlsession.update("Board.updateBoardReplySeq",board);
	}
	// 답글
	public int insertBoardReply(Board board) {
		return sqlsession.insert("Board.insertBoardReply2",board);
	}
		
	public List<Board> selectBoardListAll(int currentPage, int pageSize){
		return sqlsession.selectList("Board.selectBoardListAll", null, new RowBounds((currentPage-1)*pageSize , pageSize));
	}
	public Board selectBoard(String wb_no){
		return sqlsession.selectOne("Board.selectBoard", wb_no);
	}
	public Board selectBoard(int wb_no) {
		return sqlsession.selectOne("Board.selectBoard", wb_no);
	}
	
	public int updateBoard(Board board) {
		return sqlsession.update("Board.updateBoard",board);
	}
	public int deleteBoard(String wb_no) {
		return sqlsession.delete("Board.deleteBoard",wb_no);
	}
	public int selectMaxWbNo() {
		return sqlsession.selectOne("Board.selectMaxWbNo");
	}
	public int selectTotalCnt() {
		return sqlsession.selectOne("Board.selectTotalCnt");
	}
	public List<Board> selectBoardList(int currentPage, int pageSize){
		return sqlsession.selectList("Board.selectBoardList", null, new RowBounds((currentPage-1)*pageSize , pageSize));
	}
	public Board selectBoardAndReComment(String wb_no){
		Board board = sqlsession.selectOne("Board.selectBoard", wb_no);
		board.setReCommentList(sqlsession.selectList("Board.selectReCommentList", wb_no));
		return board;
	}
	
	// 조회수
	public void updateReviewCnt(String wb_no) throws Exception {		
		sqlsession.update("Board.updateReviewCnt", wb_no);
	}
	
	// 댓글 조회
	public List<BoardComment> readReply(String wb_no) {
		return sqlsession.selectList("Board.readReply", wb_no);
	}
	// 댓글 작성
	public int writeReply(BoardComment boardCmt) {
		return sqlsession.insert("Board.writeReply", boardCmt);
	}
	// 댓글 수정
	public int updateReply(BoardComment boardCmt) {
		return sqlsession.update("Board.updateReply", boardCmt);
	}
	// 댓글 삭제
	public int deleteReply(BoardComment boardCmt) {
		return sqlsession.delete("Board.deleteReply", boardCmt);
	}
	// 선택된 댓글 조회
	public BoardComment selectReply(String wbc_no) {
		return sqlsession.selectOne("Board.selectReply", wbc_no);
	}
	
	
	
	
}
