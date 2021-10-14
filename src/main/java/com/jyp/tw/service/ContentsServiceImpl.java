package com.jyp.tw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.ContentsDAO;
import com.jyp.tw.vo.Contents;

@Service
public class ContentsServiceImpl implements ContentsService{

	@Autowired
	private ContentsDAO contentsDAO;
	
	@Override
	public int totalContentsCount() {
		return contentsDAO.selectTotalContents();
	}
	
	@Override
	public int onContentsCount() {
		return contentsDAO.selectOnContents();
	}
	
	@Override
	public List<Contents> getContentsList() {
		return contentsDAO.selectContentsList();
	}
	
}
