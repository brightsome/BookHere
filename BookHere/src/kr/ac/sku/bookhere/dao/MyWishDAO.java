package kr.ac.sku.bookhere.dao;

import java.util.List;

import kr.ac.sku.bookhere.vo.MyBookVO;
import kr.ac.sku.bookhere.vo.MyWishInfoVO;
import kr.ac.sku.bookhere.vo.MyWishVO;


public interface MyWishDAO {
	// INSERT
	public int insertMyWish(MyWishVO vo)throws RuntimeException;
	
	// SELECT ALL
	public List<MyWishInfoVO> selectMyWishList(String id) throws RuntimeException;
	
	//DELETE
	public int deleteMyWish(MyWishVO vo) throws RuntimeException;
	
	// SELECT TOP WISHLIST
	public List<MyWishInfoVO> selectTopWishList() throws RuntimeException;
	
		
}
