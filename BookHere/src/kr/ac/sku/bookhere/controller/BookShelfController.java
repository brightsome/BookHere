package kr.ac.sku.bookhere.controller;

import java.util.List;

import kr.ac.sku.bookhere.service.BookShelfService;
import kr.ac.sku.bookhere.service.MemberService;
import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.PageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sku.bookhere.vo.SearchVO;


@Controller
public class BookShelfController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BookShelfService bookshelfService;
	
	
	public PageVO makePageVO(Integer page, int totalRows) {
		
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 9; 
		int pagesPerBlock = 5;  //블럭당 페이지 수
		if (page == null) page = 0;
		if(page  == 0) page = 1; 
		int currentPage = page; 
		int currentBlock = 0; 
		if (currentPage % pagesPerBlock == 0) {
			currentBlock = currentPage / pagesPerBlock;
		} else { 
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1; // ���۸�ϰ�����
		int endRow = currentPage * rowsPerPage;

	
		int totalPages = 0;
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
		return pageInfo;
	}

	// select
	@RequestMapping("bookshelfList")
	public String BookshelfList(@RequestParam("id")String id,Model model,Integer page,SearchVO vo
			){
		
		// pageVO�� ȹ��
//		int totalRows = memberService.selectMemberCount();
//		PageVO pageInfo = makePageVO(page, totalRows);
	
//		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
//		vo.setEnd(String.valueOf(pageInfo.getEndRow()));
		if(id!=null&&!"".equals(id)){
		List<MemberVO> memberList = memberService.selectMemberList();
		model.addAttribute("memberList", memberList);
		List<MemberVO> topmemberlist = memberService.selectTopMemberList();
		model.addAttribute("topMemberList",topmemberlist);
		return "bookshelfList";
		}else
			return "redirect:/loginPage";
	}
	
	@RequestMapping("searchBookShelf")
	public String searchGuestbook(Model model,String searchType,String search){
		List<MemberVO> topmemberlist = memberService.selectTopMemberList();
		model.addAttribute("topMemberList",topmemberlist);
		if(searchType!=null&&!"".equals(search)){

			if(searchType.equals("1")){
				model.addAttribute("memberList",bookshelfService.selectBookShelfList(search));
			}
			else if(searchType.equals("2")){
				model.addAttribute("memberList",bookshelfService.selectBookNameList(search));
			}
			else if(searchType.equals("3")){
				model.addAttribute("memberList",bookshelfService.selectMemberList(search));
			}
		}else{
			model.addAttribute("memberList", memberService.selectMemberList());
		}

		//model.addAttribute("selectGuestbook",GuestbookService.searchGuestbook());
		return "bookshelfList";
	}
	
	//update like count
	@RequestMapping("LikeCountUpdate")
	public String LikeCountUpdate(Model model,String id) {
		memberService.updateLikeCount(id);
		return "redirect:/bookshelfList?id="+id;
	}
	
	
	//update like count2
	@RequestMapping("LikeCountUpdate2")
	public String LikeCountUpdate2(Model model,String id) {
		memberService.updateLikeCount(id);
		return "redirect:/MyBookSelect?id="+id;
	}
	
	
}
