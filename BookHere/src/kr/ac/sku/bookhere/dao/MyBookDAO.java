package kr.ac.sku.bookhere.dao;

import java.util.List;

import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.MyBookVO;
import kr.ac.sku.bookhere.vo.RecommendVO;

public interface MyBookDAO {
	// SELECT
	public MyBookVO selectMyBook(MyBookVO vo) throws RuntimeException;
		
	// INSERT
	public int insertMyBook(MyBookVO vo) throws RuntimeException;

	// DELETE
	public int deleteMyBook(MyBookVO vo) throws RuntimeException;
	
	// UPDATE
	public int updateMyBook(MyBookVO vo) throws RuntimeException;
	
	// SELECT ALL
	public List<MyBookVO> selectMyBookList(String id) throws RuntimeException;
	
	// SELECT RECOMMENDMEMBER
	public List<RecommendVO> recommendMember(String id) throws RuntimeException;
	
	// SELECT PIC
	public String selectMemberPic(String id) throws RuntimeException;
	
}
