package kr.ac.sku.bookhere.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sku.bookhere.dao.BookStoreDAO;
import kr.ac.sku.bookhere.vo.BookStoreVO;
import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.OwnerVO;

@Service("bookstoreService")
public class BookStoreServiceImpl implements BookStoreService {

	@Autowired
	BookStoreDAO bookstoreDAO;

	@Override
	public List<BookStoreVO> kyoboStoreList() throws RuntimeException {
		return bookstoreDAO.kyoboStoreList();
	}

	@Override
	public List<BookStoreVO> bandiStoreList() throws RuntimeException {
		return bookstoreDAO.bandiStoreList();
	}

	@Override
	public List<BookStoreVO> ypStoreList() throws RuntimeException {
		return bookstoreDAO.ypStoreList();
	}

	@Override
	public List<BookStoreVO> aladinStoreList() throws RuntimeException {
		return bookstoreDAO.aladinStoreList();
	}

	@Override
	public int insertBookstore(BookStoreVO vo) throws RuntimeException {
		return bookstoreDAO.insertBookstore(vo);
	}

	@Override
	public List<BookStoreVO> gbookstoreList() throws RuntimeException {
		return bookstoreDAO.gbookstoreList();
	}

	@Override
	public List<BookStoreVO> bookstoreList() throws RuntimeException {
		return bookstoreDAO.bookstoreList();
	}

	@Override
	public List<BookStoreVO> selectBookstore(String searchTxt) throws RuntimeException {
		return bookstoreDAO.selectBookstore2(searchTxt);
	}

	@Override
	public int countBookstore() throws RuntimeException {
		return bookstoreDAO.countBookstore();
	}

	@Override
	public int deleteBookstore(String branchid) throws RuntimeException {
		return bookstoreDAO.deleteBookstore(branchid);
	}

	@Override
	public BookStoreVO selectOneBookstore(String branchid) {
		return bookstoreDAO.selectOneBookstore(branchid);
	}

	@Override
	public String fileUpload(BookStoreVO vo, HttpServletRequest req) {

		String path = req.getRealPath("/upload");
		String upPath = path + "\\" + vo.getBookstorefile().getOriginalFilename();
		File f = new File(upPath);

		try {
			vo.getBookstorefile().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setPic(vo.getBookstorefile().getOriginalFilename());

		return vo.getPic();
	}

	@Override
	public List<OwnerVO> ownerandbookstore() throws RuntimeException {
		return bookstoreDAO.ownerandbookstore();
	}

	@Override
	public int updateWebstie(OwnerVO vo) {
		return bookstoreDAO.updateWebstie(vo);
	}

}