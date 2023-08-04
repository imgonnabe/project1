package com.qorlwn.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qorlwn.login.LoginService;

@RestController
public class RestController01 {// controller + responsebody
	
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
	// consumes = MediaType.APPLICATION_JSON_VALUE // 들어오는 데이터 타입 정의
	// produces = MediaType.APPLICATION_JSON_VALUE // 반환하는 데이터 타입을 정의
	// MediaType : 들어오는 데이터와 나가는 데이터를 정하여 처리
	@GetMapping(value="/boardList2", produces="application/json; charset=utf-8")
	public String boardList2(@RequestParam("pageNo") int pageNo) {
		// System.out.println("jQuery가 보내주는 : " +  pageNo);
		List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);
		
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(list);
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr);
		// System.out.println(json.toString());
		return json.toString();
	}
}
