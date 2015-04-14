import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Authentication {

	public static boolean Checking(String username, String password) throws SQLException{
		
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		//String sql = " select * from T_MT_EMPLOYEE";
		String sql = " select * from T_MT_EMPLOYEE where username = ? AND epassword = ? ";
		//String sql = "select * from  T_MT_EMPLOYEE where  USERNAME = '" + username +"' AND EPASSWORD = '" + password + "'";
		//String sql = "select * from T_MT_EMPLOYEE where username = 'darkfire'";
		//String sql = "select * from  T_MT_EMPLOYEE where ( USERNAME = '" + username +"') ";
		//System.out.println(sql);
		boolean found = false;
		try{
			/*
			Connection db1Connection =  null;
			Statement myStatement = null;
			
			
			db1Connection = MyDB.getDBConnection();
			
			myStatement = db1Connection.createStatement();
			*/
			
			dbConnection = MyDB.getDBConnection();
			
			preparedStatement = dbConnection.prepareStatement(sql);
			//ERORR
			//IS
			//HERE
			
			preparedStatement.setString(1, username);
			
			preparedStatement.setString(2, password);
			
			//System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			//ResultSet rs = myStatement.executeQuery("select * from t_mt_employee");
			//System.out.println(rs.getString("username"));
			
			while (rs.next()){
				System.out.println(rs.getString("username"));
				System.out.println(rs.getString("epassword"));
				found = true;
			}
			
			
			
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
 
			if (preparedStatement != null) {
				preparedStatement.close();
			}
 
			if (dbConnection != null) {
				dbConnection.close();
			}
 
		}
		
		return found;
		
		
	}
	
	public static String ReturnRoleID(String username, String password) throws SQLException{
		
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		String sql = "select * from T_MT_EMPLOYEE where username = ? AND epassword = ? ";
		String role = null;
		
		dbConnection = MyDB.getDBConnection();
		preparedStatement = dbConnection.prepareStatement(sql);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		
		ResultSet rs = preparedStatement.executeQuery();
		if (rs.next()){
			role = rs.getString("ROLE_ID");
		}
		
		return role;
		
	}
	
	public static String ReturnRole(String role_id) throws SQLException{
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		String sql = "select role from T_MT_ROLE where id = '" + role_id + "'";
		String role = null;
		
		dbConnection = MyDB.getDBConnection();
		preparedStatement = dbConnection.prepareStatement(sql);
		
		ResultSet rs = preparedStatement.executeQuery();
		
		rs.next();
		role = rs.getString("ROLE");
		
		return role;
	}
}
