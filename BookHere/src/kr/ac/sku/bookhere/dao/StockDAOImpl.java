package kr.ac.sku.bookhere.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sku.bookhere.vo.StockVO;

@Repository("stockDAO")
public class StockDAOImpl implements StockDAO {
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public int insertStock(List<StockVO> list) throws RuntimeException {
      int count = 0;
      for(StockVO vo : list) {
    	  count = sqlSession.insert("kr.ac.sku.bookhere.Stock.insertStock", vo);
        }
      return count;
   }

}