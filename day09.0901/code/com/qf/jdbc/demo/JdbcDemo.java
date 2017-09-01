package com.qf.jdbc.demo;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Ctrl + Shift + O
 * @author Administrator
 *
 */
public class JdbcDemo {
	/*
	 * 连接url：
	 * 	协议:子协议://ip地址:端口号/dbname
	 * 	jdbc:mysql://localhost:3306/test
	 *  jdbc:mysql:///test
	 */
	private static String url = "jdbc:mysql://localhost:3306/test";
	private static String user = "root";
	private static String password = "886887";
	public static void main(String[] args) throws Exception {
		//insert();
		read(1);
		// remove(int id);
		// merge(int id,String name,String date,String addr);
		// sql = "update dep set dep_nam='"+name+"',dep_date='"+date+"',dep_addr='"+addr+"' where dep_id="+id 
		// list();
		// list(int currentpage,int max);
	}
	private static void read(int id) throws Exception {
		//注册驱动
		Class.forName("com.mysql.jdbc.Driver");
		//获取连接Connection
		Connection conn = DriverManager.getConnection(url, user,password);
		//通过连接创建语句对象
		Statement stmt = conn.createStatement();
		//定义要执行的sql语句==查询id为1的部门信息
		String sql = "select dep_id,dep_name as name,dep_date,dep_addr from dep where dep_id=" + id;
		//执行查询，得到结果集
		ResultSet rs = stmt.executeQuery(sql);
		//处理结果集
		if(rs.next()) {
//			System.out.println("部门id:" + rs.getInt(1));
//			System.out.println("部门name:" + rs.getString(2));
//			System.out.println("部门创建时间:" + rs.getDate(3));
//			System.out.println("部门地址:" + rs.getString(4));
			System.out.println("部门name:" + rs.getString("name"));
		}
		//关闭资源
		rs.close();
		stmt.close();
		conn.close();
	}
	/**
	 * 向dep表新增一条数据
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private static void insert() throws ClassNotFoundException, SQLException {
		//注册数据库驱动
		/*Driver driver = new com.mysql.jdbc.Driver();
		DriverManager.registerDriver(driver);*/
		Class.forName("com.mysql.jdbc.Driver");
		//System.setProperty("jdbc.driver", "com.mysql.jdbc.Driver");
			//在jdk1.6以后[如果没有注册驱动，jdbc会根据驱动文件（jar）自动帮我们注册驱动]
		//创建数据库连接
		Connection conn = DriverManager.getConnection
				(url, user, password);
		//拼写SQL语句
		String sql = "insert into dep(dep_name,"
				+ "dep_date,dep_addr) values "
				+ "('HR','2010-10-20','Lippo')";
		//创建发送语句对象
		Statement stmt = conn.createStatement();
		//发送语句对象执行SQL语句并获取数据库执行结果
		int count = stmt.executeUpdate(sql);//insert,update,delete
		//处理结果
		System.out.println(count);
		//关闭资源
		stmt.close();
		conn.close();
	}
}
