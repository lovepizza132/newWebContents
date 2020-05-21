package info.beans;

// (우리가 알고 있는 VO==bean)
public class InfoBean {
	// property
	private String name;
	private String id;
	
	private int getsu;
	private boolean flag; // boolean은 set과 is(get과 동일)로 만들어짐
	
	
	
	public int getGetsu() {
		return getsu;
	}

	public void setGetsu(int getsu) {
		this.getsu = getsu;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	
	public String getGender() {
		char sex = id.charAt(7);
		if(sex=='1' || sex=='3') return "남자";
		else return "여자";
	}
}
