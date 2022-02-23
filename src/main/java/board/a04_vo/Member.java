package board.a04_vo;

public class Member {
	private String id;
	private String pass;
	private String name;
	private int point;
	private String auth;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pass, String name, int point, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.point = point;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
