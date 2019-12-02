import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Village {
  private static Connection con;
  private static Scanner in;
  private static String user;
  private static Random r;

  public static void main(String[] args) {
    in = new Scanner(System.in);
    r = new Random();
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      // Prompt the user for their MySQL username and password
      /*System.out.print("username: ");
      String username = in.nextLine();
      System.out.print("password: ");
      String password = in.nextLine();
      System.out.println();*/
      String username = "root";
      String password = "root";
      con = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/village?", username, password);

      setup();
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

  private static void setup() {
    String command;
    boolean signedin = false;
    while (!signedin) {
      System.out.println("...\nWelcome to Village!\nCommands:\n"
              + "[NEW] to create a new account\n"
              + "[LOGIN] to log in with an existing account\n"
              + "[DELETE] to delete your account\n"
              + "[Q] to exit the game");
      command = in.nextLine();
      switch ((command.toLowerCase())) {
        case "new":
          addNewUser();
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
        case "delete":
          deleteAccount();
          break;
        case "q":
          System.out.println("Goodbye!");
          System.exit(0);
        default:
          System.out.println("Oh no! Invalid command! Please try again.");
      }
    }
  }


  private static void addNewUser() {
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
  }

  private static void deleteAccount() {
    try {
      System.out.println("Username:");
      user = in.nextLine();
      System.out.println("Password:");
      String pass = in.nextLine();
      if (isValidUsernameAndPass(user, pass)) {
        PreparedStatement delete =
            con.prepareStatement("DELETE FROM users WHERE username = \"" + user
                + "\" AND pword = \"" + pass + "\";");
        delete.execute();
        System.out.println("Account deleted");
      }
      else {
        System.out.println("Invalid username or password");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  private static boolean isValidUsernameAndPass(String username, String password) {
    try {
      PreparedStatement users = con.prepareStatement("SELECT username, pword FROM users;");
      ResultSet allUsers = users.executeQuery();
      while (allUsers.next()) {
        if (username.equals(allUsers.getString(1))
            && password.equals(allUsers.getString(2))) {
          return true;
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  private static void gameplay() {
    String command;
    boolean run = true;
    System.out.println("...");
    while (run) {
      System.out.println("What would you like to do?\nCommands:\n"
          + "[BUY] to buy an item\n"
          + "[GIVE] to give an item to a villager\n"
          + "[FISH] to go fishing and earn some money\n"
          + "[ACCOUNT] to get account info\n"
          + "[VILLAGERS] to get information on the villagers in your town\n"
          + "[Q] to log out");
      command = in.nextLine();
      switch(command.toLowerCase()) {
      case "buy":
        printAllItems();
        buyItems();
        break;
      case "give":
        giveItem();
        break;
      case "fish":
        fish();
        break;
      case "account":
        printAccountInfo();
        break;
      case "villagers":
        System.out.println("Here are all the villagers in your town:");
        printAllVillagers();
        break;
      case "q":
        run = false;
        break;
      default:
        System.out.println("Oh no! Invalid command! Please try again.");
      }
      System.out.println("...");
    }
  }

  private static void printAllItems() {
    try {
      System.out.println("Furniture:");
      PreparedStatement furniture = con.prepareStatement(
          "SELECT furnitureName, cost, color1, color2, style FROM furniture \n"
              + "JOIN item ON itemName = furnitureName;");
      // add in furniture and clothing distinction
      ResultSet result = furniture.executeQuery();

      List<String> allFurniture = new ArrayList<>();
      while (result.next()) {
        allFurniture.add(result.getString(1)
            + " -- $" + result.getString(2)
            + " | Color1: " + result.getString(3)
            + " | Color2: " + result.getString(4)
            + " | Style: " + result.getString(5));
      }
      for (String s : allFurniture) {
        System.out.print(s + "\n");
      }
      System.out.println("\nClothing:");
      PreparedStatement clothing = con.prepareStatement(
          "SELECT clothingName, cost, length, style FROM clothing \n"
              + "JOIN item ON itemName = clothingName;");
      result = clothing.executeQuery();
      List<String> allClothing = new ArrayList<>();
      while (result.next()) {
        allClothing.add(result.getString(1)
            + " -- $" + result.getString(2)
            + " | Length: " + result.getString(3)
            + " | Style: " + result.getString(4));
      }
      for (String s : allClothing) {
        System.out.print(s + "\n");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  private static void buyItems() {
    try {
      PreparedStatement accountBal =
          con.prepareStatement("SELECT account_bal FROM users WHERE username = \'" + user + "\';");
      ResultSet result = accountBal.executeQuery();
      result.next();
      System.out.println("\nWhat would you like to buy?"
          + "\nAccount Balance: $" + result.getString(1));
      String item = in.nextLine();
      if (isValidItem(item)) {
        PreparedStatement buyItem = con.prepareCall("SELECT buyItem(?,?);");
        buyItem.setString(1, item);
        buyItem.setString(2, user);
        ResultSet rs = buyItem.executeQuery();
        rs.next();
        System.out.println(rs.getString(1));
      }
      else {
        System.out.println("Item doesn't exist!");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  private static void printUserItems() {
    try {
      System.out.println("Furniture:");
      PreparedStatement furniture = con.prepareStatement(
          "SELECT furnitureName, cost, color1, color2, style FROM userItems \n"
              + "JOIN item ON itemName = item "
              + "JOIN furniture ON furnitureName = item "
              + "WHERE username = \"" + user + "\";");
      // add in furniture and clothing distinction
      ResultSet result = furniture.executeQuery();

      List<String> allFurniture = new ArrayList<>();
      while (result.next()) {
        allFurniture.add(result.getString(1)
            + " -- $" + result.getString(2)
            + " | Color1: " + result.getString(3)
            + " | Color2: " + result.getString(4)
            + " | Style: " + result.getString(5));
      }
      for (String s : allFurniture) {
        System.out.print(s + "\n");
      }
      System.out.println("\nClothing:");
      PreparedStatement clothing = con.prepareStatement(
          "SELECT clothingName, cost, length, style FROM userItems \n"
              + "JOIN item ON itemName = item "
              + "JOIN clothing ON clothingName = item "
              + "WHERE username = \"" + user + "\";");
      result = clothing.executeQuery();
      List<String> allClothing = new ArrayList<>();
      while (result.next()) {
        allClothing.add(result.getString(1)
            + " -- $" + result.getString(2)
            + " | Length: " + result.getString(3)
            + " | Style: " + result.getString(4));
      }
      for (String s : allClothing) {
        System.out.print(s + "\n");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  private static boolean isValidItem(String item) {
    try {
      PreparedStatement items = con.prepareStatement(
          "SELECT itemName FROM item;");
      ResultSet result = items.executeQuery();
      while (result.next()) {
        if (item.equals(result.getString(1))) {
          return true;
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  private static void giveItem() {
    try {
      printAllVillagers();
      System.out.println("Which villager would you like to give an item?");
      String villager = in.nextLine();
      if (!isValidVillager(villager)) {
        throw new IllegalArgumentException("You gave the name of a villager "
            + "that doesn't exist!");
      }

      printUserItems();
      System.out.println("Which item would you like to give them?");
      String item = in.nextLine();
      if (!isValidUserItem(item)) {
        throw new IllegalArgumentException("You don't have this item!");
      }
      PreparedStatement give = con.prepareStatement("SELECT giveToVillager(?,?,?)");
      give.setString(1,villager);
      give.setString(2,user);
      give.setString(3,item);
      ResultSet result = give.executeQuery();
      result.next();
      if (result.getBoolean(1)) {
        System.out.println("The villager liked your gift!");
      }
      else {
        System.out.println("The villager did not like your gift!");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } catch (IllegalArgumentException e) {
      System.out.println(e.getMessage());
    }
  }

  private static void printAllVillagers() {
    try {
      PreparedStatement villagers = con.prepareStatement("SELECT * FROM villager;");
      ResultSet allVillagers = villagers.executeQuery();
      while (allVillagers.next()) {
        System.out.println(allVillagers.getString(1)
            + " -- Birthday: " + allVillagers.getString(2)
            + ", Preferred Style: " + allVillagers.getString(3)
            + ", Preferred Color: " + allVillagers.getString(4));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

  }

  private static boolean isValidVillager(String villager) {
    try {
      PreparedStatement villagers = con.prepareStatement("SELECT villager_name FROM villager;");
      ResultSet result = villagers.executeQuery();
      while (result.next()) {
        if (villager.equals(result.getString(1))) {
          return true;
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  private static boolean isValidUserItem(String item) {
    try {
      PreparedStatement items = con.prepareStatement(
          "SELECT item FROM userItems WHERE username = \"" + user + "\";");
      ResultSet result = items.executeQuery();
      while (result.next()) {
        if (item.equals(result.getString(1))) {
          return true;
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  private static void fish() {
    int earned = r.nextInt(5);
    int deposit = 0;
    String command;
    boolean fishing = true;
    System.out.println("You approach the pier. Go fishing? \n"
        + "[YES] to go fishing\n" + 
        "[NO] to not go fishing\n" + 
        "[QUIT] to go back to the main menu\n");
    while(fishing) {
      command = in.nextLine();
      switch(command.toLowerCase()) {
      case "yes":
        fishingWithASCII(earned);
        break;
      case "no":
        System.out.println("You don't go fishing.");
        gameplay();
        break;
      case "quit":
        gameplay();
        break;
      default:
        System.out.println("Oh no! Invalid command! Please try again.");
      }
      System.out.println("...");
      fishing = false;
    }
    switch (earned) {
    case 0:
      System.out.println("You didn't catch anything :(");
      break;
    case 1:
      System.out.println("You caught a goldfish!\nYou earned $5.");
      deposit = 5;
      break;
    case 2:
      System.out.println("You caught a trout!\nYou earned $10.");
      deposit = 10;
      break;
    case 3:
      System.out.println("You caught a sturgeon!\nYou earned $20.");
      deposit = 20;
      break;
    case 4:
      System.out.println("You caught a whale!\nYou earned $50.");
      deposit = 50;
      break;
    default:

    }
    try {
      CallableStatement addToAccount = con.prepareCall("{call payUser(?,?)}");
      addToAccount.setString(1, user);
      addToAccount.setInt(2,deposit);
      addToAccount.execute();

      PreparedStatement accountBal =
          con.prepareStatement("SELECT account_bal FROM users "
              + "WHERE username = \"" + user + "\";");
      ResultSet balance = accountBal.executeQuery();
      balance.next();
      System.out.println("You have $" + balance.getString(1)
      + " in your account");
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  private static void fishingWithASCII(int size) {
    System.out.println(""
        + "              /==\\                              \n  " +  
        "           | ツ |                                \n" + 
        "              \\__/     /\\                       \n" + 
        "______________/|\\_____/__\\___          \n" + 
        "             / | \\   /    \\ /|                           \n" + 
        "            /  |  \\ /      \\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\                  \n" + 
        "           o   /\\  o      / \\                      \n" + 
        "              /  \\       /   \\                          \n" + 
        "             /    \\     /     \\            /\\/\\/\\/\\/\\             /\\/\\/\\/\\/\\ \n" + 
        "=======================/       \\                         \n" +  
        "                       |        ø                         \n" + 
        "                       ~                                 /\\/\\/\\/\\/\\\n" + 
        "        /\\/\\/\\/\\/\\                                                                                                 \n" + 
        "                                                                                                                          \n" + 
        "       \n" + 
        "                                               \n" + 
        "");
    
  }
  private static void printAccountInfo() {
    try {
      System.out.println("Account Information:");
      PreparedStatement account =
          con.prepareStatement("SELECT * FROM users WHERE username = "
              + "\'" + user + "\';");
      ResultSet result = account.executeQuery();
      result.next();
      System.out.println("Username: " + result.getString(1));
      System.out.println("Character Name: " + result.getString(3));
      System.out.println("Account Balance: " + result.getString(4));

      // print out what they own
      PreparedStatement furniture =
          con.prepareStatement("\n"
              + "SELECT item, style, color1, color2 FROM userItems "
              + "JOIN item ON itemName = item "
              + "JOIN furniture ON furnitureName = item "
              + "WHERE username = \'" + user + "\';");
      ResultSet userFurniture = furniture.executeQuery();
      System.out.println("Here is all the furniture you own:");
      while (userFurniture.next()) {
        System.out.println(userFurniture.getString(1)
            + " -- Style: " + userFurniture.getString(2)
            + " | Color1: " + userFurniture.getString(3)
            + " | Color2: " + userFurniture.getString(4));
      }
      PreparedStatement clothing =
          con.prepareStatement("\n"
              + "SELECT item, style, length FROM userItems "
              + "JOIN item ON itemName = item "
              + "JOIN clothing ON clothingName = item "
              + "WHERE username = \'" + user + "\';");
      ResultSet userClothing = clothing.executeQuery();
      System.out.println("Here is all the clothing you own:");
      while (userClothing.next()) {
        System.out.println(userClothing.getString(1)
            + " -- Style: " + userClothing.getString(2)
            + " | Length: " + userClothing.getString(3));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
