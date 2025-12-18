package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDatabase {

	public static Connection connectDB() {

		String url = "jdbc:mysql://localhost:3306/Mylibrary?serverTimezone=GMT%2B8";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			System.err.println("错误：找不到MySQL驱动");
            System.err.println("请确保mysql-connector-java.jar在classpath中");
            e.printStackTrace();
		}

		Connection con = null;

		try {
			con = DriverManager.getConnection(url, "root", "1234");
		} catch (SQLException e) {
		}

		return con;
	}
}
