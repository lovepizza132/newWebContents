package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.*;
import mybatis.guest.session.*;

public class CommentService {
	
	private static CommentService service;
	 
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	private CommentService() {} //이걸 안하면 디폴트값으로 public CommentService(){}생성자 생성 그러면 new로 계속 만들어져서 꼭 해야함
	
	CommentRepository repo = new CommentRepository();
	
	// 목록보기
	public List<Comment> selectComment() {
		return repo.selectComment();
	}
	
	// 입력하기
	public Integer insertComment(Comment c) {
		return repo.insertComment(c);
	}
	//
	public Comment selectCommentByPrimaryKey(long commentNo) {		
		return repo.selectCommentByPk(commentNo);
	}
	// 삭제하기
	public Integer deleteComment(String cNo) {
		long commentNo = 0;
		if(cNo != null) commentNo = Long.parseLong(cNo);
		return repo.deleteComment(commentNo);
	}
	
	// 수정하기
	public Integer update(Comment comment) {
		return repo.update(comment);
	}
	
}