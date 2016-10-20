package kr.ac.sku.bookhere.dao;

import java.util.List;

import kr.ac.sku.bookhere.vo.MemberVO;
import kr.ac.sku.bookhere.vo.OwnerVO;

public interface MemberDAO {
	// INSERT
	public int insertMember(MemberVO vo) throws RuntimeException;

	// SELECT ALL MEMBER
	public List<MemberVO> selectMemberList() throws RuntimeException;

	// SELECT Top Member
	public List<MemberVO> selectTopMemberList() throws RuntimeException;

	// SELECT
	public MemberVO selectMember(String id) throws RuntimeException;

	// SELECT
	public List<MemberVO> selectOwner() throws RuntimeException;

	// DELETE
	public int deleteMember(String id) throws RuntimeException;

	// UPDATE
	public int updateMember(MemberVO vo) throws RuntimeException;

	public int updateOwner(String id) throws RuntimeException;

	public int updateLikeCount(String id) throws RuntimeException;
	
}