import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;


public class Discount {

	public static void AddDiscount() throws SQLException{
		
		Connection dbConnection = null;
		CallableStatement callableStatement = null;
		
		String addDiscount = "{call P_ADD_DISCOUNT (?,?,?,?,?)}";
		dbConnection = MyDB.getDBConnection();
		callableStatement = dbConnection.prepareCall(addDiscount);
		Scanner input = new Scanner(System.in);
		Scanner input_int = new Scanner(System.in);
		String title = null;
		String discount_type = null;
		int amount = 0;
		String description = null;
		String code = null;
		
		try{
			
			
			System.out.println("Please enter discount title");
			title = input.nextLine();
			System.out.println("Please enter discount discount_type");
			discount_type = input.nextLine();
			System.out.println("Please enter discount amount");
			amount = input_int.nextInt();
			System.out.println("Please enter discount description");
			description = input.nextLine();
			System.out.println("Please enter discount code");
			code = input.nextLine();
			
			callableStatement.setString(1, title);
			callableStatement.setString(2, discount_type);
			callableStatement.setInt(3, amount);
			callableStatement.setString(4, description);
			callableStatement.setString(5, code);
			
			int result = callableStatement.executeUpdate();
			if (result > 0){
			System.out.println("Added successfully!!!");
			}
 
			
		}catch (SQLException e) {
				 
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
	

