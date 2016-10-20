package kr.ac.sku.bookhere.dao;

import java.util.ArrayList;

import kr.ac.sku.bookhere.vo.BookVO;

public interface BookDAO {
	// INSERT
	public int insertBook(String isbn) throws RuntimeException;

	// UPDATE PRODID
	public int updateProdid(BookVO vo) throws RuntimeException;

	// UPDATE PRODID
	public int updateBookcd(BookVO vo) throws RuntimeException;

	// UPDATE BOOK INFO
	public int updateBook(BookVO vo) throws RuntimeException;

	// 반디앤루니스,영풍문고 id 추가
	public BookVO prodidbookcd(String isbn) throws RuntimeException;

	// SELECT
//	public BookVO selectBook(String isbn) throws RuntimeException;

}