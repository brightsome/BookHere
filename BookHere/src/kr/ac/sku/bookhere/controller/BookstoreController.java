package kr.ac.sku.bookhere.controller;

import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sku.bookhere.dao.StockDAO;
import kr.ac.sku.bookhere.service.BookStoreService;
import kr.ac.sku.bookhere.service.MemberService;
import kr.ac.sku.bookhere.vo.BookStoreVO;
import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.OwnerVO;
import kr.ac.sku.bookhere.vo.StockVO;

@Controller
public class BookstoreController {

	@Autowired
	BookStoreService bookstoreService;

	@Autowired
	MemberService memberService;

	@Autowired
	StockDAO stockDAO;

	// insert
	@RequestMapping("BookstoreInsert")
	public String BookstoreInsert(HttpServletRequest request, Model model, BookStoreVO vo) throws Exception {

		// BRANCHID
		int bookstoreCount = bookstoreService.countBookstore();
		bookstoreCount = bookstoreCount + 1;
		vo.setBranchid(bookstoreCount);

		// STORENAME
		vo.setStorename("동네서점");

		// BRANCHNAME
		String branchname = vo.getBranchname();
		vo.setBranchname(branchname);

		// ADDRESS
		String address = vo.getAddress();
		String addressDetail = request.getParameter("addressDetail");
		vo.setAddress(address + " " + addressDetail);

		// PHONENUM
		vo.setPhonenum(vo.getPhonenum());

		// WEBSITE
		String id = request.getParameter("id");
		vo.setWebsite(id);

		// PIC
		vo.setPic(bookstoreService.fileUpload(vo, request));

		// LATITUDE, LONGITUDE
		InputStreamReader isr;
		address = address.replace(" ", "");
		address = URLEncoder.encode(address, "UTF-8");
		URL url = new URL("https://apis.daum.net/local/geo/addr2coord?" + "apikey=b06a50bbe5f4ffcc16dc850c45a67fd1&q="
				+ address + "&output=json");
		isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
		JSONObject object = (JSONObject) JSONValue.parseWithException(isr);
		JSONObject channel = (JSONObject) (object.get("channel"));
		JSONArray items = (JSONArray) channel.get("item");
		JSONObject obj1 = (JSONObject) items.get(0);
		String latitude = obj1.get("lat").toString();
		vo.setLatitude(latitude);
		String longitude = obj1.get("lng").toString();
		vo.setLongitude(longitude);

		/*
		 * //엑셀 String path = request.getRealPath("/upload"); String upPath =
		 * path + "\\" + vo.getFileattach().getOriginalFilename(); File file =
		 * new File(upPath);
		 * 
		 * try { vo.getFileattach().transferTo(file); } catch
		 * (IllegalStateException | IOException e) { e.printStackTrace(); }
		 */
		/*
		 * String storename = request.getParameter("storename");
		 * vo.setStorename(storename); storename = URLEncoder.encode(storename,
		 * "UTF-8");
		 * 
		 * String phonenum = request.getParameter("phonenumber");
		 * vo.setPhonenum(phonenum);
		 * 
		 * String branchname = request.getParameter("branchname");
		 * vo.setBranchname(branchname);
		 * 
		 * InputStreamReader isr;
		 * 
		 * URL url = new URL("https://apis.daum.net/local/geo/addr2coord?" +
		 * "apikey=b06a50bbe5f4ffcc16dc850c45a67fd1&q=" + storename); isr = new
		 * InputStreamReader(url.openConnection().getInputStream(), "UTF-8"); //
		 * JSON을 Parsing 한다. 문법오류가 날 경우 Exception 발생, without Exception -> //
		 * parse 메소드 JSONObject object = (JSONObject)
		 * JSONValue.parseWithException(isr); // 객체 JSONObject channel =
		 * (JSONObject) (object.get("channel")); // item 배열 JSONArray items =
		 * (JSONArray) channel.get("item"); JSONObject obj1 = (JSONObject)
		 * items.get(0);
		 * 
		 * String latitude = obj1.get("latitude").toString();
		 * vo.setLatitude(latitude); String longitude =
		 * obj1.get("longitude").toString(); vo.setLongitude(longitude); String
		 * address = obj1.get("newAddress").toString(); vo.setAddress(address);
		 * vo.setWebsite(id);
		 * 
		 * int count = bookstoreService.insertBookstore(vo);
		 * 
		 * list = ExcelManager.getInstance().getListExcel(file, id);
		 * 
		 * memberService.updateOwner(id); stockDAO.insertStock(list);
		 * 
		 * if (count == 1) { model.addAttribute("bookstore",
		 * bookstoreService.bookstoreList()); return "bookstore"; } else {
		 * return "registerBookstore"; }
		 */
		bookstoreService.insertBookstore(vo);

		return "redirect:/bookstorePage";
	}

	@RequestMapping(value = "bookstoreSearch")
	@ResponseBody
	public Object BookstoreSearch(HttpServletRequest request, Model model) {
		String searchTxt = request.getParameter("searchTxt");
		List<BookStoreVO> search = bookstoreService.selectBookstore(searchTxt);

		Map<String, Object> retVal = new HashMap<String, Object>();

		retVal.put("bookList", search);
		retVal.put("code", "OK");
		return retVal;
	}

	@RequestMapping(value = "gbookstoreList")
	@ResponseBody
	public Object gBookstoreList(HttpServletRequest request, Model model) {
		List<BookStoreVO> gbookstorelist = bookstoreService.gbookstoreList();
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("gbookstorelist", gbookstorelist);
		retVal.put("code", "OK");
		return retVal;
	}

	@RequestMapping(value = "bookstoreList")
	@ResponseBody
	public Object BookstoreList(HttpServletRequest request, Model model) {
		List<BookStoreVO> bookstorelist = bookstoreService.bookstoreList();
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("bookstorelist", bookstorelist);
		retVal.put("code", "OK");
		return retVal;
	}

	// delete
	@RequestMapping("BookstoreDelete")
	@ResponseBody
	public Map<String, String> BookstoreDelete(String branchid) {
		Map<String, String> retVal = new HashMap<String, String>();
		BookStoreVO vo = bookstoreService.selectOneBookstore(branchid);
		String storename = vo.getStorename();
		if (storename.equals("교보문고") || storename.equals("영풍문고") || storename.equals("반디앤루니스")
				|| storename.equals("알라딘")) {
			retVal.put("code", "gbookstore");
		} else {
			retVal.put("code", "bookstore");
		}
		bookstoreService.deleteBookstore(branchid);
		return retVal;
	}

	// select
	@RequestMapping(value = "ownerandbookstore")
	@ResponseBody
	public Object OwnerandBookstore(Model model) {
		List<OwnerVO> list = bookstoreService.ownerandbookstore();
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("ownerandbookstoreList", list);
		retVal.put("code", "OK");
		return retVal;
	}
	
	@RequestMapping(value = "acceptOwner")
	@ResponseBody
	public Object AcceptOwner(int branchid, String id) {
		Map<String, String> retVal = new HashMap<String, String>();
		OwnerVO vo = new OwnerVO();
		vo.setId(id);
		vo.setBranchid(branchid);
		bookstoreService.updateWebstie(vo);
		memberService.updateOwner(id);
		retVal.put("code", "OK");
		return retVal;
	}
	
	@RequestMapping(value = "denyOwner")
	@ResponseBody
	public Object DenyOwner(String branchid, String id) {
		Map<String, String> retVal = new HashMap<String, String>();
		bookstoreService.deleteBookstore(branchid);
		retVal.put("code", "OK");
		return retVal;
	}

}
