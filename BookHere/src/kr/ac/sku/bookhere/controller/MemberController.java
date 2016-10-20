package kr.ac.sku.bookhere.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sku.bookhere.service.MemberService;
import kr.ac.sku.bookhere.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	// select
	@RequestMapping(value = "MemberList")
	@ResponseBody
	public Object MemberList(Model model) {	
		List<MemberVO> memberlist = memberService.selectMemberList();
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("memberlist", memberlist);
		retVal.put("code", "OK");
		return retVal;
	}
	
	// select
		@RequestMapping(value = "OwnerList")
		@ResponseBody
		public Object OwnerList(Model model) {	
			List<MemberVO> ownerlist = memberService.selectOwner();
			Map<String, Object> retVal = new HashMap<String, Object>();
			retVal.put("ownerlist", ownerlist);
			retVal.put("code", "OK");
			return retVal;
		}

	// insert
	@RequestMapping("MemberInsert")
	public String MemberInsert(MemberVO vo, HttpServletRequest req) {
		System.out.println(vo.toString());
		memberService.fileUpload(vo, req);
		int count = memberService.insertMember(vo);
		if (count == 1) {
			return "login";
		} else {
			return "signup";
		}
	}

	// delete
	@RequestMapping("MemberDelete")
	@ResponseBody
	public Map<String, String> MemberDelete(String id) {
		Map<String, String> retVal = new HashMap<String, String>();
		MemberVO vo = memberService.selectMember(id);
		if(vo.getOwner() == 0) {
			retVal.put("code", "user");
		}
		else {
			retVal.put("code", "owner");
		}
		memberService.deleteMember(id);
		return retVal;
	}

	// update
	@RequestMapping("MemberUpdate")
	public String MemberUpdate(MemberVO vo) {
		memberService.updateMember(vo);
		return "redirect:/MemberList";
	}
}
