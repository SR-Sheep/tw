package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.Member;
import com.jyp.tw.vo.PageVO;

public interface MemberDAO {
	
	public List<Member> selectMemberList(PageVO pageVO);
	public int selectMemberTotal();
	public int updateMemberBan(int no);
	public int selectBanCount(int no);
	public int updatecancelBan(int no);
	public Member selectLogin(Member member);
	public int selectOneTotalCount(int memberNo);
	public Member selectOne(int no);
	public int selectid(String id);
	public int insert(Member member);
	public Member selectLoginByEmail(Member member);
	public int updatePassword(Member member);
	public int updateEmail(Member member);
}
