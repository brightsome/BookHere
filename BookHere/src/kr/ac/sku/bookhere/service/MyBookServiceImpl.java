package kr.ac.sku.bookhere.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sku.bookhere.dao.MemberDAO;
import kr.ac.sku.bookhere.dao.MyBookDAO;
import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.MyBookVO;
import kr.ac.sku.bookhere.vo.RecommendVO;

@Service("mybookService")
public class MyBookServiceImpl implements MyBookService {
	@Autowired
	MyBookDAO mybookDAO;
	
	
	
	@Override
	public MyBookVO selectMyBook(MyBookVO vo) {
		// TODO Auto-generated method stub
		return mybookDAO.selectMyBook(vo);
	}
	
	
	@Override
	public int insertMyBook(MyBookVO vo) {
		// TODO Auto-generated method stub
		return mybookDAO.insertMyBook(vo);
	}
	

	@Override
	public int deleteMyBook(MyBookVO vo) {
		// TODO Auto-generated method stub
		return mybookDAO.deleteMyBook(vo);
	}

	@Override
	public int updateMyBook(MyBookVO vo) {
		// TODO Auto-generated method stub
		return mybookDAO.updateMyBook(vo);
	}
	
	@Override
	public List<MyBookVO> selectMyBookList(String id){
		List<MyBookVO> mybooklist = new ArrayList<MyBookVO>();
		try{
		mybooklist = mybookDAO.selectMyBookList(id);
		
		}
		catch (Exception e1) {
			e1.printStackTrace();
		}
		return mybooklist;
	}


	@Override
	public List<RecommendVO> recommendMember(String id) {
		List<RecommendVO> recommendmember = new ArrayList<RecommendVO>();
		try{
			recommendmember = mybookDAO.recommendMember(id);
			for(int i=0;i<3;i++){
			String pic = mybookDAO.selectMemberPic(recommendmember.get(i).getId());
//			System.out.println("pic : "+ pic);
			recommendmember.get(i).setPic(pic);
			
			}
			}
		
			catch (Exception e1) {
				//e1.printStackTrace();
			}
		return recommendmember;
	}



	
	

	

}
