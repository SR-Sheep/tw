package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Reply;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;
	
	//0303 오세훈
		@Override
		public int insertReply(Reply reply) {
			return session.insert("reply.insert", reply);
		}
}
