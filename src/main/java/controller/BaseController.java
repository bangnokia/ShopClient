package controller;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BaseController {

    private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_CONNECTION = "jdbc:mysql://127.0.0.1:3306/project";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    private static Connection getDBConnection() {

        Connection dbConnection = null;

        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        try {
            dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
            return dbConnection;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return dbConnection;
    }

    public static void main(String[] args) {
        //Connection con = getDBConnection();
        getSkills();

//        if (con != null) {
//            System.out.println("connec ok");
//        }
//
//        Statement stmt;
//        try {
//            stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery("select * from image");
//            while (rs.next()) {
//                System.out.println(rs.getString(2) + "," + rs.getString(3));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(BaseController.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

    public static void getSkills() {
        // 
        String query = "{ call saveImage(?,?) }";
        ResultSet rs;

        try (Connection conn = getDBConnection();
                CallableStatement stmt = conn.prepareCall(query)) {

            stmt.setInt(1, 2); // biến truyền vào procedure
            
            stmt.registerOutParameter(2, java.sql.Types.VARCHAR); // khai báo kiểu truyền ra

            rs = stmt.executeQuery();

            System.out.println("image url:" + stmt.getString("b_name"));

            while (rs.next()) {
                System.out.println("image idpro:" + rs.getString("idProduct") + ", image url:" + rs.getString("url"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
