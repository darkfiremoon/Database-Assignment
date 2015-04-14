import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class Author {
	
	public static void ViewAuthor() throws SQLException{
		
		Connection dbConnection = null;
		Statement myStatement = null;
		
		dbConnection = MyDB.getDBConnection();
		myStatement = dbConnection.createStatement();
		ResultSet rs = myStatement.executeQuery("select * from t_mt_author");
		
		System.out.println("Author Details : \n");
		while(rs.next()){
			
			
			System.out.println(rs.getString("NAME") + "     " + rs.getString("ADDRESS")+ 
							   rs.getString("PHONE")+ "     " + rs.getString("EMAIL")+
							   rs.getString("CODE"));
			
		}
		
	}
	

	public static void AddAuthor() throws SQLException{
		
		Connection dbConnection = null;
		CallableStatement callableStatement = null;
		
		String addAuthor = "{ call P_ADD_AUTHOR(?,?,?,?,?)}";
		dbConnection = MyDB.getDBConnection();
		callableStatement = dbConnection.prepareCall(addAuthor);
		Scanner input = new Scanner(System.in);
		String aname = null;
		String address = null;
		String phone = null;
		String email = null;
		String code = null;
		
		try {
			
			System.out.println("Please enter author name");
			aname = input.nextLine();
			System.out.println("Please enter author address");
			address = input.nextLine();
			System.out.println("Please enter author phone");
			phone = input.nextLine();
			System.out.println("Please enter author email");
			email = input.nextLine();
			System.out.println("Please enter author code");
			code = input.nextLine();
			
			callableStatement.setString(1, aname);
			callableStatement.setString(2, address);
			callableStatement.setString(3, phone);
			callableStatement.setString(4, email);
			callableStatement.setString(5, code);
			
			int result = callableStatement.executeUpdate();
			if (result > 0){
			System.out.println("Added successfully!!!");
			}
			
		} catch (SQLException e) {
			 
			System.out.println(e.getMessage());
 
		} finally {
 
			if (callableStatement != null) {
				callableStatement.close();
			}
 
			if (dbConnection != null) {
				dbConnection.close();
			}
 
		} 
		input.close();
	}
	
}
