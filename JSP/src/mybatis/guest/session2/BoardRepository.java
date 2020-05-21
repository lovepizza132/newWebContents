package mybatis.guest.session2;

import java.io.*;
import java.util.*;

import mybatis.guest.model2.BoardRec;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class BoardRepository
{
	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config2.xml");
		} catch(IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory = new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	
	
	// 목록보여주기
	public List<BoardRec> selectList(int firstRow, int endRow){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("firstRow", firstRow);
			map.put("endRow", endRow);
			List<BoardRec> mList = sqlSess.selectList("BoardMapper.selectList", map);
		return mList;
		}finally {
			sqlSess.close();
		}
	}
	
	
	// 전체 페이지
	public int getTotalCount() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int count = sqlSess.selectOne("BoardMapper.getTotalCount");
			return count;
		}finally {
			sqlSess.close();
		}
	}
	
	
	// view 보여주기
	public BoardRec getArticleById(int articleId) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("articleId", articleId);
			BoardRec board = sqlSess.selectOne("BoardMapper.getArticleById", map);
			return board;
		}finally {
			sqlSess.close();
		}
	}
	
	
	// 조회수 증가
	public void increaseReadCount(int articleId) throws BoardException{
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update("BoardMapper.increaseReadCount", articleId);
			if( result>0 ) sqlSess.commit();
			else sqlSess.rollback();
		}finally {
			sqlSess.close();
		}
	}
	
	
	// 삭제
	public Integer deleteBoard(int articleId, String password) {
		int result = 0;
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("articleId",articleId);
			map.put("password", password);
			result = sqlSess.delete("BoardMapper.deleteBoard", map);
			if( result>0) sqlSess.commit();
			else sqlSess.rollback();
		return result;
		}finally {
			sqlSess.close();
		}
	}
	
	
	// 그룹아이디 nextval가져오기
	public Integer getGroupId() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		int groupId = 0;
		try {
			groupId = sqlSess.selectOne("BoardMapper.getGroupId");
			return groupId;
		}finally {
			sqlSess.close();
		}
	}
	
	// 입력하기
	public Integer insert(BoardRec board) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.insert("BoardMapper.insert", board);
			if( result>0) sqlSess.commit();
			else sqlSess.rollback();
			return sqlSess.selectOne("BoardMapper.getCurrentArticleId");
		}finally {
			sqlSess.close();
		}
	}
	
	// 수정하기
	public Integer modifyBoard(BoardRec board) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update("BoardMapper.modifyBoard", board);
			if( result>0) sqlSess.commit();
			else sqlSess.rollback();
			return result;
		}finally {
			sqlSess.close();
		}
	}
	
	// 답글달기
	public String selectLastSequenceNumber(String maxSeqNum, String minSeqNum) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map= new HashMap();
			map.put("maxSeqNum", maxSeqNum);
			map.put("minSeqNum", minSeqNum);
			String minSeq = sqlSess.selectOne("BoardMapper.selectLastSequenceNumber", map);
			return minSeq;
		}finally {
			sqlSess.close();
		}
	}
}