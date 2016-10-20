package kr.ac.sku.bookhere.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.MyBookVO;
import kr.ac.sku.bookhere.vo.RecommendVO;
@Repository("mybookDAO")
public class MyBookDAOImpl implements MyBookDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public MyBookVO selectMyBook(MyBookVO vo) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.ac.sku.bookhere.MyBook.selectMyBook",vo);
	}
	
	
	@Override
	public int insertMyBook(MyBookVO vo) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.ac.sku.bookhere.MyBook.insertMyBook",vo);
	}


	@Override
	public int deleteMyBook(MyBookVO vo) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.delete("kr.ac.sku.bookhere.MyBook.deleteMyBook",vo);
	}

	@Override
	public int updateMyBook(MyBookVO vo) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.update("kr.ac.sku.bookhere.MyBook.updateMyBook",vo);
	}
	

	@Override
	public List<MyBookVO> selectMyBookList(String id) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.ac.sku.bookhere.MyBook.selectMyBookList",id);
	}


	@Override
	public List<RecommendVO> recommendMember(String id) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("kr.ac.sku.bookhere.MyBook.recommendMember",id);
	}


	@Override
	public String selectMemberPic(String id) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("kr.ac.sku.bookhere.MyBook.selectMemberPic",id);
	}


	

}
