package com.qf.jdbc.client;

import com.qf.jdbc.demo.EmployeeJdbc;

public class EmployeeClient {
	public static void main(String[] args) {
		EmployeeJdbc demo = new EmployeeJdbc();
		//demo.save("秦始皇", 2);

		//System.out.println(demo.login("admin", "admin"));;
		System.out.println(demo.login("admin", "xxxxx12312' or 1 or '"));;
		demo.merge(1, "张翠山", 1);
	}

}
