package kr.ac.sku.bookhere.service;

import java.util.List;

import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.MyBookVO;
import kr.ac.sku.bookhere.vo.RecommendVO;

public interface MyBookService {
	
		//dao.selectMyBook
		public MyBookVO selectMyBook(MyBookVO vo);
	
		// dao.insertMyBook
		public int insertMyBook(MyBookVO vo);
		
		// dao.deleteMyBook
		public int deleteMyBook(MyBookVO vo);
		
		// dao.updateMyBook
		public int updateMyBook(MyBookVO vo);
		
		// dao.selectRecommendMyBook
		public List<MyBookVO> selectMyBookList(String id);
		
		// dao.recommendMember
		public List<RecommendVO> recommendMember(String id);
		
		// dao.selectMemberPics
//		public List<RecommendVO> selectMemberPic(String id);
	
}
