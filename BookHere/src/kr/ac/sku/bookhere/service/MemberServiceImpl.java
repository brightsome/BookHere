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
import org.springframework.web.servlet.ModelAndView;

import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
   @Autowired
   MemberDAO memberDAO;

   @Override
   public int deleteMember(String id) {
      return memberDAO.deleteMember(id);
   }

   @Override
   public int insertMember(MemberVO vo) {
      return memberDAO.insertMember(vo);
   }

   @Override
   public MemberVO selectMember(String id) {
      return memberDAO.selectMember(id);
   }
   
   @Override
   public List<MemberVO> selectOwner() {
      return memberDAO.selectOwner();
   }
   
   @Override
   public List<MemberVO> selectMemberList() {
      List<MemberVO> memberList = new ArrayList<MemberVO>();
      memberList = memberDAO.selectMemberList();
      return memberList;
   }
   
   @Override
   public List<MemberVO> selectTopMemberList() {
      List<MemberVO> topMemberList = new ArrayList<MemberVO>();
      topMemberList = memberDAO.selectTopMemberList();
      return topMemberList;
   }

   @Override
   public int updateMember(MemberVO vo) {
      return memberDAO.updateMember(vo);
   }


   @Override
   public String fileUpload(MemberVO vo, HttpServletRequest req) {

      String path = req.getRealPath("/upload");
      String upPath = path + "\\" + vo.getUfile().getOriginalFilename();
      File f = new File(upPath);

      try {
         vo.getUfile().transferTo(f);
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }
      vo.setPic(vo.getUfile().getOriginalFilename());

      return vo.getPic();
   }


   @Override
   public int updateOwner(String id) {
      return memberDAO.updateOwner(id);
   }

   @Override
   public int updateLikeCount(String id) {
      return memberDAO.updateLikeCount(id);
   }



}