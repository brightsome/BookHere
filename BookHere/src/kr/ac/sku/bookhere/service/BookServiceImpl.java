package kr.ac.sku.bookhere.service;

import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import kr.ac.sku.bookhere.dao.BookDAO;
import kr.ac.sku.bookhere.vo.BookVO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("bookService")
public class BookServiceImpl implements BookService {
	@Autowired
	BookDAO bookDAO;

	@Override
	public int updateBook(String isbn) throws Exception {
		// TODO Auto-generated method stub
		// 한글 처리를 위해 InputStreamReader를 UTF-8 인코딩으로 감싼다.
		
		InputStreamReader isr;

		URL url = new URL("http://apis.daum.net/search/book?q=" +isbn
				+ "&apikey=b06a50bbe5f4ffcc16dc850c45a67fd1&output=json");
		isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
		// JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> parse 메소드
		JSONObject object = (JSONObject)JSONValue.parseWithException(isr);
		// 객체
		JSONObject channel = (JSONObject)(object.get("channel"));
		// item 배열
		JSONArray items = (JSONArray)channel.get("item");
		JSONObject obj1 = (JSONObject)items.get(0);			
		
		String bookname= obj1.get("title").toString();
		String author= obj1.get("author").toString();
		String publisher= obj1.get("pub_nm").toString();
		String img= obj1.get("cover_l_url").toString();
		int bookprice =Integer.parseInt(obj1.get("list_price").toString());
		int salepirce = Integer.parseInt(obj1.get("sale_price").toString());
		String bookintro= obj1.get("description").toString();
		BookVO vo = new BookVO();
		vo.setIsbn(isbn);
		vo.setBookname(bookname);
		vo.setAuthor(author);
		vo.setPublisher(publisher);
		vo.setBookprice(bookprice);
		vo.setSaleprice(salepirce);
		vo.setBookintro(bookintro);
		vo.setImg(img);
		bookDAO.updateBook(vo);
		
	return bookDAO.updateBook(vo);
	}
	

}
