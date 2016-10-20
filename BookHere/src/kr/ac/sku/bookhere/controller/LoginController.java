package kr.ac.sku.bookhere.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sku.bookhere.service.MemberService;
import kr.ac.sku.bookhere.vo.MemberVO;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("login")
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session) {
		MemberVO user = memberService.selectMember(id);
		if (user != null && user.getId() != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("loginEmail", id);
				session.setAttribute("user", user);
				return "redirect:/index";
			} else {
				String errorMsg = "비밀번호가 틀렸습니다.";
				session.setAttribute("loginState", errorMsg);
				session.setAttribute("loginInfo", id);
				return "loginPage";
			}
		} else {
			return "signupPage";
		}
	}
	
	@RequestMapping("managerlogin")
	public String managerlogin(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session) {
		MemberVO user = memberService.selectMember(id);
		if (user != null && user.getId() != null) {
			if (user.getPassword().equals(password)) {
				session.setAttribute("loginEmail", id);
				session.setAttribute("user", user);
				return "managerpage";
			} else {
				String errorMsg = "비밀번호가 틀렸습니다.";
				session.setAttribute("loginState", errorMsg);
				session.setAttribute("loginInfo", id);
				return "managerloginPage";
			}
		} else {
			return "managerloginPage";
		}
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.setAttribute("loginEmail", null);
		session.removeAttribute("loginEmail");
		return "redirect:/index";
	}

	@RequestMapping("loginCheck")
	public String loginform(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request) {
		if (memberService.selectMember(vo.getId()) == null) {
			memberService.insertMember(vo);
		}
		session.setAttribute("loginEmail", vo.getId());
		return "redirect:/index";
	}

}