package kr.ac.sku.bookhere.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sku.bookhere.dao.BookDAO;
import kr.ac.sku.bookhere.service.BookService;
import kr.ac.sku.bookhere.service.BookStoreService;
import kr.ac.sku.bookhere.service.StockSearchService;
import kr.ac.sku.bookhere.thread.StockSearchThread;

@Controller
public class StockSearchController extends Thread {
   @Autowired
   StockSearchService stockSearchService;
   
   @Autowired
   BookStoreService bookstoreService;
   
   @Autowired
   BookService bookService;
   
   @Autowired 
   BookDAO bookDAO;
   
   
   @RequestMapping("stockSearch")
	public String StockSearch(String isbn, Model model) throws Exception {

	   try {
		   bookDAO.insertBook(isbn);
	   }catch(DuplicateKeyException e){
	   }
	   
	   StockSearchThread kyobo = new StockSearchThread(1, stockSearchService, isbn);
	   StockSearchThread ypbooks = new StockSearchThread(2, stockSearchService, isbn);
	   StockSearchThread bandi = new StockSearchThread(3, stockSearchService, isbn);
	   StockSearchThread aladin = new StockSearchThread(4, stockSearchService, isbn);
	   
	   kyobo.start();
	   ypbooks.start();
	   bandi.start();
	   aladin.start();
	   
	   try {
		   kyobo.join();
		   ypbooks.join();
		   bandi.join();
		   aladin.join();
		  
			model.addAttribute("kyoboStockList", kyobo.toController());
			model.addAttribute("ypStockList", ypbooks.toController());
			model.addAttribute("bandiStockList", bandi.toController());
			model.addAttribute("aladinStockList", aladin.toController());
			
		   
		   } catch(Exception e) {
		   }
	   
	   //지도에 매장 정보 뿌리기
		model.addAttribute("kyoboStoreList", bookstoreService.kyoboStoreList());
		model.addAttribute("bandiStoreList", bookstoreService.bandiStoreList());
		model.addAttribute("ypStoreList", bookstoreService.ypStoreList());
		model.addAttribute("aladinStoreList", bookstoreService.aladinStoreList());
		model.addAttribute("prodidbookcd", bookDAO.prodidbookcd(isbn));
		bookService.updateBook(isbn);
	   
	   
		return "single-product";
	}
   
}