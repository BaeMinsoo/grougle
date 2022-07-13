package kh.spring.grougle.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.grougle.board.domain.Board;
import kh.spring.grougle.board.model.service.BoardService;
import kh.spring.grougle.board.model.service.BoardServiceImpl;
import kh.spring.grougle.employee.controller.EmployeeController;
import kh.spring.grougle.employee.domain.Employee;

	@Controller
	@RequestMapping("/board")
	public class BoardController {
		
		private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
		
		@Autowired
		private BoardService service;
		
		@GetMapping("/write")
		public ModelAndView pageInsert(
				ModelAndView mv
				, @RequestParam(name="refnum", defaultValue = "0") String refnumStr
				) {
			int refnum = 0;
			try {
				refnum = Integer.parseInt(refnumStr);
			}catch (Exception e) {
			}
			mv.addObject("refnum", refnum);
			mv.setViewName("board/insert");
			return mv;
		}
		@PostMapping("/write")
		public ModelAndView insert(
				ModelAndView mv
				, Board board
				, HttpSession session
				, HttpServletRequest req
				) {
			// 로그인 정보 확인하여 작성자
			Employee emp = (Employee) session.getAttribute("loginSsInfo");
			if (emp == null) { 
				mv.setViewName("redirect:/Employee/login");
				return mv;
			}
			board.setWb_writer(emp.getEmp_id());
			
			// DB글 insert
			int result = service.insertBoard(board);
			mv.setViewName("redirect:/");
			return mv;
		}
		
		@GetMapping("/list")
		public ModelAndView selectList(ModelAndView mv) {
			
			mv.addObject("boardlist", service.selectBoardListAll());
			mv.setViewName("board/list");
			return mv;
		}
		@GetMapping("/read")
		public ModelAndView selectBoard(ModelAndView mv
				, @RequestParam(name="wb_no", required = false) String wb_no
				, RedirectAttributes rttr
				) {
			if(wb_no == null) {
				rttr.addFlashAttribute("msg", "읽을 글번호가 없습니다. 읽을 글을 다시 선택해주세요");
				mv.setViewName("redirect:/board/list");
			}
			mv.addObject("board", service.selectBoard(wb_no));
			mv.setViewName("board/read");
			return mv;
		}
		
		@PostMapping("/update")
		public ModelAndView pageupdateBoard(
				ModelAndView mv
				, @RequestParam("wb_no") String wb_no
				) {
			mv.addObject("board", service.selectBoard(wb_no));
			mv.setViewName("board/update");
			return mv;
		}
		
		@PostMapping("/updateDo")
		public ModelAndView updateBoard(
				ModelAndView mv
				, Board board
				, HttpServletRequest req
				) {
							
			// DB글 update
			int result = service.updateBoard(board);
			mv.setViewName("board/list");
			return mv;
		}

		@GetMapping("/delete")
		public ModelAndView pagedeleteBoard(
				ModelAndView mv
				) {
			//TODO
			mv.setViewName("board/delete");
			return mv;
		}
				
	}