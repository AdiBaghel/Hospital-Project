package org.nimhans.NIMHANSproject.Database;


import java.sql.Connection;
import java.sql.DriverManager;

import org.nimhans.NIMHANSproject.Config.ConfigFile;

public class DatabaseConnection {
	public Connection getConnection() throws Exception{
		try{
			ConfigFile confFile =new ConfigFile();
			
			String userName=confFile.dbUserName;
			String password=confFile.dbPassword;
			
			System.out.println("USERNAME : "+userName);
			String connectionURL = "jdbc:mysql://localhost/NIMHANS_db";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, userName, password);
		//	connection = DriverManager.getConnection(connectionURL, "root", "qwerty");
			//put mysql pwd here
			return connection;
			}
		catch(Exception e){
			throw e;
		}
	 
	}
}
