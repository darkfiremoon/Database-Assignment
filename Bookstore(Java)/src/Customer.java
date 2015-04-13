import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;


public class Customer {

	public static void AddCustomer() throws SQLException{
		Connection dbConnection = null;
		CallableStatement callableStatement = null;
		
 
		String addCustomer = "{call P_ADD_CUST(?,?,?,?,?,?,?,?,?)}";
		dbConnection = MyDB.getDBConnection(); 
		callableStatement = dbConnection.prepareCall(addCustomer);
		Scanner input = new Scanner(System.in);
		Scanner input_int = new Scanner(System.in);
		String cname = null;
		String DOB = null;
		String address = null;
		String phone_number = null;
		String email = null;
		int period = 0;
		String username = null;
		String password = null;
		String code = null;
		
		try {
			
 
			System.out.println("Please enter customer name");
			cname = input.nextLine();
			System.out.println("Please enter customer DOB");
			DOB = input.nextLine();
			System.out.println("Please enter customer address");
			address = input.nextLine();
			System.out.println("Please enter customer phone number");
			phone_number = input.nextLine();
			System.out.println("Please enter customer email");
			email = input.nextLine();
			System.out.println("Please enter customer period validity");
			period = input_int.nextInt();
			System.out.println("Please enter customer username");
			username = input.nextLine();
			System.out.println("Please enter customer password");
			password = input.nextLine();
			System.out.println("Please enter customer code");
			code = input.nextLine();
			
			
			callableStatement.setString(1, cname);
			callableStatement.setString(2, DOB);
			callableStatement.setString(3, address);
			callableStatement.setString(4, phone_number);
			callableStatement.setString(5, email);
			callableStatement.setInt(6, period);
			callableStatement.setString(7, username);
			callableStatement.setString(8, password);
			callableStatement.setString(9, code);
			
 
			
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
		input_int.close();
	}
	
	
	
}
