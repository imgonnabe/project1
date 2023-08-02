package com.qorlwn.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qorlwn.board.BoardService;
import com.qorlwn.login.LoginService;

@RestController
public class RestController01 {
	
	@Autowired
	private LoginService loginService;

	// 아이디 중복검사
	// @ResponseBody // jsp호출 안하고 결과값을 body에 찍는다.
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		int result = loginService.checkID(id);
		// json
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();// {"result":1}
	}
	
	@GetMapping("/boardList2")
	public String boardList2() {
		List<Map<String, Object>> list = loginService.boardList2();
		System.out.println(list);
		return "";
	}
}
