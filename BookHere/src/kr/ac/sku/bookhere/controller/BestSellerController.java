package kr.ac.sku.bookhere.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sku.bookhere.service.BestSellerService;
import kr.ac.sku.bookhere.thread.BestSellerThread;

@Controller
public class BestSellerController {
	@Autowired
	BestSellerService bestSellerService;

	@RequestMapping("index")
	public String BestSeller(Model model) {

		BestSellerThread kyobo = new BestSellerThread(1, bestSellerService);
		BestSellerThread ypbooks = new BestSellerThread(2, bestSellerService);
		BestSellerThread bandi = new BestSellerThread(3, bestSellerService);

		kyobo.start();
		ypbooks.start();
		bandi.start();

		try {
			kyobo.join();
			ypbooks.join();
			bandi.join();

			model.addAttribute("kyoboBestSeller", kyobo.toController());
			model.addAttribute("bandiBestSeller", ypbooks.toController());
			model.addAttribute("ypBestSeller", bandi.toController());

		} catch (Exception e) {
		}

		return "index";
	}

}
