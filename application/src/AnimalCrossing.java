import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AnimalCrossing {
  private static Connection con;
  private static Scanner in;
  private static String user;

  public static void main(String[] args) {
    in = new Scanner(System.in);
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      // Prompt the user for their MySQL username and password
      /*System.out.print("username: ");
      String username = in.nextLine();
      System.out.print("password: ");
      String password = in.nextLine();
      System.out.println();*/
      String username = "root";
      String password = "H0ppySandy!";
      con = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/animalCrossing?", username, password);

      login();
      System.out.println("Welcome back!");
      gameplay();
      System.out.println("Goodbye!");
      con.close();
      System.exit(0);
    } catch (ClassNotFoundException e) {
      System.out.println("couldn't connect to driver");
    } catch (SQLException e) {
      System.out.println("SQLException: " + e.getMessage());
    }
  }

  private static void login() {
    String command;
    boolean signedin = false;
    while (!signedin) {
      System.out.println("...\nWelcome to Animal Crossing!\nCommands:\n"
              + "[NEW] to create a new account\n"
              + "[LOGIN] to log in with an existing account\n"
              + "[Q] to exit the game");
      command = in.nextLine();
      switch ((command.toLowerCase())) {
        case "new":
          // add new user to ac
          try {
            System.out.println("What would you like as your username?");
            String newUser = in.nextLine();
            System.out.println("Password?");
            String newPassword = in.nextLine();
            System.out.println("What would you like your character's name to be?");
            String newCharacterN = in.nextLine();
            CallableStatement addUser = con.prepareCall("{call addUser(?,?,?)}");
            addUser.setString(1, newUser);
            addUser.setString(2, newPassword);
            addUser.setString(3, newCharacterN);
            addUser.execute();
            System.out.println("...");
          }
          catch (SQLException e) {
            System.out.println("Oh no! Adding new user failed! There must be someone else with "
                    + "that username :(");
          }
          break;
        case "login":
          try {
            System.out.println("Username:");
            user = in.nextLine();
            System.out.println("Password:");
            String pass = in.nextLine();
            PreparedStatement login = con.prepareStatement("SELECT login(?,?);");
            login.setString(1, user);
            login.setString(2,pass);
            ResultSet result = login.executeQuery();
            result.next();
            if (result.getBoolean(1)) {
              signedin = true;
            }
            else {
              System.out.println("Login failed!");
            }
          }
          catch (SQLException e) {
            e.printStackTrace();
          }
          break;
        case "q":
          System.out.println("Goodbye!");
          System.exit(0);
        default:
          System.out.println("Oh no! Invalid command! Please try again.");
      }
    }
  }

  private static void gameplay() {
    String command;
    boolean run = true;
    while (run) {
      System.out.println("...\nWhat would you like to do?\nCommands:\n"
              + "[BUY] to buy an item\n"
              + "[GIVE] to give an item to a villager\n"
              + "[ACCOUNT] to get account info\n"
              + "[Q] to log out");
      command = in.nextLine();
      switch(command.toLowerCase()) {
        case "buy":
          // buy item
          printAllItems();
          try {
            PreparedStatement accountBal =
                    con.prepareStatement("SELECT account_bal FROM ac_user WHERE username = \'" + user + "\';");
            ResultSet result = accountBal.executeQuery();
            result.next();
            System.out.println("\nWhat would you like to buy?"
                    + "\nAccount Balance: $" + result.getString(1));
            String item = in.nextLine();
            CallableStatement buyItem = con.prepareCall("{call buyItem(?,?)}");
            buyItem.setString(1, item);
            buyItem.setString(2, user);
            // buyItem.e
            if (buyItem.execute()) {
              System.out.println("Item bought!");
            }
            else {
              System.out.println("Item doesn't exist!");
            }
          } catch (SQLException e) {
            e.printStackTrace();
          }

          break;
        case "give":
          // give item to a villager
          break;
        case "account":
          // get info on yourself
          try {
            System.out.println("Account Information:");
            PreparedStatement account =
                    con.prepareStatement("SELECT * FROM ac_user WHERE username = \'" + user + "\';");
            ResultSet result = account.executeQuery();
            result.next();
            System.out.println("Username: " + result.getString(1));
            System.out.println("Character Name: " + result.getString(3));
            System.out.println("Account Balance: " + result.getString(4));
            // print out what they own
          } catch (SQLException e) {
            e.printStackTrace();
          }
          break;
        case "q":
          run = false;
          break;
        default:
          System.out.println("Oh no! Invalid command! Please try again.");
      }
    }
  }

  private static void printAllItems() {
    try {
      System.out.println("Furniture:");
      PreparedStatement furniture = con.prepareStatement(
              "SELECT furnitureName, cost, area, style, color FROM furniture \n"
                      + "JOIN item ON itemName = furnitureName;");
      // add in furniture and clothing distinction
      ResultSet result = furniture.executeQuery();

      List<String> allFurniture = new ArrayList<>();
      while (result.next()) {
        allFurniture.add(result.getString(1)
                + " -- $" + result.getString(2)
                + ", Area: " + result.getString(3)
                + ", Style: " + result.getString(4)
                + ", Color: " + result.getString(5));
      }
      for (String s : allFurniture) {
        System.out.print(s + "\n");
      }
      System.out.println("\nClothing:");
      PreparedStatement clothing = con.prepareStatement(
              "SELECT clothingName, cost, length, style, color FROM clothing \n"
              + "JOIN item ON itemName = clothingName;");
      result = clothing.executeQuery();
      List<String> allClothing = new ArrayList<>();
      while (result.next()) {
        allClothing.add(result.getString(1)
                + " -- $" + result.getString(2)
                + ", Length: " + result.getString(3)
                + ", Style: " + result.getString(4)
                + ", Color: " + result.getString(5));
      }
      for (String s : allClothing) {
        System.out.print(s + "\n");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
