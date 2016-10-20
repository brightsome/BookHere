package kr.ac.sku.bookhere.dao;

import java.util.ArrayList;
import java.util.List;

import kr.ac.sku.bookhere.vo.BookStoreVO;
import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.OwnerVO;

public interface BookStoreDAO {
	public BookStoreVO selectBookstore(String bookstorename) throws RuntimeException;

	public ArrayList<BookStoreVO> kyoboStoreList() throws RuntimeException;

	public ArrayList<BookStoreVO> bandiStoreList() throws RuntimeException;

	public ArrayList<BookStoreVO> ypStoreList() throws RuntimeException;
	
	public ArrayList<BookStoreVO> aladinStoreList() throws RuntimeException;
	
	public int insertBookstore(BookStoreVO vo) throws RuntimeException;
	
	public ArrayList<BookStoreVO> gbookstoreList() throws RuntimeException;
	
	public ArrayList<BookStoreVO> bookstoreList() throws RuntimeException;
	
	public ArrayList<BookStoreVO> selectBookstore2(String searchTxt) throws RuntimeException;
	
	public int countBookstore() throws RuntimeException;
	
	public int deleteBookstore(String branchid) throws RuntimeException;
	
	public BookStoreVO selectOneBookstore(String branchid) throws RuntimeException;
	
	public List<OwnerVO> ownerandbookstore() throws RuntimeException;

	public int updateWebstie(OwnerVO vo) throws RuntimeException;
}
