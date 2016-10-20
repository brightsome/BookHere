package kr.ac.sku.bookhere.dao;

import java.util.List;

import kr.ac.sku.bookhere.vo.BookShelfVO;

public interface BookShelfDAO {
		// SELECT BOOKSHELF
		public List<BookShelfVO> selectBookShelfList(String search) throws RuntimeException;
		
		public List<BookShelfVO> selectBookNameList(String bookname) throws RuntimeException;
		
		public List<BookShelfVO> selectMemberList(String id) throws RuntimeException;
		
		
	
}
