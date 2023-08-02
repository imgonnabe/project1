package com.qorlwn.rest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qorlwn.login.LoginService;

@Controller
public class RestController {
	
	@Autowired
	private LoginService loginService;

	// 아이디 중복검사
	@ResponseBody // jsp호출 안하고 결과값을 body에 찍는다.
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		int result = loginService.checkID(id);
		// json
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();// {"result":1}
	}
}
