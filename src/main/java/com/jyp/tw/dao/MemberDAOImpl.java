package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Member;
import com.jyp.tw.vo.PageVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Member> selectMemberList(PageVO pageVO) {
		return session.selectList("member.selectMemberList",pageVO);
	}
	
	@Override
	public int selectMemberTotal() {
		return session.selectOne("member.selectMemberTotal");
	}
	@Override
	public int updateMemberBan(int no) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberBan",no);
	}
	@Override
	public int selectBanCount(int no) {
		return session.selectOne("member.selectBanCount", no);
	}
	@Override
	public int updatecancelBan(int no) {
		return session.update("member.updateCancelBan", no);
	}
	@Override
	public Member selectLogin(Member member) {
		return session.selectOne("member.selectLogin",member);
	}
	@Override
	public int selectOneTotalCount(int no) {
		return session.selectOne("member.selectOneTotalCount", no);
	}
	@Override
	public Member selectOne(int no) {
		return session.selectOne("member.selectOne", no);
	}
	@Override
	public int selectid(String id) {
		return session.selectOne("member.selectId",id);
	}
	
	@Override
	public int insert(Member member) {
		return session.insert("member.insert",member);
	}
	@Override
	public Member selectLoginByEmail(Member member) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectLoginByEmail",member);
	}
	@Override
	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return session.update("member.updatePassword",member);
	}
	
	@Override
	public int updateEmail(Member member) {
		// TODO Auto-generated method stub
		return session.update("member.updateEmail",member);
	}
	
}
