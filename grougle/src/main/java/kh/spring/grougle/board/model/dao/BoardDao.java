package kh.spring.grougle.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.grougle.board.domain.Board;

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
	
	
	public List<Board> selectBoardListAll(){
		return sqlsession.selectList("Board.selectBoardListAll");
	}
	public Board selectBoard(String wb_no){
		return sqlsession.selectOne("Board.selectBoard", wb_no);
	}
	
	public int updateBoard(Board board) {
		return sqlsession.update("Board.updateBoard",board);
	}
	public int deleteBoard(String wb_no) {
		return sqlsession.delete("Board.deleteBoard",wb_no);
	}
	
}