package kr.ac.sku.bookhere.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sku.bookhere.service.BookStoreService;

@Controller
public class PageController {

	@Autowired
	BookStoreService bookstoreService;

	// about.jsp
	@RequestMapping("aboutPage")
	public String AboutPage() {
		return "about";
	}

	// board.jsp
	@RequestMapping("bookstorePage")
	public String BoardPage(Model model) {
		model.addAttribute("bookstore",bookstoreService.bookstoreList());
		model.addAttribute("gbookstore", bookstoreService.gbookstoreList());
		return "bookstore";
	}

	// search.jsp
	@RequestMapping("searchPage")
	public String ShopPage() {
		return "search";
	}


	// signup.jsp
	@RequestMapping("signupPage")
	public String SignupPage() {
		return "signup";
	}

	// login.jsp
	@RequestMapping("loginPage")
	public String LoginPage() {
		return "login";
	}

	// registerBookstore.jsp
	@RequestMapping("registerBookstorePage")
	public String RegisterBookstorePage(@RequestParam("id")String id) {
		if(id!=null&&!"".equals(id)){
	         return "registerBookstore";
	      }else
	         return "redirect:/loginPage";
	}
	
	// managerlogin.jsp
		@RequestMapping("managerloginPage")
		public String ManagerloginPage() {
			return "managerlogin";
		}
}
