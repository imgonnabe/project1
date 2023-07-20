package com.qorlwn.pro1;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	// user > controller > service > dao > mybatis > db

	// autowired말고 resource로 연결
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Autowired
	private Util util;
	
	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardList());

		return "board";
	}

	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		// String bno = request.getParameter("bno");
		int bno = util.strToInt(request.getParameter("bno"));
		// System.out.println("bno : " + bno);
		BoardDTO dto = boardService.detail(bno);
		model.addAttribute("dto", dto);
		return "detail";
	}

	@GetMapping("/write")
	public String write() {
		return "write";
	}

	@PostMapping("/write")
	public String write(HttpServletRequest request) {
		// 사용자가 입력한 데이터 변수에 담기
		// System.out.println(request.getParameter("title"));
		// System.out.println(request.getParameter("content"));
		
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setBwrite("김길동");

		// service > dao > mybatis > db
		boardService.write(dto);

		return "redirect:board";// 다시 컨트롤러 지나가기(get방식)
	}
	
	// 게시물이 삭제된다면
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno) {// HttpServletRequest의 getParameter();
		// System.out.println("bno : " + bno);
		
		// dto
		BoardDTO dto = new BoardDTO();
		dto.setBno(bno);
		// dto.setBwrite(null);// 사용자 정보
		// 추후 로그인을 하면 사용자의 정보도 담아서 보낸다.
		boardService.delete(dto);
		return "redirect:board";//삭제 완료한 후에 다시 보드로 간다.
	}
	
	// 게시물이 수정된다면
	@GetMapping("/edit")
	public ModelAndView edit(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("edit");// edit.jsp 연다.
		// db에 bno를 보내서 dto를 얻어온다.
		// mv에 실어보낸다.
		BoardDTO dto = boardService.detail(util.strToInt(request.getParameter("bno")));
		mv.addObject("dto", dto);
		return mv;
	}
	
	@PostMapping("/edit")
	public String edit(BoardDTO dto) {
		// System.out.println("map : " + map);
		// System.out.println(dto.getBtitle());
		// System.out.println(dto.getBcontent());
		// System.out.println(dto.getBno());
		boardService.edit(dto);
		return "redirect:detail?bno=" + dto.getBno();
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
}
