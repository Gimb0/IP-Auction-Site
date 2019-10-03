import java.io.File;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUtils {
    private Connection dbConn;
    DbUtils() {
        try {
            dbConn = DriverManager.getConnection("jdbc:sqlite:auction.db");
            File f = new File("auction.db");
            if(!f.exists()) 
                createTables();
            
        } catch(Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }

    private void createTables() {
        Statement s = dbConn.createStatement();
        String sql = "CREATE TABLE Items (
            ItemID INT PRIMARY KEY,
            Name TEXT,
            Description TEXT,
            Image TEXT,
            Category TEXT,
            Price ,
            EndDate 
        )";
    }
}