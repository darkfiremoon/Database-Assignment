import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class MainFunc {
	

	
		
	public static void main(String args[]) throws SQLException{
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		String username = null;
		String password = null;
		String select_table = null;
		String option = null;
		String role = null;
		boolean result = false;
			
		
		String user_option = null;
		Scanner input = new Scanner (System.in);
		
		System.out.println("Welcome to ZettaBytes BookStore Management System");
		System.out.println("\n Please enter your username: ");
		username = input.nextLine();
		System.out.println("\n Please enter your password: ");
		password = input.nextLine();
		result = Authentication.Checking(username, password);
		System.out.println(result);
		if (result == true){
			
			role = Authentication.ReturnRoleID(username, password);
			System.out.println(role);
			role = Authentication.ReturnRole(role);
			System.out.println(role);
			if (role.equals("Manager")){
				
				System.out.println("\n Which tables would you like to look for?");
				System.out.println("\n 1. \t Book Table");
				System.out.println("\n 2. \t Book Type Table");
				System.out.println("\n 3. \t Statinery Table");
				System.out.println("\n 4. \t Statinery Type Table");
				System.out.println("\n 5. \t Supplier Table");
				System.out.println("\n 6. \t Supplier Type Table");
				System.out.println("\n 7. \t Publication Table");
				System.out.println("\n 8. \t Author Table");
				System.out.println("\n 9. \t Customer Table");
				System.out.println("\n 10.\t Discount Table");
				System.out.println("\n 11.\t Transaction Table");
				System.out.println("\n 12.\t Transaction Type Table");
				System.out.println("\n 13.\t Employee Table");
				System.out.println("\n 14.\t Role Table");
				
				select_table = input.nextLine();
				System.out.println("\n\n\n\n\nSelect an option :");
				System.out.println("\n 1. View Records");
				System.out.println("\n 2. Add a Record");
				System.out.println("\n 3. Update a Record");
				System.out.println("\n 4. Delete a Record");
				option = input.nextLine();
				switch (select_table){
				
				case "1":{
					
					switch (option){
					case "1":{
						break;
					}
					case "2":{
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					
					break;
				}
				case "2":{
					switch (option){
					case "1":{
						break;
					}
					case "2":{
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					break;
				}
				case "3":{
					switch (option){
					case "1":{
						break;
					}
					case "2":{
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					break;
				}
				case "4":{
					switch (option){
					case "1":{
						break;
					}
					case "2":{
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					break;
				}
				case "5":{
					break;
				}
				case "6":{
					break;
				}
				case "7":{
					break;
				}
				case "8":{
					switch (option){
					case "1":{
						Author.ViewAuthor();
						break;
					}
					case "2":{
						Author.AddAuthor();
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					break;
				}
				case "9":{
					switch (option){
					case "1":{
						break;
					}
					case "2":{
						Customer.AddCustomer();
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					break;
				}
				case "10":{
					switch (option){
					case "1":{
						break;
					}
					case "2":{
						Discount.AddDiscount();
						break;
					}
					case "3":{
						break;
					}
					case "4":{
						break;
					}
					}
					break;
				}
				case "11":{
					break;
				}
				case "12":{
					break;
				}
				case "13":{
					break;
				}
				case "14":{
					break;
				}
			}
				
				
			}else {
				System.out.println("\n Which tables would you like to look for?");
				System.out.println("\n 1. Book Table");
				System.out.println("\n 2. Book Type Table");
				System.out.println("\n 3. Statinery Table");
				System.out.println("\n 4. Statinery Type Table");
				System.out.println("\n 5. Supplier Table");
				System.out.println("\n 6. Supplier Type Table");
				System.out.println("\n 7. Publication Table");
				System.out.println("\n 8. Author Table");
				System.out.println("\n 9. Customer Table");
			}
		} else{
			System.out.println("Invalid Username or Password!");
			
		}
		
		
		
		
		/*
		System.out.println("Please select what you want to do");
		System.out.println("1. Add Record");
		System.out.println("2. Edit Record");
		System.out.println("3. Delete Record");
		System.out.println("4. View Record");
		user_option = input.nextLine();
		switch (user_option){
			
		case "1": {
			
			Customer.AddCustomer();
			break;
		}
			
			
			
		
		case "2":{
			break;
		}
		case "3":{
			break;
		}
		case "4":{
			try{
				
				myConn = MyDB.getDBConnection();
				System.out.println("Database connection successful! \n");
				
				myStmt = myConn.createStatement();
				
				myRs = myStmt.executeQuery("Select * from t_mt_role");
				
				while(myRs.next()){
					System.out.println(myRs.getString("id")+ "\t" + myRs.getString("cd") + "\t" + myRs.getString("role"));
				}
				
			} catch (Exception e){
				//It prints the stack trace of the exception to system.err
				//It is a very simple, but useful tool for diagnosing an Exception. 
				//It tell you what happened and where in the code this happend
				e.printStackTrace();
			}
		}
		default: break;
		
		}*/
		input.close();
		
	}
	
	
	
}
