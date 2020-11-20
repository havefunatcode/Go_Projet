package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

//connection  담당
public class JDBCUtil {

	public static Connection getConnection() {
		Connection con = null;
		
		
		Properties p = new Properties();  //try catch 로 감싼다.
		try {
			// File IO 작업을 할때는 절대주소를 사용하는 것이 바람직하다.
			p.load(new FileInputStream("c:/develope/lib/dbinfo.txt"));  //db연결
			
			String driver = p.getProperty("_driver"); //정보를 가지고 온다.
			String url = p.getProperty("_url");	//diinfo에 정보와 같아야한다
			String user= p.getProperty("_user");
			String pw = p.getProperty("_pw");
			
			Class.forName(driver);

			con = DriverManager.getConnection(url, user, pw);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	public static void close(Connection con , Statement st , ResultSet rs) {		
		try {
			if(rs !=null)rs.close();
			if(st !=null)st.close();
			if(con !=null)con.close(); //자원 반납
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
