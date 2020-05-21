package mybatis.guest.model;

import java.io.Serializable;

public class Comment implements Serializable{ //Mybatis에서는 java Beans가 통신을 타야하니 직렬화를 해야하는 구나.(지금은 안해도 실행 됨)
	private long commentNo;
	private String userId;
	private String commentContent;
	private String regDate; //날짜값을 가져와서 화면에 찍기만 할 경우는 오라클은 date형으로 잡아주고, java에서는 String형으로 해줄것
	
	public long getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(long commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}