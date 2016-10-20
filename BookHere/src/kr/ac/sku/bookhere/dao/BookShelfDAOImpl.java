package kr.ac.sku.bookhere.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.ac.sku.bookhere.vo.BookShelfVO;

@Repository("bookshelfDAO")
public class BookShelfDAOImpl implements BookShelfDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BookShelfVO> selectBookShelfList(String search) throws RuntimeException {
		List<BookShelfVO> bookshelfList = new ArrayList<>();
		bookshelfList = sqlSession.selectList("kr.ac.sku.bookhere.BookShelf.selectBookShelfList",search);
		return bookshelfList;
	}

	@Override
	public List<BookShelfVO> selectBookNameList(String bookname) throws RuntimeException {
		List<BookShelfVO> booknameList = new ArrayList<>();
		booknameList = sqlSession.selectList("kr.ac.sku.bookhere.BookShelf.selectBookNameList",bookname);
		return booknameList;
	}

	@Override
	public List<BookShelfVO> selectMemberList(String id) throws RuntimeException {
		List<BookShelfVO> memberList = new ArrayList<>();
		memberList = sqlSession.selectList("kr.ac.sku.bookhere.BookShelf.selectMemberList",id);
		return memberList;
	}

}
