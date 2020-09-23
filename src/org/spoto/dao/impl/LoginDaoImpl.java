package org.spoto.dao.impl;


import org.spoto.dao.LoginDao;
import org.spoto.utils.JdbcUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDaoImpl implements LoginDao {
    @Override
    public boolean doLogin(String name, String pwd, String user_type) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = JdbcUtils.getConnection();
            //查询语句中加binary可以区分大小写！
            //也可以在建表时这样写 create table some_table(str char(20) binary)
            ps = con.prepareStatement("select count(*) from users where binary uname = ? and upwd = ? and role = ?");
            //设置参数
            ps.setString(1,name);
            ps.setString(2,pwd);
            ps.setString(3,user_type);
            //执行
            rs = ps.executeQuery();
            while (rs.next()){
                int r = rs.getInt(1);
                System.out.println("r"+"==="+r);
                if (r == 1){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭数据库
            JdbcUtils.close(con,ps,rs);
        }
        return false;
    }
}
