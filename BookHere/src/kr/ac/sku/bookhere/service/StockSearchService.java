package kr.ac.sku.bookhere.service;

import java.util.Hashtable;

public interface StockSearchService {
	public Hashtable<String, String> kyobo(String isbn); 
	
	public Hashtable<String, String> bandi(String isbn);
	
	public Hashtable<String, String> ypbooks(String isbn);
	
	public Hashtable<String, String> aladin(String isbn);

	
}
