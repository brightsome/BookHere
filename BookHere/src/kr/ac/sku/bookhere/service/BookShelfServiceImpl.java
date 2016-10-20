package kr.ac.sku.bookhere.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sku.bookhere.vo.PageVO;
import kr.ac.sku.bookhere.dao.BookShelfDAO;
import kr.ac.sku.bookhere.vo.BookShelfVO;

@Service("bookshelfService")
public class BookShelfServiceImpl implements BookShelfService {

	@Autowired
    BookShelfDAO bookshelfDAO;
	
	@Override
	public List<BookShelfVO> selectBookShelfList(String search) {
		return bookshelfDAO.selectBookShelfList(search);
	}

	@Override
	public List<BookShelfVO> selectBookNameList(String bookname) throws RuntimeException {
		return bookshelfDAO.selectBookNameList(bookname);
	}

	@Override
	public List<BookShelfVO> selectMemberList(String id) throws RuntimeException {
		System.out.println(id);
		return bookshelfDAO.selectMemberList(id);
	}
	
	
	
	

}
