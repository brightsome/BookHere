package kr.ac.sku.bookhere.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sku.bookhere.vo.MyWishInfoVO;
import kr.ac.sku.bookhere.vo.MyWishVO;
@Repository("mywishDAO")
public class MyWishDAOImpl implements MyWishDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMyWish(MyWishVO vo) throws RuntimeException {
		return sqlSession.insert("kr.ac.sku.bookhere.MyWish.insertMyWish",vo);
	}

	@Override
	public List<MyWishInfoVO> selectMyWishList(String id) throws RuntimeException {
		return sqlSession.selectList("kr.ac.sku.bookhere.MyWish.selectMyWishList",id);
	}

	@Override
	public int deleteMyWish(MyWishVO vo) throws RuntimeException {
		return sqlSession.delete("kr.ac.sku.bookhere.MyWish.deleteMyWish",vo);
	}

	@Override
	public List<MyWishInfoVO> selectTopWishList() throws RuntimeException {
		return sqlSession.selectList("kr.ac.sku.bookhere.MyWish.selectTopWishList");
	}

}
