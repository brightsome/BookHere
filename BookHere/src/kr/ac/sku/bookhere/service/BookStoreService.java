package kr.ac.sku.bookhere.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.ac.sku.bookhere.vo.BookStoreVO;
import kr.ac.sku.bookhere.vo.OwnerVO;

public interface BookStoreService {
	public List<BookStoreVO> kyoboStoreList() throws RuntimeException;

	public List<BookStoreVO> bandiStoreList() throws RuntimeException;

	public List<BookStoreVO> ypStoreList() throws RuntimeException;

	public List<BookStoreVO> aladinStoreList() throws RuntimeException;
	
	public int insertBookstore(BookStoreVO vo) throws RuntimeException;
	
	public List<BookStoreVO> gbookstoreList() throws RuntimeException;
	
	public List<BookStoreVO> bookstoreList() throws RuntimeException;
	
	public List<BookStoreVO> selectBookstore(String searchTxt) throws RuntimeException;
	
	public int countBookstore() throws RuntimeException;
	
	// dao.deleteBookstore
	public int deleteBookstore(String branchid) throws RuntimeException;
	
	// dao.selectOneBookstore
	public BookStoreVO selectOneBookstore (String branchid) throws RuntimeException;

	public String fileUpload(BookStoreVO vo, HttpServletRequest req) throws RuntimeException;
	
	public List<OwnerVO> ownerandbookstore() throws RuntimeException;
	
	public int updateWebstie(OwnerVO vo) throws RuntimeException;
	
}
