package com.us.uni.academicStatus.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.academicStatus.model.vo.AcademicStatus;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.users.model.vo.Users;

@Repository
public class AcademicStatusDao {

	public String selectStuInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("academicMapper.selectStuInfo", userNo);
	}

	public int applyAsOff(SqlSessionTemplate sqlSession, AcademicStatus as) {
		return sqlSession.insert("academicMapper.applyAsOff", as);
	}
	
	public int applyAsBack(SqlSessionTemplate sqlSession, AcademicStatus as) {
		return sqlSession.insert("academicMapper.applyAsBack", as);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("academicMapper.insertAttachment",att);
	}

	public ArrayList<AcademicStatus> selectAsList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("academicMapper.selectAsList", userNo);
	}

	public AcademicStatus selectAs(SqlSessionTemplate sqlSession, int asNo) {
		return sqlSession.selectOne("academicMapper.selectAs", asNo);
	}
	
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int asNo) {
		return (ArrayList)sqlSession.selectList("academicMapper.selectAttachmentList", asNo);
	}
	
	public int selectProfAsListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("academicMapper.selectProfAsListCount", userNo);
	}

	public ArrayList<AcademicStatus> selectProfAsList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("academicMapper.selectProfAsList", userNo, rowBounds);
	}

	public AcademicStatus selectOffApply(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("academicMapper.selectOffApply", userNo);
	}

	public Users selectStudInfo(SqlSessionTemplate sqlSession, int studNo) {
		return sqlSession.selectOne("academicMapper.selectStudInfo", studNo);
	}

	public int changeAsStatus(SqlSessionTemplate sqlSession, AcademicStatus as) {
		return sqlSession.update("academicMapper.changeAsStatus", as);			
	}
	
	public int changeAsFinalStatus(SqlSessionTemplate sqlSession, AcademicStatus as) {		
		return sqlSession.update("academicMapper.changeAsFinalStatus", as);
	}	

	public int selectAdminAsListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("academicMapper.selectAdminAsListCount");
	}

	public ArrayList<AcademicStatus> selectAdminAsList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("academicMapper.selectAdminAsList", rowBounds);
	}


}
