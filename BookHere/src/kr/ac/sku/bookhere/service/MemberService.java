package kr.ac.sku.bookhere.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.ac.sku.bookhere.vo.MemberVO;

public interface MemberService {
   // dao.deleteMember
   public int deleteMember(String id);

   // dao.insertMember
   public int insertMember(MemberVO vo);

   // dao.selectMember
   public MemberVO selectMember(String id);
   
   // dao.selectOwner
   public List<MemberVO> selectOwner();
   
   // dao.selectMemberList
   public List<MemberVO> selectMemberList();
   
   // dao.selectMemberList
   public List<MemberVO> selectTopMemberList();

   // dao.updateMember
   public int updateMember(MemberVO vo);
   
   // 파일업로드
   public String fileUpload(MemberVO vo, HttpServletRequest req);
   
   // dao.updateOwner
    public int updateOwner(String id);
    
   // dao.updateOwner
    public int updateLikeCount(String id);
}