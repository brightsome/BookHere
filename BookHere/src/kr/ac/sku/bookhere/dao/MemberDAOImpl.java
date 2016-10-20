package kr.ac.sku.bookhere.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sku.bookhere.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertMember(MemberVO vo) throws RuntimeException {
		return sqlSession.insert("kr.ac.sku.bookhere.Member.insertMember", vo);
	}

	@Override
	public int deleteMember(String id) throws RuntimeException {
		return sqlSession.delete("kr.ac.sku.bookhere.Member.deleteMember", id);
	}

	@Override
	public int updateMember(MemberVO vo) throws RuntimeException {
		return sqlSession.update("kr.ac.sku.bookhere.Member.updateMember", vo);
	}

	@Override
	public MemberVO selectMember(String id) throws RuntimeException {
		return sqlSession.selectOne("kr.ac.sku.bookhere.Member.selectMember", id);
	}

	@Override
	public List<MemberVO> selectOwner() throws RuntimeException {
		return sqlSession.selectList("kr.ac.sku.bookhere.Member.selectOwner");
	}

	@Override
	public List<MemberVO> selectMemberList() throws RuntimeException {
		List<MemberVO> memberList = new ArrayList<>();
		memberList = sqlSession.selectList("kr.ac.sku.bookhere.Member.selectMemberList");
		return memberList;
	}

	@Override
	public List<MemberVO> selectTopMemberList() throws RuntimeException {
		List<MemberVO> topMemberList = new ArrayList<>();
		topMemberList = sqlSession.selectList("kr.ac.sku.bookhere.Member.selectTopMemberList");
		return topMemberList;
	}

	@Override
	public int updateOwner(String id) throws RuntimeException {
		return sqlSession.update("kr.ac.sku.bookhere.Member.updateOwner", id);
	}

	@Override
	public int updateLikeCount(String id) throws RuntimeException {
		// TODO Auto-generated method stub
		return sqlSession.update("kr.ac.sku.bookhere.Member.updateLikeCount", id);
	}

}