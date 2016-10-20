package kr.ac.sku.bookhere.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sku.bookhere.vo.BookStoreVO;
import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.OwnerVO;

@Repository("bookstoreDAO")
public class BookStoreDAOImpl implements BookStoreDAO {

	@Autowired
	private SqlSession sqlSession; // annotation �ϳ��� �ϳ��� �����

	@Override
	public BookStoreVO selectBookstore(String bookstorename) throws RuntimeException {
		return sqlSession.selectOne("kr.ac.sku.bookhere.selectBookStore", bookstorename);
	}

	@Override
	public ArrayList<BookStoreVO> kyoboStoreList() throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.kyoboStoreList");
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public ArrayList<BookStoreVO> bandiStoreList() throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.bandiStoreList");
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public ArrayList<BookStoreVO> ypStoreList() throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.ypStoreList");
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public ArrayList<BookStoreVO> aladinStoreList() throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.aladinStoreList");
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public int insertBookstore(BookStoreVO vo) throws RuntimeException {
		return sqlSession.insert("kr.ac.sku.bookhere.Bookstore.insertBookstore", vo);
	}
	
	@Override
	public ArrayList<BookStoreVO> gbookstoreList() throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.gbookstoreList");
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public ArrayList<BookStoreVO> bookstoreList() throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.bookstoreList");
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public ArrayList<BookStoreVO> selectBookstore2(String searchTxt) throws RuntimeException {
		List<BookStoreVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.bookstoreAddressSearch",searchTxt);
		return (ArrayList<BookStoreVO>) list;
	}

	@Override
	public int countBookstore() throws RuntimeException {
		int count = sqlSession.selectOne("kr.ac.sku.bookhere.Bookstore.countBookstore");
		return count;
	}
	
	@Override
	public int deleteBookstore(String branchid) throws RuntimeException {
		int deleteOK = sqlSession.delete("kr.ac.sku.bookhere.Bookstore.deleteBookstore", branchid);
		return deleteOK;
	}
	
	@Override
	public BookStoreVO selectOneBookstore(String branchid) throws RuntimeException {
		return sqlSession.selectOne("kr.ac.sku.bookhere.Bookstore.bookstoreOne", branchid);
	}
	
	@Override
	public List<OwnerVO> ownerandbookstore() throws RuntimeException {
		List<OwnerVO> list = sqlSession.selectList("kr.ac.sku.bookhere.Bookstore.ownerandbookstore");
		return list;
	}
	
	@Override
	public int updateWebstie(OwnerVO vo) throws RuntimeException {
		return sqlSession.update("kr.ac.sku.bookhere.Bookstore.updateWebstie", vo);
	}

}