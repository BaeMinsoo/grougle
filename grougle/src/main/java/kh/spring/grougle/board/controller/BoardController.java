package kh.spring.grougle.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.grougle.board.domain.Board;
import kh.spring.grougle.board.domain.BoardComment;
import kh.spring.grougle.board.domain.BoardFile;
import kh.spring.grougle.board.model.dao.BoardDao;
import kh.spring.grougle.board.model.service.BoardService;
import kh.spring.grougle.common.FileUpload;
import kh.spring.grougle.employee.controller.EmployeeController;
import kh.spring.grougle.employee.domain.Employee;


@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private BoardService service;

	@Autowired
	private BoardDao dao;

	@Autowired
	private FileUpload commonFile;

	// 게시글 작성
	@GetMapping("/write")
	public ModelAndView pageInsert(ModelAndView mv,
			@RequestParam(name = "refnum", defaultValue = "0") String refnumStr) {
		int refnum = 0;
		try {
			refnum = Integer.parseInt(refnumStr);
		} catch (Exception e) {
		}
		mv.addObject("refnum", refnum);
		mv.setViewName("board/insert");
		return mv;
	}

	@PostMapping("/write")
	@ResponseBody
	@Transactional
	public ModelAndView insertBoard(ModelAndView mv, Board board, BoardFile boradfile,
			@RequestParam(name = "uploadfile", required = false) MultipartFile uploadfile, HttpSession session,
			HttpServletRequest req) {
		// 로그인 정보 확인하여 작성자
		Employee emp = (Employee) session.getAttribute("loginSsInfo");
		if (emp == null) {
			mv.setViewName("redirect:/Employee/login");
			return mv;
		}
		board.setWb_writer(emp.getEmp_id());

		// 첨부파일있다면 첨부파일 저장
		if (uploadfile != null) {
			String rename_filename = commonFile.saveFile(uploadfile, req);
			if (rename_filename != null) {
				// 파일저장에 성공하면 DB에 저장할 데이터를 채워줌
				board.setWb_rename_filename(rename_filename);
				board.setWb_original_filename(uploadfile.getOriginalFilename());
			}
		}

		// DB글 insert
		int result = service.insertBoard(board);
		mv.setViewName("redirect:/board/list");
		return mv;
	}

	// 게시판 리스트
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(name = "page", defaultValue = "1") int currentPage, ModelAndView mv,
			HttpServletRequest req) {

		final int pageSize = 10;
		final int pageBlock = 5;
		int totalCnt = service.selectTotalCnt();

		// paging 처리
		int pageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}

		List<Board> Boardlist = service.selectBoardListAll(currentPage, pageSize);
		mv.addObject("boardlist", Boardlist);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("currentPage", currentPage);
		// mv.addObject("boardlist", service.selectBoardListAll());
		mv.setViewName("board/list");
		return mv;
	}

	// 게시글 읽기
	@GetMapping("/read")
	public ModelAndView selectBoard(
			ModelAndView mv
			, Model model
			, @RequestParam(name = "wb_no", required = false) String wb_no
			, RedirectAttributes rttr) throws Exception {
		logger.info("selectBoard");
		if (wb_no == null) {
			rttr.addFlashAttribute("msg", "읽을 글번호가 없습니다. 읽을 글을 다시 선택해주세요");
			mv.setViewName("redirect:/board/list");
		}
		model.addAttribute("board", service.updateReviewCnt(wb_no));
		mv.addObject("board", service.selectBoard(wb_no));
		mv.setViewName("board/read");
		return mv;
	}

	// 게시글 수정
	@GetMapping("/update")
	public ModelAndView pageupdateBoard(ModelAndView mv, @RequestParam("wb_no") String wb_no) {
		mv.addObject("board", service.selectBoard(wb_no));
		mv.setViewName("board/update");
		return mv;
	}

	@PostMapping("/updateDo")
	public ModelAndView updateBoard(ModelAndView mv, Board board,
			@RequestParam(name = "uploadfile", required = false) MultipartFile uploadfile, HttpServletRequest req) {

		String before_rename_filename = board.getWb_rename_filename();
		String before_original_filename = board.getWb_original_filename();

		// 변경할첨부파일 있다면 첨부파일 저장
		if (uploadfile != null) {
			String rename_filename = commonFile.saveFile(uploadfile, req);
			if (rename_filename != null) {
				// 파일저장에 성공하면 DB에 저장할 데이터를 채워줌
				board.setWb_original_filename(uploadfile.getOriginalFilename());
				board.setWb_rename_filename(rename_filename);

				// 기존 파일 있다면 파일서버에서 삭제함
				if (before_rename_filename != null && !before_rename_filename.equals("")) {
					commonFile.removeFile(before_rename_filename, req);
				}
			}
		}
		// 변경할첨부파일 없고 기존첨부파일명도 삭제되어있다면 기존 파일 삭제하고 업데이트해야함.
		else if (before_original_filename == null || before_original_filename.equals("")) {
			board.setWb_original_filename(null);
			board.setWb_rename_filename(null);
			if (before_rename_filename != null && !before_rename_filename.equals("")) {
				commonFile.removeFile(before_rename_filename, req);
			}
		}

		// DB글 update
		int result = service.updateBoard(board);
		mv.setViewName("redirect:/board/list");
		return mv;
	}

	// 게시글 삭제
	// ajax방식-@ResponseBody, 한글깨짐 produces ="text/plain;charset=UTF-8"추가
	@GetMapping("/delete")
	public ModelAndView pagedeleteBoard(ModelAndView mv) {
		mv.setViewName("board/delete");
		return mv;
	}

	@PostMapping(value = "/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteBoard(@RequestParam(name = "wb_no", required = false) String wb_no) {
		int result = service.deleteBoard(wb_no);
		String msg = "";
		if (result > 0) {
			msg = "게시글 " + wb_no + "번 삭제 되었습니다.";
		} else {
			msg = "게시글이 삭제되지 못했습니다. 다시 확인하고 삭제해주세요.";
		}
		return msg;
	}

	// 파일 업로드
	@RequestMapping(value = "fileupload", method = RequestMethod.POST)
	@ResponseBody
	public String fileupload(MultipartHttpServletRequest files) {
		Map<String, Object> file = new HashMap<String, Object>();
		// 저장된 파일 경로+이름 저장용
		List<Map<String, Object>> file_list = new ArrayList<Map<String, Object>>();
		// 파일 추출
		Map<String, MultipartFile> map = files.getFileMap();
		for (int i = 0; i < map.size(); i++) {
			file_list.add(savefile(map.get("files[" + i + "]"), files));
		}

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String str = gson.toJson(file_list);
		return str;
	}

	// 파일 저장
	public Map<String, Object> savefile(MultipartFile report, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String realPath = request.getSession().getServletContext().getRealPath("");
		long timeForRename = System.currentTimeMillis();
		String savePath = "resources\\uploadFiles";
		File folder = new File(realPath + savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String newName = timeForRename + "_" + report.getOriginalFilename();
		String filePath = realPath + savePath + "\\" + newName;
		try {
			report.transferTo(new File(filePath));// 파일 저장

		} catch (IllegalStateException e) {
			// 파일저장 실패
			e.printStackTrace();
		} catch (IOException e) {
			// 파일저장 실패
			e.printStackTrace();
		}
		// 파일저장 실패시 null, 성공시 저장한 파일경로와 파일명
		map.put("shf_realname", report.getOriginalFilename());
		map.put("shf_newname", newName);
		map.put("shf_path", "/resources/uploadFiles/");
		return map;
	}

	// --------------------------------------2022-07-19-------------------------------------------

	// 댓글 작성
		@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
		public String replyWrite(
				BoardComment boardCmt
				, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");

			service.writeReply(boardCmt);

			rttr.addAttribute("wb_no", boardCmt.getWbc_no());
			return "redirect:/board/read";
		}

		// 댓글 수정 GET
		@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
		public String replyUpdateView(BoardComment boardCmt, Model model) throws Exception {
			logger.info("reply Write");

			model.addAttribute("replyUpdate", service.selectReply(boardCmt.getWbc_no()));

			return "board/replyUpdateView";
		}

		// 댓글 수정 POST
		@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(BoardComment boardCmt, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");

			service.updateReply(boardCmt);

			rttr.addAttribute("wb_no", boardCmt.getWb_no());

			return "redirect:/board/read";
		}

		// 댓글 삭제 GET
		@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
		public String replyDeleteView(BoardComment boardCmt, Model model) throws Exception {
			logger.info("reply Write");

			model.addAttribute("replyDelete", service.selectReply(boardCmt.getWbc_no()));

			return "board/replyDelete";
		}

		// 댓글 삭제
		@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
		public String replyDelete(BoardComment boardCmt, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");

			service.deleteReply(boardCmt);

			rttr.addAttribute("wb_no", boardCmt.getWb_no());

			return "redirect:/board/read";
		}

}