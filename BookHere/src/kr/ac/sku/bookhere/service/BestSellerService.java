package kr.ac.sku.bookhere.service;

import java.util.List;

import kr.ac.sku.bookhere.vo.BestSellerVO;

public interface BestSellerService {
	public List<BestSellerVO> kyobo();

	public List<BestSellerVO> bandi();

	public List<BestSellerVO> ypbooks();
	
	
}
