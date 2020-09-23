package org.spoto.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

/**
 * 数据库链接工具
 */
public class JdbcUtils {
    public static Connection getConnection(){
        try {
            //1.读取db.properties配置文件中数据
            InputStream is = JdbcUtils.class.getClassLoader().getResourceAsStream("db.properties");
            Properties ps = new Properties();
            ps.load(is);

            String a = ps.getProperty("a");
            String url = ps.getProperty("url");
            String user = ps.getProperty("user");
            String password = ps.getProperty("password");

            //2.加载驱动
            Class.forName(a);
            //3.链接数据库
            Connection con = DriverManager.getConnection(url,user,password);
            return con;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**关闭资源
     *
     * @param con 链接
     * @param ps  PreparedStatement
     */
    public static void close(Connection con, PreparedStatement ps){
        close(con, ps,null);
    }

    /**关闭资源
     *
     * @param con 链接
     * @param ps  PreparedStatement
     * @param rs  ResultSet
     */
    public static void close(Connection con, PreparedStatement ps, ResultSet rs){
        //6.关闭
        try {
            if(rs !=null ){
                rs.close();
            }
            if(ps !=null ){
                ps.close();
            }
            if(con !=null ){
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
