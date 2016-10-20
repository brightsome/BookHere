package kr.ac.sku.bookhere.thread;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.sku.bookhere.service.BestSellerService;
import kr.ac.sku.bookhere.vo.BestSellerVO;

public class BestSellerThread extends Thread {
	@Autowired
	BestSellerService bestSellerService;
	int type;
	
	List<BestSellerVO> result = new ArrayList<BestSellerVO>();
	
	public BestSellerThread (int type, BestSellerService bestSellerService) {
		this.bestSellerService = bestSellerService;
		this.type = type;
	}

	@Override
	public void run() {
		switch (type) {
		case 1:
			result = bestSellerService.kyobo();
			toController();
			break;
		case 2:
			result = bestSellerService.bandi();
			toController();
			break;
		case 3:
			result = bestSellerService.ypbooks();
			toController();
			break;
		}
	}
	
	public List<BestSellerVO> toController() {
		return result;
	}
}
