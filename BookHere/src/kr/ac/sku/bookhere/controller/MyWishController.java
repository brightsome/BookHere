package kr.ac.sku.bookhere.controller;

import java.util.List;

import kr.ac.sku.bookhere.service.MyWishService;
import kr.ac.sku.bookhere.vo.MyBookVO;
import kr.ac.sku.bookhere.vo.MyWishInfoVO;
import kr.ac.sku.bookhere.vo.MyWishVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyWishController {
	@Autowired
	MyWishService mywishService;
	

	// insert
	@RequestMapping("MyWishInsert")
	public String MyWishInsert(String isbn,MyWishVO vo) {
		int count = mywishService.insertMyWish(vo);
		if(count==1){
			return "redirect:/stockSearch?isbn="+isbn;
		}else
			return "single-product";
	}
	
	// LIST
	@RequestMapping("MyWishList")
	public String MyWishList(@RequestParam("id")String id,Model model,MyWishVO vo) {
		List<MyWishInfoVO> mywishlist = mywishService.selectMyWishList(id);
		model.addAttribute("mywishList", mywishlist);
		List<MyWishInfoVO> topwishlist = mywishService.selectTopWishList();
		model.addAttribute("topwishList", topwishlist);
		return "wishlist";
	}
	
	// DELETE
	@RequestMapping("MyWishDelete")
	public String MyBookDelete(MyWishVO vo) {
		
		mywishService.deleteMyWish(vo);
		System.out.println("성공");
		
		String id =vo.getId();
		return "redirect:/MyWishList?id="+id;

	}
	
	
	

	
}
