
package com.starbucks.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConn2 {
		//Field
		String url = "jdbc:oracle:thin:@localhost:1521";
		String user = "scott";
		String pass = "tiger";
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		//Constructor
		public DBConn2() {
	    	try {
	    		//1�ܰ� - ����̹� �ε�
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.print("1�ܰ�");
				
				//2�ܰ� - Connection ��ü ����
				conn = DriverManager.getConnection(url, user, pass);
				System.out.print("2�ܰ�");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  	
			
		}
		//Method
		public void getStatement() {
			try {			
				//3�ܰ� - Statement ��ü ����
				stmt = conn.createStatement();
				System.out.print("3�ܰ�");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
