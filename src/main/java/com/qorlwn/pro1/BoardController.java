package com.qorlwn.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
