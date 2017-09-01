package com.qf.jdbc.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.qf.jdbc.util.DBHelper;

public class EmployeeJdbc {
	private DBHelper helper = new DBHelper();
	/**
	 * 新增一条Employee信息进数据库
	 * @param name
	 * @param depno
	 */
	public void save(String name,int depno) {
		//1.获取连接
		Connection conn = helper.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "insert into emp(emp_name,dep_id) values ('"+name+"',"+depno+")";
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			helper.free(null, stmt, conn);
		}
	}
	
	public boolean login(String username,String password) {
		/*boolean ret = false;
		//查询sql
		String sql = "select user_name,user_pwd from users where user_name='" + username + "' and user_pwd='" + password + "'";
		System.out.println(sql);
		Connection conn = helper.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				ret = rs.getString("user_pwd").equals(password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;*/
		boolean ret = false;
		Connection conn = helper.getConnection();
		PreparedStatement ptst = null;
		ResultSet rs = null;
		try {
			ptst = conn.prepareStatement("select user_name from users where user_name=? and user_pwd=?");
			ptst.setString(1, username);
			ptst.setString(2, password);
			rs = ptst.executeQuery();
			ret = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			helper.free(rs, ptst, conn);
		}
		return ret;
	}
	
	public void merge(int id,String name,int depno) {
		String sql = "update emp set emp_name=?,dep_id=? where emp_id=?";
		Connection conn = helper.getConnection();
		PreparedStatement ptst = null;
		try {
			ptst = conn.prepareStatement(sql);
			//对占位符?进行赋值操作
			ptst.setString(1, name);
			ptst.setInt(2, depno);
			ptst.setInt(3, id);
			ptst.executeUpdate();//statement.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			helper.free(null, ptst, conn);
		}
	}
	
	public void remove(int id) {}
	
	public void get(int id) {}
	
	public void list() {}
	public void paging(int currentPage,int max) {}
}
