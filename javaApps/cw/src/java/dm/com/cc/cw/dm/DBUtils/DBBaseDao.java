package com.cc.cw.dm.DBUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.cc.cw.web.CwConfiguration;

public class DBBaseDao {
	private static String baseDir = CwConfiguration.create().get("dm.jdbcproperties");
	 public static Connection getConnection() throws InstantiationException,
		IllegalAccessException, ClassNotFoundException, SQLException, IOException {
			FileInputStream fis=new FileInputStream(baseDir+"jdbc.properties");
			Properties pro=new Properties();
			pro.load(fis);
			String driver = pro.getProperty("jdbc.driverClassName");
			String url = pro.getProperty("jdbc.url");
			String usr = pro.getProperty("jdbc.username");
			String pwd = pro.getProperty("jdbc.password");
		Class.forName(driver).newInstance();
		Connection conn=DriverManager.getConnection(url,
				usr, pwd);

	return conn;
	 }
	 
	 public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException, IOException {
		
	}
}
