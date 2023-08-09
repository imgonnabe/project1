package com.qorlwn.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qorlwn.board.BoardService;
import com.qorlwn.login.LoginService;
import com.qorlwn.util.Util;

@RestController
public class RestController01 {// controller + responsebody

	@Autowired
	private LoginService loginService;

	@Autowired
	private Util util;

	@Autowired
	private BoardService boardService;

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
	@GetMapping(value = "/boardList2", produces = "application/json; charset=utf-8")
	public String boardList2(@RequestParam("pageNo") int pageNo) {
		// System.out.println("jQuery가 보내주는 : " + pageNo);
		List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);

		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(list);
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr);
		// System.out.println(json.toString());
		return json.toString();
	}

	@PostMapping("/cdelR")
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
		int result = 0;
		if (session.getAttribute("mid") != null) {
			if (map.containsKey("bno") && map.get("cno") != null && !(map.get("bno").equals(""))
					&& !(map.get("cno").equals("")) && util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {
				// map.containsKey("bno") : key 값 뽑음
				// map.get("bno") : value 값 뽑음
				// map.put(4, null);
				// System.out.println(map.get(4) != null ? true : false); // false
				// value에 null값이 허용되면, 실제 key가 존재하는지 여부를 체크할 때 정확한 값이 나오지 않는 제약 사항이 있다.
				map.put("m_id", session.getAttribute("mid"));// "m_id"로 써야함
				result = boardService.cdel(map);
				System.out.println("삭제결과: " + result);
			}
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
	
	@PostMapping("/write2")
	public String write2(@RequestParam Map<String, Object> map, HttpServletRequest request) {
		int result = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
			map.put("m_id", session.getAttribute("mid"));
			map.put("bcontent", request.getParameter("content"));
			result = boardService.write(map);
		}
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
}