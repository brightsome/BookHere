package kr.ac.sku.bookhere.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sku.bookhere.vo.BookStoreVO;
import kr.ac.sku.bookhere.vo.BookVO;

@Repository("bookDAO")
public class BookDAOImpl implements BookDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertBook(String isbn) throws RuntimeException {
		return sqlSession.insert("kr.ac.sku.bookhere.insertBook",isbn);
	}

	@Override
	public int updateProdid(BookVO vo) throws RuntimeException {
		return sqlSession.update("kr.ac.sku.bookhere.updateProdid", vo);
	}

	@Override
	public int updateBookcd(BookVO vo) throws RuntimeException {
		return sqlSession.update("kr.ac.sku.bookhere.updateBookcd", vo);
	}

	@Override
	public int updateBook(BookVO vo) throws RuntimeException {
		return sqlSession.update("kr.ac.sku.bookhere.updateBook", vo);
	}

	@Override
	public BookVO prodidbookcd(String isbn) throws RuntimeException {
		return sqlSession.selectOne("kr.ac.sku.bookhere.prodidbookcd", isbn);
	}

//
//	@Override
//	public BookVO selectBook(String isbn) throws RuntimeException {
//		return sqlSession.selectOne("kr.ac.sku.bookhere.selectBook",isbn);
//	}

	

}