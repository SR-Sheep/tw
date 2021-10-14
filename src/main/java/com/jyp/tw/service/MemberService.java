package com.jyp.tw.service;

import java.util.Map;

import com.jyp.tw.vo.Member;

public interface MemberService {

	public Member login(Member member);
	public Map<String, Object> getMyInfo(int no);
	public boolean checkId(String id);
	public int makeMember(Member member);
	public Member authorizeId(Member member);
	public int modify(Member member);
	public boolean modifyEmail(Member member);
}
