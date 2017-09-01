package com.qf.jdbc.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBHelper {
	private static String url;
	private static String user;
	private static String password;
	private static String driverClass;
	/**
	 * 注册驱动--初始化操作
	 */
	static {
		try {
			Properties prop = new Properties();
			InputStream inStream = DBHelper.class.getClassLoader().getResourceAsStream("jdbc.properties");
			prop.load(inStream);
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			password = prop.getProperty("pwd");
			driverClass = prop.getProperty("driverClass");
			Class.forName(driverClass);
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获得数据库连接对象
	 */
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
		return conn;
	}

	/**
	 * 释放相关jdbc资源
	 * 
	 * @param rs 结果集对象
	 * @param stmt 语句对象
	 * @param conn 连接对象
	 */
	public void free(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

	}
}
