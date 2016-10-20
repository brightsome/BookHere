package kr.ac.sku.bookhere.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sku.bookhere.dao.BookDAO;
import kr.ac.sku.bookhere.vo.BookVO;

@Service("stockSearchService")
public class StockSearchServiceImpl implements StockSearchService {
	@Autowired
	BookDAO bookDAO;

	/*********
	 * KYOBO
	 *********/
	@Override
	public Hashtable<String, String> kyobo(String isbn) {
		List<String> storeList = new ArrayList<>();
		List<String> numList = new ArrayList<>();
		String url = "http://www.kyobobook.co.kr/prom/2013/general/StoreStockTable.jsp?barcode=" + isbn + "&ejkgb=KOR;";
		String selector = "table.table_simple3 tbody tr th";
		String selector2 = "table.table_simple3 tbody tr td";
		Hashtable<String, String> ht = new Hashtable<String, String>();

		Document doc;
		try {
			doc = Jsoup.connect(url).timeout(7000).get();
			Elements store = doc.select(selector);
			Elements booknum = doc.select(selector2);
			for (Element e : store) {
				storeList.add(e.text());
			}
			for (Element e : booknum) {
				numList.add(e.text());
			}
			for (int i = 0; i < storeList.size(); i++) {
				if (!storeList.get(i).equals("")) {
					ht.put(storeList.get(i), numList.get(i));
				}
			}
		} catch (NullPointerException e) {
			try {
				ht.put("0", "0"); // 책 정보 아예 없음
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		return ht;
	}

	/*********
	 * BANDI
	 *********/
	@Override
	public Hashtable<String, String> bandi(String isbn) {
		String href = null;
		PhantomJSDriver pt = new PhantomJSDriver();
		System.setProperty("webdriver.phantomjs.driver", "C:/bit/phantomjs.exe");
		String searchUrl = "http://www.bandinlunis.com/search/search.do?q=" + isbn;
		pt.get(searchUrl);
		String str = pt.getPageSource();
		pt.quit();

		Document doc = Jsoup.parse(str);
		Hashtable<String, String> ht = new Hashtable<String, String>();

		try {
			String selector = "div.thumb_left_big a ";
			Elements search = doc.select(selector);
			href = search.first().attr("href");
			List<String> storeList = new ArrayList<>();
			List<String> numList = new ArrayList<>();
			String detailUrl = "http://www.bandinlunis.com/" + href;
			String prodid = href.replaceAll("[^0-9]", ""); // prodId
			// BOOK DB에 저장
			BookVO vo = new BookVO();
			vo.setIsbn(isbn);
			vo.setProdid(prodid);
			bookDAO.updateProdid(vo);

			String storeName = "table.commTable_d.t_11 tbody tr th";
			String storeStock = "table.commTable_d.t_11 tbody tr td";

			try {
				doc = Jsoup.connect(detailUrl).timeout(7000).get();
				Elements store = doc.select(storeName);
				Elements booknum = doc.select(storeStock);

				for (Element e : store) {
					storeList.add(e.text());
				}
				for (Element e : booknum) {
					numList.add(e.text());
				}
				for (int i = 0; i < storeList.size(); i++) {
					if (!storeList.get(i).equals("인터넷")) {
						ht.put(storeList.get(i), numList.get(i));
					}
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} catch (NullPointerException e2) {
			try {
				ht.put("0", "0"); // 책 정보 아예 없음
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return ht;
	}

	/*********
	 * YPBOOKS
	 *********/
	@Override
	public Hashtable<String, String> ypbooks(String isbn) {
		PhantomJSDriver pt = new PhantomJSDriver();
		System.setProperty("webdriver.phantomjs.driver", "C:/bit/phantomjs.exe");
		String bookcd = null;
		String searchUrl = "http://www.ypbooks.co.kr/search.yp?query=" + isbn;
		pt.get(searchUrl);
		String str = pt.getPageSource();
		pt.quit();

		Document doc = Jsoup.parse(str);
		Hashtable<String, String> ht = new Hashtable<String, String>();

		try {
			String selector = "div.chk input ";
			Elements search = doc.select(selector);
			bookcd = search.first().attr("value");

			// BOOK DB에 저장
			BookVO vo = new BookVO();
			vo.setIsbn(isbn);
			vo.setBookcd(bookcd);
			bookDAO.updateBookcd(vo);

			List<String> storeList = new ArrayList<>();
			List<String> numList = new ArrayList<>();
			String detailUrl = "http://www.ypbooks.co.kr/book.yp?bookcd=" + bookcd;
			String storenName = "div#branchQtyDiv table.tb_store td strong";
			String storeStock = "div#branchQtyDiv table.tb_store td span";

			try {
				doc = Jsoup.connect(detailUrl).timeout(7000).get();
				Elements store = doc.select(storenName);
				Elements booknum = doc.select(storeStock);
				for (Element e : store) {
					storeList.add(e.text());
				}
				for (Element e : booknum) {
					numList.add(e.text());
				}
				for (int i = 0; i < storeList.size(); i++) {
					if (!storeList.get(i).equals("\u00a0")) {
						ht.put(storeList.get(i), numList.get(i));
					}
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} catch (NullPointerException e2) {
			try {
				ht.put("0", "0"); // 책 정보 아예 없음
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return ht;
	}

	/*********
	 * ALADIN
	 *********/
	@Override
	public Hashtable<String, String> aladin(String isbn) {
		List<String> storeName = new ArrayList<>();
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=gangnam");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=geondae");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=nowon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=daehakro");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=suyu");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=sillim");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=sinchon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=yeonsinnae");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=jamsil");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=sincheon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=jongno");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=hapjeong");

		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=bucheon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=bundang");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=sanbon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=suwon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=ilsan");

		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=gwangju");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=daegu");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=sangin");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=daejeoncityhall");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=daejeon");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=busan");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=centum");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=ulsan");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=jeonju");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=cheonan");
		storeName.add("http://used.aladin.co.kr/usedstore/wproduct.aspx?offcode=cheongju");

		List<String> numList = new ArrayList<>();
		List<String> storeList = new ArrayList<>();
		String selector = "div.bt_box dt span";
		String selector2 = "div#used-book div.ss_book_list span.ss_p4 b";
		Hashtable<String, String> ht = new Hashtable<String, String>();

		Document doc;
		try {

			for (int i = 0; i < storeName.size(); i++) {
				String url = storeName.get(i) + "&ISBN=" + isbn;

				doc = Jsoup.connect(url).timeout(7000).get();
				Elements store = doc.select(selector);
				Elements booknum = doc.select(selector2);

				// 지점명
				String splitStoreName = store.text();
				storeList.add(splitStoreName.substring(1, splitStoreName.length() - 1));

				// 재고
				String splitBookName = booknum.text();
				numList.add(splitBookName.substring(0, splitBookName.length() - 1));

			}

			for (int i = 0; i < storeList.size(); i++) {
				if (!storeList.get(i).equals("")) {
					ht.put(storeList.get(i), numList.get(i));
				}
			}

		} catch (NullPointerException e) {
			try {
				ht.put("0", "0"); // 책 정보 아예 없음
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		return ht;
	}

}