package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/LectureEvaluation?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			return DriverManager.getConnection(dbURL, dbID, dbPW);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
}
