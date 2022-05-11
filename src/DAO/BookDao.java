package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entity.Book;
public class BookDao {
    public ArrayList queryBooks() throws SQLException {
        ArrayList books = new ArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/product?characterEncoding=UTF-\n" +
                            "8&serverTimezone=UTC&useSSL=false", "root", "root");
            Statement stat = conn.createStatement();
            String sql = "select * from Book where 1=1 ";
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setName(rs.getString("name"));
                book.setPrice(rs.getDouble("price"));
                books.add(book);
            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return books;
    }
}