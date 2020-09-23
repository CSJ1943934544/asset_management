package org.spoto.dao;

public interface LoginDao {
    boolean doLogin(String name,String pwd,String user_type);
}
