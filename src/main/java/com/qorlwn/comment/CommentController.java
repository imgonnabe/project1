package com.qorlwn.comment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping("/comment")
	public String comment(@RequestParam Map<String, Object> map, HttpSession session) {
		// 로그인했는지 확인
		if (session.getAttribute("mid") != null) {
			
			// 로그인한 사람의 mid값을 뽑아서 map에 저장
			map.put("m_id", session.getAttribute("mid"));
			int result = commentService.commentInsert(map);
			if (result == 1) {
				return "redirect:/detail?bno=" + map.get("bno");
			} else {
				return "warning";
			}
		} else {
			return "warning";
		}
	}
}
