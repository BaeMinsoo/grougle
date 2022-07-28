package kh.spring.grougle.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.grougle.board.model.dao.BoardDao;
import kh.spring.grougle.board.domain.Board;
import kh.spring.grougle.board.domain.BoardComment;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;

	@Override
	public int insertBoard(Board board) {
		if (board.getRefnum() > 0) {
			// 답글
			dao.updateBoardReplySeq(board);
			return dao.insertBoardReply(board);
		} else {
			// 원글
			return dao.insertBoard(board);
		}
	}

	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(String wb_no) {
		return dao.deleteBoard(wb_no);
	}

	@Override
	public Board selectBoard(String wb_no) {
		return dao.selectBoard(wb_no);
	}

	@Override
	public List<Board> selectBoardListAll(int currentPage, int pageSize) {
		return dao.selectBoardListAll(currentPage, pageSize);
	}

	@Override
	public int selectMaxWbNo() {
		return dao.selectMaxWbNo();
	}

	@Override
	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}

	@Override
	public List<Board> selectBoardList(int currentPage, int pageSize) {
		return dao.selectBoardList(currentPage, pageSize);
	}

	@Override
	public Board selectBoardAndReComment(String wb_no) {
		return dao.selectBoardAndReComment(wb_no);
	}

	// 게시물 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Board updateReviewCnt(String wb_no) throws Exception {
		 dao.updateReviewCnt(wb_no);
		return dao.selectBoard(wb_no);
	}
	
	// 댓글 목록
	@Override
	public List<BoardComment> readReply(String wb_no) throws Exception {
		return dao.readReply(wb_no);
	}
	
	// 댓글 작성
	@Override
	public void writeReply(BoardComment boardCmt) throws Exception {
		dao.writeReply(boardCmt);
	}

	// 댓글 수정
	@Override
	public void updateReply(BoardComment boardCmt) throws Exception {
		dao.updateReply(boardCmt);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(BoardComment boardCmt) throws Exception {
		dao.deleteReply(boardCmt);
	}

	// 선택된 댓글 조회
	@Override
	public BoardComment selectReply(String wbc_no) throws Exception {
		return dao.selectReply(wbc_no);
	}	

	
}