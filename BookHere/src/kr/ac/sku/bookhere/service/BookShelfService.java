package kr.ac.sku.bookhere.service;

import java.util.List;

import kr.ac.sku.bookhere.vo.BookShelfVO;
import kr.ac.sku.bookhere.vo.PageVO;

public interface BookShelfService {

	 public List<BookShelfVO> selectBookShelfList(String search);

	 public List<BookShelfVO> selectBookNameList(String bookname);

     public List<BookShelfVO> selectMemberList(String id);
    

	   
}
