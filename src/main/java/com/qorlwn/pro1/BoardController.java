package com.qorlwn.pro1;

import javax.annotation.Resource;

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
}
