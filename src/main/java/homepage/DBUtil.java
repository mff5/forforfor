package homepage;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtil {
        public static Connection getConnection() {
            Connection con = null;
            try {
                String filePath = "D:\\project-homepage\\src\\main\\java\\homepage\\homepage.properties";

                Properties properties = new Properties();
                properties.load(new FileReader(filePath));

                String driver = properties.getProperty("driver");
                String url = properties.getProperty("url");
                String user = properties.getProperty("user");
                String password = properties.getProperty("password");

                Class.forName(driver);
                con = DriverManager.getConnection(url,user,password);

                return con;
            } catch (Exception e)   {
                e.printStackTrace();
                System.out.println("접속중 오류발생");
            }
            return con;
        }
}
