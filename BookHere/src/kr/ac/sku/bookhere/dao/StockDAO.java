package kr.ac.sku.bookhere.dao;

import java.util.List;

import kr.ac.sku.bookhere.vo.StockVO;

public interface StockDAO {
   // INSERT
   public int insertStock(List<StockVO> list) throws RuntimeException;
}