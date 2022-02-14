package com.us.uni.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

@Repository
public class MailDao {

	public int selectInboxListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("mailMapper.selectInboxListCount", userNo);
	}

	public ArrayList<MailTo> selectInboxList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectInboxList", userNo, rowBounds);
	}
	
	public int saveDraft(SqlSessionTemplate sqlSession, MailFrom mf) {

		return sqlSession.insert("mailMapper.saveDraft", mf);
	}

	public int selectDraftListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("mailMapper.selectDraftListCount", userNo);
	}

	public ArrayList<MailFrom> selectDraftList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectDraftList", userNo, rowBounds);
	}

	public MailFrom selectDraft(SqlSessionTemplate sqlSession, int mfNo) {
		
		return sqlSession.selectOne("mailMapper.selectDraft", mfNo);
	}

	public int insertUpdateMailFrom(SqlSessionTemplate sqlSession, MailFrom mf) {

		if(mf.getMailNo() == 0) {
			return sqlSession.insert("mailMapper.insertMailFrom", mf);
		}else {
			return sqlSession.update("mailMapper.updateMailFrom", mf);			
		}
		
	}

	public int insertMailTo(SqlSessionTemplate sqlSession, MailTo mt) {
				
		if(mt.getMailFromNo() == 0) {
			return sqlSession.insert("mailMapper.insertMailTo", mt);			
		}else {
			return sqlSession.insert("mailMapper.insertDraftMailTo", mt);			
		}
	}
	
	public int insertCcMailTo(SqlSessionTemplate sqlSession, MailTo mt) {
		
		if(mt.getMailFromNo() == 0) {
			return sqlSession.insert("mailMapper.insertCcMailTo", mt);			
		}else {
			return sqlSession.insert("mailMapper.insertDraftCcMailTo", mt);
		}
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment att) {
		
		if(att.getRefNo() == 0) {
			return sqlSession.insert("mailMapper.insertAttachment",att);			
		}else {
			return sqlSession.insert("mailMapper.insertDraftAttachment", att);			
		}
	}

	public int selectSentListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("mailMapper.selectSentListCount", userNo);
	}

	public ArrayList<MailFrom> selectSentList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSentList", userNo, rowBounds);
	}

	

}
