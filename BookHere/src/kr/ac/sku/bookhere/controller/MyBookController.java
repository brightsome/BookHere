package kr.ac.sku.bookhere.controller;

import kr.ac.sku.bookhere.service.MemberService;
import kr.ac.sku.bookhere.service.MyBookService;
import kr.ac.sku.bookhere.vo.MyBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyBookController {
	@Autowired
	MyBookService mybookService;

	@Autowired
	MemberService memberService;

	
	
	// insert
	@RequestMapping("MyBookInsert")
	public String MyBookInsert(String isbn,MyBookVO vo) {

		int count = mybookService.insertMyBook(vo);
		if(count==1){

			return "redirect:/stockSearch?isbn="+isbn;

		}else
			return "single-product";
	}


	// DELETE
	@RequestMapping("MyBookDelete")
	public String MyBookDelete(MyBookVO vo) {
		
		mybookService.deleteMyBook(vo);
		System.out.println("성공");
		
		String id =vo.getId();
		return "redirect:/MyBookSelect?id="+id;

	}

	

//	@RequestMapping("MyBookUpdateForm")
//	public String MyBookUpdateForm(Model model,MyBookVO vo){
//		System.out.println("얍");
//		model.addAttribute("mybookInfo",mybookService.selectMyBook(vo));
//		String id =vo.getId();
//		System.out.println("2"+id);
//		return null;
//	}
	

	// UPDATE
	@RequestMapping("MyBookUpdate")
	public String MyBookUpdate(MyBookVO vo,Model model) {

		model.addAttribute("updateMember", mybookService.updateMyBook(vo));		
		String id =vo.getId();
		System.out.println(vo.toString());
		return "redirect:/MyBookSelect?id="+id;

	}


	//select
	@RequestMapping("MyBookSelect")
	public String SelectMyBook(@RequestParam("id")String id,Model model,MyBookVO vo){
		//		System.out.println(id);
		if(id!=null&&!"".equals(id)){
			model.addAttribute("selectMember", memberService.selectMember(id));
			model.addAttribute("selectMyBook",mybookService.selectMyBookList(id));
//			mybookService.recommendMember(id);
			model.addAttribute("recommendMember", mybookService.recommendMember(id));
			
			return "mybook";
		}else
			return "redirect:/loginPage";

	}


}
