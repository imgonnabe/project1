package com.qorlwn.pro1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		// System.out.println(request.getParameter("id"));
		// System.out.println(request.getParameter("pw"));
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		
		dto = loginService.login(dto);
		if (dto.getCount() == 1) {
			// 세션을 만들어서 로그인을 지정 시간동안 유지
			HttpSession session = request.getSession();
			session.setAttribute("mname", dto.getM_name());
			session.setAttribute("mid", request.getParameter("id"));
			// 세션 : 서버, 쿠키 : 클라이언트
			return "redirect:/index";
		} else {
			return "login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("mname") != null) {
			session.removeAttribute("mname");
		}
		if (session.getAttribute("mid") != null){
			session.removeAttribute("mid");
		}
		
		session.setMaxInactiveInterval(0);// 세션 유지시간을 0으로 = 종료
		session.invalidate();// 세션 초기화 = 세션의 모든 속성 값을 제거 = 종료
		return "redirect:/index";
	}
}
