package com.agv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracalDatabaseConnect {

	public Connection Connect() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","123");

	}

	public static int rowCount(ResultSet rs) throws SQLException {
		rs.last();
		return rs.getRow();
	}

}
