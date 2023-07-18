package com.qorlwn.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	// 첫화면 로딩: index.jsp호출
	@GetMapping(value = { "/", "/index" })
	public String index() {
		return "index";// 데이터 붙임 없이 index.jsp페이지만 보여준다.
	}

	@GetMapping("/board2")
	public String board2() {
		return "board2";
	}

	@GetMapping("/mooni")
	public String mooni() {
		return "mooni";
	}

	@GetMapping("/notice")
	public String notice() {
		return "notice";
	}
}
