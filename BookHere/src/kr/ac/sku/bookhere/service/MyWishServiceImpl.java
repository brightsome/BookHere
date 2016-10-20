package kr.ac.sku.bookhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sku.bookhere.dao.MyBookDAO;
import kr.ac.sku.bookhere.dao.MyWishDAO;
import kr.ac.sku.bookhere.vo.MyWishInfoVO;
import kr.ac.sku.bookhere.vo.MyWishVO;

@Service("mywishService")
public class MyWishServiceImpl implements MyWishService {
	@Autowired
	MyWishDAO mywishDAO;
	
	@Override
	public int insertMyWish(MyWishVO vo) {
		return mywishDAO.insertMyWish(vo);
	}

	@Override
	public List<MyWishInfoVO> selectMyWishList(String id) {
		return mywishDAO.selectMyWishList(id);
	}

	@Override
	public int deleteMyWish(MyWishVO vo) {
		return mywishDAO.deleteMyWish(vo);
	}

	@Override
	public List<MyWishInfoVO> selectTopWishList() {
		return mywishDAO.selectTopWishList();
	}

}
