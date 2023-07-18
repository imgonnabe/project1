package com.qorlwn.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardController {
	// user > controller > service > dao > mybatis > db
	
	// autowired말고 resource로 연결
	@Resource(name = "boardService")
	private BoardService boardService;
	
	
	@GetMapping("/board")
	public String board(Model model) {
		// 서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardList());
		
		return "board";
	}
	
	// 파라미터로 들어오는 값 잡기
	@GetMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		String bno = request.getParameter("bno");
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
}
