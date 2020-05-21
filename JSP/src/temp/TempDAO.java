package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TempDAO {
	String url = "";
	String user = "";
	String pass = "";

	static TempDAO dao;
	public static TempDAO getInstance() throws Exception{
		if(dao == null) {
			dao = new TempDAO();
		}
		
		return dao;
	}
	
	private TempDAO() throws ClassNotFoundException {
		// 1. 드라이빙
	      Class.forName("oracle.jdbc.driver.OracleDriver");// String을 받아서 클래스를 만듬
	      url = "jdbc:oracle:thin:@192.168.0.19:1521:orcl";
	      user = "scott";
	      pass = "tiger";   
	}

	public void insert(TempVO vo) {
		// 2. 연결객체 얻어오기
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, pass);
			// 3. sql 문장(insert문)
			String sql = "INSERT INTO TEMP2(ID, PASSWORD, NAME, TEL, ADDR) VALUES(?, ?, ?, ?, ?)";

			// 4. 전송객체 얻어오기 (PreparedStatement) + ? 지정
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, vo.getId());
			st.setString(2, vo.getPassword());
			st.setString(3, vo.getName());
			st.setString(4, vo.getPhone());
			st.setString(5, vo.getAddr());
			// 5. 전송(executeUpdate() 이용)
			int result = st.executeUpdate();
			// 6. 닫기
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/*
	 *	메소드명: login
	 *	매개변수: TempVO
	 *	리턴형: boolean
	 *	역할: 아이디와 패스워드를 받아서 해당 테이블에 존재하는지 확인 후 boolean 리턴한다.
	 */
	public boolean login(TempVO vo) throws Exception{
		boolean success = false;
		// 2. 연결객체 얻어오기
		Connection con = null;
		try {
		con = DriverManager.getConnection(url, user, pass);
		// 3. sql 문장(insert문)
		String sql = "SELECT * FROM TEMP2 WHERE ID=? AND PASSWORD=?";
		// 4. 전송객체 얻어오기 (PreparedStatement) + ? 지정
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, vo.getId());
		st.setString(2, vo.getPassword());
		// 5. 전송(executeQuery() 이용)
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			success = true;
		}
		// 6. 닫기
		st.close();
		rs.close();
		
		}finally{
		con.close();	
		}
		return success;
	}
	public TempVO login2(TempVO vo) throws Exception{
		// 2. 연결객체 얻어오기
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, pass);
			// 3. sql 문장(insert문)
			String sql = "SELECT * FROM TEMP2 WHERE ID=? AND PASSWORD=?";
			// 4. 전송객체 얻어오기 (PreparedStatement) + ? 지정
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, vo.getId());
			st.setString(2, vo.getPassword());
			// 5. 전송(executeQuery() 이용)
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				vo.setId("ID");
				vo.setPassword("ID");
			}
			// 6. 닫기
			st.close();
			rs.close();
			
		}finally{
			con.close();	
		}
		return vo;
	}
}
