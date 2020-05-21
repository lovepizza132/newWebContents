package guest.model;

public class Message {
	// property
	String guestName; // 입력받는 input태그의 name과 같게 해야만 나중에 getParameter에서 "*"로 한번에 사용가능
	String password;
	String message;
	int messageId;
	
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
}
