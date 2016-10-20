package kr.ac.sku.bookhere.thread;

import java.util.Hashtable;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.sku.bookhere.service.StockSearchService;

public class StockSearchThread extends Thread {
	@Autowired
	StockSearchService stockSearchService;
	int type;
	String isbn;
	
	Hashtable<String, String> stock = new Hashtable<String, String>();
	
	public StockSearchThread(int type, StockSearchService stockSearchService, String isbn) {
		this.stockSearchService = stockSearchService;
		this.type = type;
		this.isbn = isbn;
	}

	@Override
	public void run() {
		switch (type) {
		case 1:
			stock = stockSearchService.kyobo(isbn);
			toController();
			break;
		case 2:
			stock = stockSearchService.bandi(isbn);
			toController();
			break;
		case 3:
			stock = stockSearchService.ypbooks(isbn);
			toController();
			break;
		case 4:
			stock = stockSearchService.aladin(isbn);
			toController();
			break;
		}
	}
	
	public Hashtable<String, String> toController() {
		return stock;
	}
}
