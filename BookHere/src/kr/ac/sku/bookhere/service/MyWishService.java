package kr.ac.sku.bookhere.service;

import java.util.List;

import kr.ac.sku.bookhere.vo.MyWishInfoVO;
import kr.ac.sku.bookhere.vo.MyWishVO;

public interface MyWishService {
	// dao.insertMyWish
	public int insertMyWish(MyWishVO vo);

	public List<MyWishInfoVO> selectMyWishList(String id);
	
	public int deleteMyWish(MyWishVO vo);
	
	public List<MyWishInfoVO> selectTopWishList();
}
