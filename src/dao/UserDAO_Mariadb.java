package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.JDBCUtil;
import vo.UserVO;

public class UserDAO_Mariadb {

	
	
	public UserVO login(String id,String password){
		UserVO vo = null;
		String sql ="select * from user where id=? and password=?";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = JDBCUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
			   vo = new UserVO();
			   vo.setId(rs.getString("id"));
			   vo.setName(rs.getString("name"));
			   vo.setPassword(rs.getString("password"));
			   vo.setRole(rs.getString("role"));
			}
			
		} catch (Exception e) {
		  e.printStackTrace();	
		}finally {
			JDBCUtil.close(con, ps, rs);
		}
		return vo;
	}
	
	public UserVO login(UserVO vo){
        return login(vo.getId(),vo.getPassword());
	}
	
}
