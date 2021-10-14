package com.jyp.tw.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.MemberDAO;
import com.jyp.tw.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	
	@Override
	public Member login(Member member) {
		return memberDAO.selectLogin(member);
	}
	@Override
	public Map<String, Object> getMyInfo(int no) {
		
		Map<String,Object> modelMap=new ConcurrentHashMap<String, Object>();
		
		int total = memberDAO.selectOneTotalCount(no);
		
		modelMap.put("userInfo", memberDAO.selectOne(no));
		modelMap.put("delWaitingCount", total);
		
		
		return modelMap;
	}
	@Override
	public boolean checkId(String id) {
		return 1==memberDAO.selectid(id);
	}
	
	@Override
	public int makeMember(Member member) {
		return memberDAO.insert(member);
	}
	@Override
	public Member authorizeId(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.selectLoginByEmail(member);
	}
	
	@Override
	public int modify(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.updatePassword(member);
	}
	
	
	@Override
	public boolean modifyEmail(Member member) {
		return 1==memberDAO.updateEmail(member);
	}
}
